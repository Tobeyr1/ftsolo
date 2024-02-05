import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/provider/persisted_state_notifier.dart';
import 'package:ftsolo/ui/component/ft_sidebar.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const rootPaths = {
  "/": 0,
  "/search": 1,
  "/library": 2,
  "/lyrics": 3,
};

class FtRootApp extends HookConsumerWidget {
  const FtRootApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final theme = Theme.of(context);
    final location = GoRouterState.of(context).matchedLocation;
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        if (sharedPreferences.getBool(kIsUsingEncryption) == false &&
            context.mounted) {
          await PersistedStateNotifier.showNoEncryptionDialog(context);
        }
      });
    });

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarBrightness: backgroundColor.computeLuminance() > 0.179
            ? Brightness.dark
            : Brightness.light,
      ));
      return null;
    }, [backgroundColor]);

    void onSelectIndexChanged(int d) {
      final invertedRouteMap =
          rootPaths.map((key, value) => MapEntry(value, key));
      if (context.mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          GoRouter.of(context).go(invertedRouteMap[d]!);
        });
      }
    }

    return Scaffold(
      body: FtSidebar(
        selectedIndex: rootPaths[location],
        onSelectedIndexChanged: onSelectIndexChanged,
        child: child,
      ),
      extendBody: true,
      drawerScrimColor: Colors.transparent,
      endDrawer: DevicesOS.isDesktop
          ? Container(
              constraints: const BoxConstraints(maxWidth: 800),
              decoration: BoxDecoration(
                boxShadow: theme.brightness == Brightness.light
                    ? null
                    : kElevationToShadow[8],
              ),
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 100,
              ),
              child: Container(), //TODO: player_queue
            )
          : null,
    );
  }
}
