import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class FtSoloColor extends Color {
  final String name;

  const FtSoloColor(int color, {required this.name}) : super(color);

  const FtSoloColor.from(int value, {required this.name}) : super(value);

  factory FtSoloColor.fromString(String string) {
    final slices = string.split(":");
    return FtSoloColor(int.parse(slices.last), name: slices.first);
  }

  @override
  String toString() {
    return "$name:$value";
  }
}

final Set<FtSoloColor> colorsMap = {
  FtSoloColor(SystemTheme.accentColor.accent.value, name: "System"),
  FtSoloColor(Colors.red.value, name: "Red"),
  FtSoloColor(Colors.pink.value, name: "Pink"),
  FtSoloColor(Colors.purple.value, name: "Purple"),
  FtSoloColor(Colors.deepPurple.value, name: "DeepPurple"),
  FtSoloColor(Colors.indigo.value, name: "Indigo"),
  FtSoloColor(Colors.blue.value, name: "Blue"),
  FtSoloColor(Colors.lightBlue.value, name: "LightBlue"),
  FtSoloColor(Colors.cyan.value, name: "Cyan"),
  FtSoloColor(Colors.teal.value, name: "Teal"),
  FtSoloColor(Colors.green.value, name: "Green"),
  FtSoloColor(Colors.lightGreen.value, name: "LightGreen"),
  FtSoloColor(Colors.yellow.value, name: "Yellow"),
  FtSoloColor(Colors.amber.value, name: "Amber"),
  FtSoloColor(Colors.orange.value, name: "Orange"),
  FtSoloColor(Colors.deepOrange.value, name: "DeepOrange"),
  FtSoloColor(Colors.brown.value, name: "Brown"),
};

ThemeData theme(Color seed, Brightness brightness, bool isAmoled) {
  final scheme = ColorScheme.fromSeed(
    seedColor: seed,
    shadow: Colors.black12,
    background: isAmoled ? Colors.black : null,
    surface: isAmoled ? Colors.black : null,
    brightness: brightness,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 5,
      iconColor: scheme.onSurface,
    ),
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: IconThemeData(size: 16, color: scheme.onSurface),
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 50,
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(size: 18),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      labelColor: scheme.primary,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: scheme.surface,
      elevation: 4,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: scheme.onSurface,
      contentTextStyle: TextStyle(color: scheme.surface),
    ),
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    searchBarTheme: SearchBarThemeData(
      textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 15)),
      constraints: const BoxConstraints(maxWidth: double.infinity),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
      backgroundColor: MaterialStatePropertyAll(
        Color.lerp(
          scheme.surfaceVariant,
          scheme.surface,
          brightness == Brightness.light ? .9 : .7,
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    scrollbarTheme: const ScrollbarThemeData(
      thickness: MaterialStatePropertyAll(14),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    visualDensity: VisualDensity.standard,
  );
}
