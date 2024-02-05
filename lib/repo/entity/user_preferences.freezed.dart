// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  SourceQualities get audioQuality => throw _privateConstructorUsedError;
  bool get albumColorSync => throw _privateConstructorUsedError;
  bool get amoledDarkTheme => throw _privateConstructorUsedError;
  bool get checkUpdate => throw _privateConstructorUsedError;
  bool get normalizeAudio => throw _privateConstructorUsedError;
  bool get showSystemTrayIcon => throw _privateConstructorUsedError;
  bool get skipNonMusic => throw _privateConstructorUsedError;
  bool get systemTitleBar => throw _privateConstructorUsedError;
  CloseBehavior get closeBehavior => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: UserPreferences._defaultAccentColorScheme,
      fromJson: UserPreferences._accentColorSchemeFromJson,
      toJson: UserPreferences._accentColorSchemeToJson,
      readValue: UserPreferences._accentColorSchemeReadValue)
  FtSoloColor get accentColorScheme => throw _privateConstructorUsedError;
  LayoutMode get layoutMode => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: UserPreferences._defaultLocaleValue,
      toJson: UserPreferences._localeToJson,
      fromJson: UserPreferences._localeFromJson,
      readValue: UserPreferences._localeReadValue)
  Locale get locale => throw _privateConstructorUsedError;
  String get downloadLocation => throw _privateConstructorUsedError;
  String get pipedInstance => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  bool get discordPresence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {SourceQualities audioQuality,
      bool albumColorSync,
      bool amoledDarkTheme,
      bool checkUpdate,
      bool normalizeAudio,
      bool showSystemTrayIcon,
      bool skipNonMusic,
      bool systemTitleBar,
      CloseBehavior closeBehavior,
      @JsonKey(
          defaultValue: UserPreferences._defaultAccentColorScheme,
          fromJson: UserPreferences._accentColorSchemeFromJson,
          toJson: UserPreferences._accentColorSchemeToJson,
          readValue: UserPreferences._accentColorSchemeReadValue)
      FtSoloColor accentColorScheme,
      LayoutMode layoutMode,
      @JsonKey(
          defaultValue: UserPreferences._defaultLocaleValue,
          toJson: UserPreferences._localeToJson,
          fromJson: UserPreferences._localeFromJson,
          readValue: UserPreferences._localeReadValue)
      Locale locale,
      String downloadLocation,
      String pipedInstance,
      ThemeMode themeMode,
      bool discordPresence});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioQuality = null,
    Object? albumColorSync = null,
    Object? amoledDarkTheme = null,
    Object? checkUpdate = null,
    Object? normalizeAudio = null,
    Object? showSystemTrayIcon = null,
    Object? skipNonMusic = null,
    Object? systemTitleBar = null,
    Object? closeBehavior = null,
    Object? accentColorScheme = null,
    Object? layoutMode = null,
    Object? locale = null,
    Object? downloadLocation = null,
    Object? pipedInstance = null,
    Object? themeMode = null,
    Object? discordPresence = null,
  }) {
    return _then(_value.copyWith(
      audioQuality: null == audioQuality
          ? _value.audioQuality
          : audioQuality // ignore: cast_nullable_to_non_nullable
              as SourceQualities,
      albumColorSync: null == albumColorSync
          ? _value.albumColorSync
          : albumColorSync // ignore: cast_nullable_to_non_nullable
              as bool,
      amoledDarkTheme: null == amoledDarkTheme
          ? _value.amoledDarkTheme
          : amoledDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      checkUpdate: null == checkUpdate
          ? _value.checkUpdate
          : checkUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      normalizeAudio: null == normalizeAudio
          ? _value.normalizeAudio
          : normalizeAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      showSystemTrayIcon: null == showSystemTrayIcon
          ? _value.showSystemTrayIcon
          : showSystemTrayIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      skipNonMusic: null == skipNonMusic
          ? _value.skipNonMusic
          : skipNonMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      systemTitleBar: null == systemTitleBar
          ? _value.systemTitleBar
          : systemTitleBar // ignore: cast_nullable_to_non_nullable
              as bool,
      closeBehavior: null == closeBehavior
          ? _value.closeBehavior
          : closeBehavior // ignore: cast_nullable_to_non_nullable
              as CloseBehavior,
      accentColorScheme: null == accentColorScheme
          ? _value.accentColorScheme
          : accentColorScheme // ignore: cast_nullable_to_non_nullable
              as FtSoloColor,
      layoutMode: null == layoutMode
          ? _value.layoutMode
          : layoutMode // ignore: cast_nullable_to_non_nullable
              as LayoutMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      downloadLocation: null == downloadLocation
          ? _value.downloadLocation
          : downloadLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pipedInstance: null == pipedInstance
          ? _value.pipedInstance
          : pipedInstance // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      discordPresence: null == discordPresence
          ? _value.discordPresence
          : discordPresence // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SourceQualities audioQuality,
      bool albumColorSync,
      bool amoledDarkTheme,
      bool checkUpdate,
      bool normalizeAudio,
      bool showSystemTrayIcon,
      bool skipNonMusic,
      bool systemTitleBar,
      CloseBehavior closeBehavior,
      @JsonKey(
          defaultValue: UserPreferences._defaultAccentColorScheme,
          fromJson: UserPreferences._accentColorSchemeFromJson,
          toJson: UserPreferences._accentColorSchemeToJson,
          readValue: UserPreferences._accentColorSchemeReadValue)
      FtSoloColor accentColorScheme,
      LayoutMode layoutMode,
      @JsonKey(
          defaultValue: UserPreferences._defaultLocaleValue,
          toJson: UserPreferences._localeToJson,
          fromJson: UserPreferences._localeFromJson,
          readValue: UserPreferences._localeReadValue)
      Locale locale,
      String downloadLocation,
      String pipedInstance,
      ThemeMode themeMode,
      bool discordPresence});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioQuality = null,
    Object? albumColorSync = null,
    Object? amoledDarkTheme = null,
    Object? checkUpdate = null,
    Object? normalizeAudio = null,
    Object? showSystemTrayIcon = null,
    Object? skipNonMusic = null,
    Object? systemTitleBar = null,
    Object? closeBehavior = null,
    Object? accentColorScheme = null,
    Object? layoutMode = null,
    Object? locale = null,
    Object? downloadLocation = null,
    Object? pipedInstance = null,
    Object? themeMode = null,
    Object? discordPresence = null,
  }) {
    return _then(_$UserPreferencesImpl(
      audioQuality: null == audioQuality
          ? _value.audioQuality
          : audioQuality // ignore: cast_nullable_to_non_nullable
              as SourceQualities,
      albumColorSync: null == albumColorSync
          ? _value.albumColorSync
          : albumColorSync // ignore: cast_nullable_to_non_nullable
              as bool,
      amoledDarkTheme: null == amoledDarkTheme
          ? _value.amoledDarkTheme
          : amoledDarkTheme // ignore: cast_nullable_to_non_nullable
              as bool,
      checkUpdate: null == checkUpdate
          ? _value.checkUpdate
          : checkUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      normalizeAudio: null == normalizeAudio
          ? _value.normalizeAudio
          : normalizeAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      showSystemTrayIcon: null == showSystemTrayIcon
          ? _value.showSystemTrayIcon
          : showSystemTrayIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      skipNonMusic: null == skipNonMusic
          ? _value.skipNonMusic
          : skipNonMusic // ignore: cast_nullable_to_non_nullable
              as bool,
      systemTitleBar: null == systemTitleBar
          ? _value.systemTitleBar
          : systemTitleBar // ignore: cast_nullable_to_non_nullable
              as bool,
      closeBehavior: null == closeBehavior
          ? _value.closeBehavior
          : closeBehavior // ignore: cast_nullable_to_non_nullable
              as CloseBehavior,
      accentColorScheme: null == accentColorScheme
          ? _value.accentColorScheme
          : accentColorScheme // ignore: cast_nullable_to_non_nullable
              as FtSoloColor,
      layoutMode: null == layoutMode
          ? _value.layoutMode
          : layoutMode // ignore: cast_nullable_to_non_nullable
              as LayoutMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      downloadLocation: null == downloadLocation
          ? _value.downloadLocation
          : downloadLocation // ignore: cast_nullable_to_non_nullable
              as String,
      pipedInstance: null == pipedInstance
          ? _value.pipedInstance
          : pipedInstance // ignore: cast_nullable_to_non_nullable
              as String,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      discordPresence: null == discordPresence
          ? _value.discordPresence
          : discordPresence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl
    with DiagnosticableTreeMixin
    implements _UserPreferences {
  const _$UserPreferencesImpl(
      {this.audioQuality = SourceQualities.high,
      this.albumColorSync = true,
      this.amoledDarkTheme = false,
      this.checkUpdate = true,
      this.normalizeAudio = false,
      this.showSystemTrayIcon = true,
      this.skipNonMusic = true,
      this.systemTitleBar = false,
      this.closeBehavior = CloseBehavior.minimizeToTray,
      @JsonKey(
          defaultValue: UserPreferences._defaultAccentColorScheme,
          fromJson: UserPreferences._accentColorSchemeFromJson,
          toJson: UserPreferences._accentColorSchemeToJson,
          readValue: UserPreferences._accentColorSchemeReadValue)
      required this.accentColorScheme,
      this.layoutMode = LayoutMode.adaptive,
      @JsonKey(
          defaultValue: UserPreferences._defaultLocaleValue,
          toJson: UserPreferences._localeToJson,
          fromJson: UserPreferences._localeFromJson,
          readValue: UserPreferences._localeReadValue)
      required this.locale,
      this.downloadLocation = "",
      this.pipedInstance = "https://pipedapi.kavin.rocks",
      this.themeMode = ThemeMode.system,
      this.discordPresence = true});

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final SourceQualities audioQuality;
  @override
  @JsonKey()
  final bool albumColorSync;
  @override
  @JsonKey()
  final bool amoledDarkTheme;
  @override
  @JsonKey()
  final bool checkUpdate;
  @override
  @JsonKey()
  final bool normalizeAudio;
  @override
  @JsonKey()
  final bool showSystemTrayIcon;
  @override
  @JsonKey()
  final bool skipNonMusic;
  @override
  @JsonKey()
  final bool systemTitleBar;
  @override
  @JsonKey()
  final CloseBehavior closeBehavior;
  @override
  @JsonKey(
      defaultValue: UserPreferences._defaultAccentColorScheme,
      fromJson: UserPreferences._accentColorSchemeFromJson,
      toJson: UserPreferences._accentColorSchemeToJson,
      readValue: UserPreferences._accentColorSchemeReadValue)
  final FtSoloColor accentColorScheme;
  @override
  @JsonKey()
  final LayoutMode layoutMode;
  @override
  @JsonKey(
      defaultValue: UserPreferences._defaultLocaleValue,
      toJson: UserPreferences._localeToJson,
      fromJson: UserPreferences._localeFromJson,
      readValue: UserPreferences._localeReadValue)
  final Locale locale;
  @override
  @JsonKey()
  final String downloadLocation;
  @override
  @JsonKey()
  final String pipedInstance;
  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final bool discordPresence;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPreferences(audioQuality: $audioQuality, albumColorSync: $albumColorSync, amoledDarkTheme: $amoledDarkTheme, checkUpdate: $checkUpdate, normalizeAudio: $normalizeAudio, showSystemTrayIcon: $showSystemTrayIcon, skipNonMusic: $skipNonMusic, systemTitleBar: $systemTitleBar, closeBehavior: $closeBehavior, accentColorScheme: $accentColorScheme, layoutMode: $layoutMode, locale: $locale, downloadLocation: $downloadLocation, pipedInstance: $pipedInstance, themeMode: $themeMode, discordPresence: $discordPresence)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPreferences'))
      ..add(DiagnosticsProperty('audioQuality', audioQuality))
      ..add(DiagnosticsProperty('albumColorSync', albumColorSync))
      ..add(DiagnosticsProperty('amoledDarkTheme', amoledDarkTheme))
      ..add(DiagnosticsProperty('checkUpdate', checkUpdate))
      ..add(DiagnosticsProperty('normalizeAudio', normalizeAudio))
      ..add(DiagnosticsProperty('showSystemTrayIcon', showSystemTrayIcon))
      ..add(DiagnosticsProperty('skipNonMusic', skipNonMusic))
      ..add(DiagnosticsProperty('systemTitleBar', systemTitleBar))
      ..add(DiagnosticsProperty('closeBehavior', closeBehavior))
      ..add(DiagnosticsProperty('accentColorScheme', accentColorScheme))
      ..add(DiagnosticsProperty('layoutMode', layoutMode))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('downloadLocation', downloadLocation))
      ..add(DiagnosticsProperty('pipedInstance', pipedInstance))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(DiagnosticsProperty('discordPresence', discordPresence));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.audioQuality, audioQuality) ||
                other.audioQuality == audioQuality) &&
            (identical(other.albumColorSync, albumColorSync) ||
                other.albumColorSync == albumColorSync) &&
            (identical(other.amoledDarkTheme, amoledDarkTheme) ||
                other.amoledDarkTheme == amoledDarkTheme) &&
            (identical(other.checkUpdate, checkUpdate) ||
                other.checkUpdate == checkUpdate) &&
            (identical(other.normalizeAudio, normalizeAudio) ||
                other.normalizeAudio == normalizeAudio) &&
            (identical(other.showSystemTrayIcon, showSystemTrayIcon) ||
                other.showSystemTrayIcon == showSystemTrayIcon) &&
            (identical(other.skipNonMusic, skipNonMusic) ||
                other.skipNonMusic == skipNonMusic) &&
            (identical(other.systemTitleBar, systemTitleBar) ||
                other.systemTitleBar == systemTitleBar) &&
            (identical(other.closeBehavior, closeBehavior) ||
                other.closeBehavior == closeBehavior) &&
            (identical(other.accentColorScheme, accentColorScheme) ||
                other.accentColorScheme == accentColorScheme) &&
            (identical(other.layoutMode, layoutMode) ||
                other.layoutMode == layoutMode) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.downloadLocation, downloadLocation) ||
                other.downloadLocation == downloadLocation) &&
            (identical(other.pipedInstance, pipedInstance) ||
                other.pipedInstance == pipedInstance) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.discordPresence, discordPresence) ||
                other.discordPresence == discordPresence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      audioQuality,
      albumColorSync,
      amoledDarkTheme,
      checkUpdate,
      normalizeAudio,
      showSystemTrayIcon,
      skipNonMusic,
      systemTitleBar,
      closeBehavior,
      accentColorScheme,
      layoutMode,
      locale,
      downloadLocation,
      pipedInstance,
      themeMode,
      discordPresence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {final SourceQualities audioQuality,
      final bool albumColorSync,
      final bool amoledDarkTheme,
      final bool checkUpdate,
      final bool normalizeAudio,
      final bool showSystemTrayIcon,
      final bool skipNonMusic,
      final bool systemTitleBar,
      final CloseBehavior closeBehavior,
      @JsonKey(
          defaultValue: UserPreferences._defaultAccentColorScheme,
          fromJson: UserPreferences._accentColorSchemeFromJson,
          toJson: UserPreferences._accentColorSchemeToJson,
          readValue: UserPreferences._accentColorSchemeReadValue)
      required final FtSoloColor accentColorScheme,
      final LayoutMode layoutMode,
      @JsonKey(
          defaultValue: UserPreferences._defaultLocaleValue,
          toJson: UserPreferences._localeToJson,
          fromJson: UserPreferences._localeFromJson,
          readValue: UserPreferences._localeReadValue)
      required final Locale locale,
      final String downloadLocation,
      final String pipedInstance,
      final ThemeMode themeMode,
      final bool discordPresence}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  SourceQualities get audioQuality;
  @override
  bool get albumColorSync;
  @override
  bool get amoledDarkTheme;
  @override
  bool get checkUpdate;
  @override
  bool get normalizeAudio;
  @override
  bool get showSystemTrayIcon;
  @override
  bool get skipNonMusic;
  @override
  bool get systemTitleBar;
  @override
  CloseBehavior get closeBehavior;
  @override
  @JsonKey(
      defaultValue: UserPreferences._defaultAccentColorScheme,
      fromJson: UserPreferences._accentColorSchemeFromJson,
      toJson: UserPreferences._accentColorSchemeToJson,
      readValue: UserPreferences._accentColorSchemeReadValue)
  FtSoloColor get accentColorScheme;
  @override
  LayoutMode get layoutMode;
  @override
  @JsonKey(
      defaultValue: UserPreferences._defaultLocaleValue,
      toJson: UserPreferences._localeToJson,
      fromJson: UserPreferences._localeFromJson,
      readValue: UserPreferences._localeReadValue)
  Locale get locale;
  @override
  String get downloadLocation;
  @override
  String get pipedInstance;
  @override
  ThemeMode get themeMode;
  @override
  bool get discordPresence;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
