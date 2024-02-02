import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ftsolo/extensions/locale.dart';
import 'package:ftsolo/ui/component/ft_prompt_dialog.dart';
import 'package:ftsolo/utils/primitive_util.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/devices_util.dart';

const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
  encryptedSharedPreferences: true,
));

const kKeyBoxName = "ftsolo_box_name";
const kNoEncryptionWarningShownKey = "showedNoEncryptionWarning";
const kIsUsingEncryption = "isUsingEncryption";

String getBoxKey(String boxName) => "ftsolo_box_$boxName";

abstract class PersistedStateNotifier<T> extends StateNotifier<T> {
  final String cacheKey;
  final bool encrypted;

  FutureOr<void> initial() {}

  PersistedStateNotifier(
    super.state,
    this.cacheKey, {
    this.encrypted = false,
  }) {
    _load().then((_) => initial());
  }

  static late LazyBox _box;
  static late LazyBox _encryptedBox;

  static Future<void> showNoEncryptionDialog(BuildContext ctx) async {
    final localStorage = await SharedPreferences.getInstance();
    final wasShownAlready =
        localStorage.getBool(kNoEncryptionWarningShownKey) == true;
    if (wasShownAlready || !ctx.mounted) {
      return;
    }

    await showPromptDialog(
      ctx: ctx,
      title: ctx.l10n.failed_to_encrypt,
      message: ctx.l10n.encryption_failed_warning,
      cancelText: null,
    );
    await localStorage.setBool(kNoEncryptionWarningShownKey, true);
  }

  static Future<String?> read(String key) async {
    final localStorage = await SharedPreferences.getInstance();
    if (kIsMacOS || kIsIOS || (kIsLinux && !kIsFlatpak)) {
      return localStorage.getString(key);
    }
    try {
      await localStorage.setBool(kIsUsingEncryption, true);
      return await secureStorage.read(key: key);
    } catch (e) {
      await localStorage.setBool(kIsUsingEncryption, false);
      return localStorage.getString(key);
    }
  }

  static Future<void> write(String key, String value) async {
    final localStorage = await SharedPreferences.getInstance();
    if (kIsMacOS || kIsIOS || (kIsLinux && !kIsFlatpak)) {
      await localStorage.setString(key, value);
      return;
    }

    try {
      await localStorage.setBool(kIsUsingEncryption, true);
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      await localStorage.setBool(kIsUsingEncryption, false);
      await localStorage.setString(key, value);
    }
  }

  static Future<void> initializeBoxes({required String? path}) async {
    String? boxName = await read(kKeyBoxName);

    if (boxName == null) {
      boxName = "ftsolo-${PrimitiveUtils.uuid.v4()}";
      await write(kKeyBoxName, boxName);
    }
    String? encryptionKey = await read(getBoxKey(boxName));
    if (encryptionKey == null) {
      encryptionKey = base64Url.encode(Hive.generateSecureKey());
      await write(getBoxKey(boxName), encryptionKey);
    }

    _encryptedBox = await Hive.openLazyBox(
      boxName,
      encryptionCipher: HiveAesCipher(base64Url.decode(encryptionKey)),
    );

    _box = await Hive.openLazyBox(
      "ftsolo_cache",
      path: path,
    );
  }

  LazyBox get box => encrypted ? _encryptedBox : _box;

  Future<void> _load() async {
    final json = await box.get(cacheKey);
    if (json != null) {
      state = await fromJson(castNestedJson(json));
    }
  }

  Map<String, dynamic> castNestedJson(Map map) {
    return Map.castFrom<dynamic, dynamic, String, dynamic>(
        map.map((key, value) {
      if (value is Map) {
        return MapEntry(key, castNestedJson(value));
      } else if (value is Iterable) {
        return MapEntry(key, value.map((e) {
          if (e is Map) return castNestedJson(e);
          return e;
        }));
      }
      return MapEntry(key, value);
    }));
  }

  void save() async {
    await box.put(cacheKey, toJson());
  }

  FutureOr<T> fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  @override
  set state(T value) {
    if (state == value) return;
    super.state = value;
    save();
  }
}
