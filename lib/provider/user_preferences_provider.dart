import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ftsolo/provider/palette_provider.dart';
import 'package:ftsolo/provider/persisted_state_notifier.dart';
import 'package:ftsolo/repo/entity/user_preferences.dart';
import 'package:ftsolo/themes/theme.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

import '../utils/devices_util.dart';

class UserPreferencesNotifier extends PersistedStateNotifier<UserPreferences> {
  final Ref ref;

  UserPreferencesNotifier(this.ref)
      : super(UserPreferences.withDefaults(), "preferences");

  void reset() {
    state = UserPreferences.withDefaults();
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  void setAccentColorScheme(FtSoloColor color) {
    state = state.copyWith(accentColorScheme: color);
  }

  void setAlbumColorSync(bool sync) {
    state = state.copyWith(albumColorSync: sync);

    if (!sync) {
      ref.read(paletteProvider.notifier).state = null;
    } else {
      //TODO:palette
      // ref.read(ProxyPlaylistNotifier.notifier).updatePalette();
    }
  }

  void setCheckUpdate(bool check) {
    state = state.copyWith(checkUpdate: check);
  }

  void setAudioQuality(SourceQualities quality) {
    state = state.copyWith(audioQuality: quality);
  }

  void setDownloadLocation(String downloadDir) {
    if (downloadDir.isEmpty) return;
    state = state.copyWith(downloadLocation: downloadDir);
  }

  void setLayoutMode(LayoutMode mode) {
    state = state.copyWith(layoutMode: mode);
  }

  void setCloseBehavior(CloseBehavior behavior) {
    state = state.copyWith(closeBehavior: behavior);
  }

  void setShowSystemTrayIcon(bool show) {
    state = state.copyWith(showSystemTrayIcon: show);
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }

  void setPipedInstance(String instance) {
    state = state.copyWith(pipedInstance: instance);
  }

  void setSkipNonMusic(bool skip) {
    state = state.copyWith(skipNonMusic: skip);
  }

  void setSystemTitleBar(bool isSystemTitleBar) {
    state = state.copyWith(systemTitleBar: isSystemTitleBar);
    if (DevicesOS.isDesktop) {
      windowManager.setTitleBarStyle(
          isSystemTitleBar ? TitleBarStyle.normal : TitleBarStyle.hidden);
    }
  }

  void setDiscordPresence(bool discordPresence) {
    state = state.copyWith(discordPresence: discordPresence);
  }

  void setAmoledDarkTheme(bool isAmoled) {
    state = state.copyWith(amoledDarkTheme: isAmoled);
  }

  void setNormalizeAudio(bool normalize) {
    state = state.copyWith(normalizeAudio: normalize);
    //TODO player
    //audioPlayer.setAudioNormalization(normalize);
  }

  Future<String> _getDefaultDownloadDirectory() async {
    //TODO: 路径
    if (kIsAndroid) return "/storage/emulated/0/Download/Ftsolo";

    if (kIsMacOS) {
      return path.join((await getLibraryDirectory()).path, "Caches");
    }

    return getDownloadsDirectory().then((dir) {
      return path.join(dir!.path, "Ftsolo");
    });
  }

  @override
  FutureOr<void> initial() async {
    if (state.downloadLocation.isEmpty) {
      state = state.copyWith(
        downloadLocation: await _getDefaultDownloadDirectory(),
      );
    }

    if (DevicesOS.isDesktop) {
      await windowManager.setTitleBarStyle(
        state.systemTitleBar ? TitleBarStyle.normal : TitleBarStyle.hidden,
      );
    }
    //TODO audioPlayer
    //await audioPlayer.setAudioNormalization(state.normalizeAudio);
  }

  @override
  FutureOr<UserPreferences> fromJson(Map<String, dynamic> json) {
    return UserPreferences.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return state.toJson();
  }
}

final userPreferencesProvider =
    StateNotifierProvider<UserPreferencesNotifier, UserPreferences>(
        (ref) => UserPreferencesNotifier(ref));
