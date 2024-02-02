import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';
import 'dart:io';

class DevicesOS {
  static bool isIOS = UniversalPlatform.isIOS;
  static bool isAndroid = UniversalPlatform.isAndroid;
  static bool isMacOS = UniversalPlatform.isMacOS;
  static bool isWindows = UniversalPlatform.isWindows;
  static bool isLinux = UniversalPlatform.isLinux;

  static bool isWeb = kIsWeb;

  static bool get isDesktop => isWindows || isMacOS || isLinux;

  static bool get isMobile => isAndroid || isIOS;

  static bool get isDesktopOrWeb => isDesktop || isWeb;

  static bool get isMobileOrWeb => isMobile || isWeb;
}

final kIsFlatpak = kIsWeb ? false : Platform.environment["FLATPAK_ID"] != null;
final kIsMacOS = kIsWeb ? false : DevicesOS.isMacOS;
final kIsLinux = kIsWeb ? false : DevicesOS.isLinux;
final kIsAndroid = kIsWeb ? false : DevicesOS.isAndroid;
final kIsIOS = kIsWeb ? false : DevicesOS.isIOS;
final kIsWindows = kIsWeb ? false : DevicesOS.isWindows;
final kIsDesktop = kIsLinux || kIsWindows || kIsMacOS;
final kIsMobile = kIsAndroid || kIsIOS;
