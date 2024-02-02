// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      audioQuality:
          $enumDecodeNullable(_$SourceQualitiesEnumMap, json['audioQuality']) ??
              SourceQualities.high,
      albumColorSync: json['albumColorSync'] as bool? ?? true,
      amoledDarkTheme: json['amoledDarkTheme'] as bool? ?? false,
      checkUpdate: json['checkUpdate'] as bool? ?? true,
      normalizeAudio: json['normalizeAudio'] as bool? ?? false,
      showSystemTrayIcon: json['showSystemTrayIcon'] as bool? ?? true,
      skipNonMusic: json['skipNonMusic'] as bool? ?? true,
      systemTitleBar: json['systemTitleBar'] as bool? ?? false,
      closeBehavior:
          $enumDecodeNullable(_$CloseBehaviorEnumMap, json['closeBehavior']) ??
              CloseBehavior.minimizeToTray,
      accentColorScheme: UserPreferences._accentColorSchemeReadValue(
                  json, 'accentColorScheme') ==
              null
          ? UserPreferences._defaultAccentColorScheme()
          : UserPreferences._accentColorSchemeFromJson(
              UserPreferences._accentColorSchemeReadValue(
                  json, 'accentColorScheme') as Map<String, dynamic>),
      layoutMode:
          $enumDecodeNullable(_$LayoutModeEnumMap, json['layoutMode']) ??
              LayoutMode.adaptive,
      locale: UserPreferences._localeReadValue(json, 'locale') == null
          ? UserPreferences._defaultLocaleValue()
          : UserPreferences._localeFromJson(
              UserPreferences._localeReadValue(json, 'locale')
                  as Map<String, dynamic>),
      downloadLocation: json['downloadLocation'] as String? ?? "",
      pipedInstance:
          json['pipedInstance'] as String? ?? "https://pipedapi.kavin.rocks",
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      discordPresence: json['discordPresence'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'audioQuality': _$SourceQualitiesEnumMap[instance.audioQuality]!,
      'albumColorSync': instance.albumColorSync,
      'amoledDarkTheme': instance.amoledDarkTheme,
      'checkUpdate': instance.checkUpdate,
      'normalizeAudio': instance.normalizeAudio,
      'showSystemTrayIcon': instance.showSystemTrayIcon,
      'skipNonMusic': instance.skipNonMusic,
      'systemTitleBar': instance.systemTitleBar,
      'closeBehavior': _$CloseBehaviorEnumMap[instance.closeBehavior]!,
      'accentColorScheme':
          UserPreferences._accentColorSchemeToJson(instance.accentColorScheme),
      'layoutMode': _$LayoutModeEnumMap[instance.layoutMode]!,
      'locale': UserPreferences._localeToJson(instance.locale),
      'downloadLocation': instance.downloadLocation,
      'pipedInstance': instance.pipedInstance,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'discordPresence': instance.discordPresence,
    };

const _$SourceQualitiesEnumMap = {
  SourceQualities.high: 'high',
  SourceQualities.medium: 'medium',
  SourceQualities.low: 'low',
};

const _$CloseBehaviorEnumMap = {
  CloseBehavior.minimizeToTray: 'minimizeToTray',
  CloseBehavior.close: 'close',
};

const _$LayoutModeEnumMap = {
  LayoutMode.compact: 'compact',
  LayoutMode.extended: 'extended',
  LayoutMode.adaptive: 'adaptive',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
