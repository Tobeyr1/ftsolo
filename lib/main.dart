import 'package:catcher_2/catcher_2.dart';
import 'package:dart_discord_rpc/dart_discord_rpc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fl_query/fl_query.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ftsolo/hooks/configurators/use_get_storage_perms.dart';
import 'package:ftsolo/l10n/l10n.dart';
import 'package:ftsolo/provider/palette_provider.dart';
import 'package:ftsolo/provider/persisted_state_notifier.dart';
import 'package:ftsolo/provider/user_preferences_provider.dart';
import 'package:ftsolo/route/routes.dart';
import 'package:ftsolo/sqlite/skip_segment.dart';
import 'package:ftsolo/sqlite/source_match.dart';
import 'package:ftsolo/themes/theme.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  MediaKit.ensureInitialized();
  // force High Refresh Rate on some Android devices (like One Plus)
  if (DevicesOS.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  if (DevicesOS.isDesktop) {
    await windowManager.ensureInitialized();
    await windowManager.setPreventClose(true);
    WindowOptions windowOptions = WindowOptions(
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "FtSolo",
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setMinimumSize(const Size(300, 700));
      await windowManager.show();
    });
  }

  await SystemTheme.accentColor.load();

  if (!kIsWeb) {
    MetadataGod.initialize();
  }

  if (DevicesOS.isWindows || DevicesOS.isLinux) {
    DiscordRPC.initialize();
  }

  final hiveCacheDir =
      kIsWeb ? null : (await getApplicationSupportDirectory()).path;
  await Hive.initFlutter(hiveCacheDir);

  //TODO: hive
  /*await QueryClient.initialize(
    cachePrefix: "tobery.ftsolo",
    cacheDir: hiveCacheDir,
    connectivity:
  )*/
  Hive.registerAdapter(SkipSegmentAdapter());
  Hive.registerAdapter(SourceMatchAdapter());
  Hive.registerAdapter(SourceTypeAdapter());

  // Cache versioning entities with Adapter
  SourceMatch.version = 'v1';
  SkipSegment.version = 'v1';

  await Hive.openLazyBox<SourceMatch>(
    SourceMatch.boxName,
    path: hiveCacheDir,
  );
  await Hive.openLazyBox(
    SkipSegment.boxName,
    path: hiveCacheDir,
  );
  await PersistedStateNotifier.initializeBoxes(path: hiveCacheDir);
  Catcher2(
      enableLogger: true,
      debugConfig: Catcher2Options(DialogReportMode(), [ConsoleHandler()]),
      releaseConfig: Catcher2Options(SilentReportMode(), [ConsoleHandler()]),
      runAppFunction: () {
        runApp(DevicePreview(
          enabled: !kReleaseMode && !DevicesOS.isMobile,
          data: const DevicePreviewData(
              isEnabled: false, orientation: Orientation.portrait),
          builder: (ctx) {
            return const ProviderScope(
              child: FtSolo(),
            );
          },
        ));
      });
}

class FtSolo extends StatefulHookConsumerWidget {
  const FtSolo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FtSoloState();

  static FtSoloState of(BuildContext ctx) =>
      ctx.findAncestorStateOfType<FtSoloState>()!;
}

class FtSoloState extends ConsumerState<FtSolo> {
  SharedPreferences? localStorage;

  @override
  Widget build(BuildContext context) {
    //TODO: theme
    final themeMode =
        ref.watch(userPreferencesProvider.select((value) => value.themeMode));
    final accentMaterialColor = ref.watch(
        userPreferencesProvider.select((value) => value.accentColorScheme));
    final isAmoledTheme = ref.watch(
        userPreferencesProvider.select((value) => value.amoledDarkTheme));
    final locale =
        ref.watch(userPreferencesProvider.select((value) => value.locale));
    final paletteColor = ref
        .watch(paletteProvider.select((value) => value?.dominantColor?.color));

    useGetStoragePermissions(ref);

    useEffect(() {
      FlutterNativeSplash.remove();
      return () {
        /// For enabling hot reload for audio player
        if (!kDebugMode) return;
        //TODO audioPlayer
      };
    });

    final lightTheme = useMemoized(
        () =>
            theme(paletteColor ?? accentMaterialColor, Brightness.light, false),
        [paletteColor, accentMaterialColor]);

    final darkTheme = useMemoized(
      () => theme(
        paletteColor ?? accentMaterialColor,
        Brightness.dark,
        isAmoledTheme,
      ),
      [paletteColor, accentMaterialColor, isAmoledTheme],
    );

    return MaterialApp.router(
      supportedLocales: L10n.all,
      locale: locale.languageCode == "system" ? null : locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'FtSolo',
      builder: (ctx, child) {
        return DevicePreview.appBuilder(
          ctx,
          DragToResizeArea(child: child!),
        );
      },
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      actions: {
        ...WidgetsApp.defaultActions,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => localStorage = value);
  }
}
