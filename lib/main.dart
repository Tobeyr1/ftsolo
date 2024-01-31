import 'package:catcher_2/catcher_2.dart';
import 'package:dart_discord_rpc/dart_discord_rpc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fl_query/fl_query.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ftsolo/route/routes.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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

  //TODO: hive
  /*await QueryClient.initialize(
    cachePrefix: "tobery.ftsolo",
    cacheDir: hiveCacheDir,
    connectivity:
  )*/

  Catcher2(
      enableLogger: true,
      debugConfig: Catcher2Options(DialogReportMode(), [ConsoleHandler()]),
      releaseConfig: Catcher2Options(SilentReportMode(), [ConsoleHandler()]),
      runAppFunction: () {
        runApp(DevicePreview(
          enabled: true,
          data: const DevicePreviewData(
              isEnabled: true, orientation: Orientation.portrait),
          builder: (ctx) {
            return ProviderScope(
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
  @override
  Widget build(BuildContext context) {
    //TODO: theme
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'FtSolo',
      builder: (ctx, child) {
        return DevicePreview.appBuilder(
          ctx,
          DragToResizeArea(child: child!),
        );
      },
    );
  }
}
