import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../themes/theme.dart';

part 'user_preferences.g.dart';

part 'user_preferences.freezed.dart';

@freezed
class UserPreferences with _$UserPreferences {
  static FtSoloColor _accentColorSchemeFromJson(Map<String, dynamic> json) {
    return FtSoloColor.fromString(json["color"]);
  }

  static Map<String, dynamic>? _accentColorSchemeReadValue(
      Map<dynamic, dynamic> json, String key) {
    if (json[key] is String) {
      return {"color": json[key]};
    }

    return json[key] as Map<String, dynamic>?;
  }

  static Map<String, dynamic> _accentColorSchemeToJson(FtSoloColor color) {
    return {"color": color.toString()};
  }

  static FtSoloColor _defaultAccentColorScheme() =>
      const FtSoloColor(0xFF2196F3, name: "Blue");

  static Locale _localeFromJson(Map<String, dynamic> json) {
    return Locale(json["languageCode"], json["countryCode"]);
  }

  static Map<String, dynamic> _localeToJson(Locale locale) {
    return {
      "languageCode": locale.languageCode,
      "countryCode": locale.countryCode,
    };
  }

  static Map<String, dynamic>? _localeReadValue(
      Map<dynamic, dynamic> json, String key) {
    if (json[key] is String) {
      final map = jsonDecode(json[key]);
      return {
        "languageCode": map["lc"],
        "countryCode": map["cc"],
      };
    }

    return json[key] as Map<String, dynamic>?;
  }

  static Locale _defaultLocaleValue() => const Locale("system", "system");

  const factory UserPreferences({
    @Default(SourceQualities.high) SourceQualities audioQuality,
    @Default(true) bool albumColorSync,
    @Default(false) bool amoledDarkTheme,
    @Default(true) bool checkUpdate,
    @Default(false) bool normalizeAudio,
    @Default(true) bool showSystemTrayIcon,
    @Default(true) bool skipNonMusic,
    @Default(false) bool systemTitleBar,
    @Default(CloseBehavior.minimizeToTray) CloseBehavior closeBehavior,
    @JsonKey(
      defaultValue: UserPreferences._defaultAccentColorScheme,
      fromJson: UserPreferences._accentColorSchemeFromJson,
      toJson: UserPreferences._accentColorSchemeToJson,
      readValue: UserPreferences._accentColorSchemeReadValue,
    )
    required FtSoloColor accentColorScheme,
    @Default(LayoutMode.adaptive) LayoutMode layoutMode,
    @JsonKey(
      defaultValue: UserPreferences._defaultLocaleValue,
      toJson: UserPreferences._localeToJson,
      fromJson: UserPreferences._localeFromJson,
      readValue: UserPreferences._localeReadValue,
    )
    required Locale locale,
    @Default("") String downloadLocation,
    @Default("https://pipedapi.kavin.rocks") String pipedInstance,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool discordPresence,
  }) = _UserPreferences;

  factory UserPreferences.withDefaults() {
    return UserPreferences.fromJson({});
  }

  factory UserPreferences.fromJson(Map<String, Object?> json) =>
      _$UserPreferencesFromJson(json);
}

enum SourceQualities {
  high,
  medium,
  low,
}

enum CloseBehavior {
  minimizeToTray,
  close,
}

enum LayoutMode {
  compact,
  extended,
  adaptive,
}
