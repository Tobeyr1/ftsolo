import 'package:catcher_2/core/catcher_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:ftsolo/ui/component/ft_page_slide_animation.dart';
import 'package:ftsolo/ui/home/home_page.dart';
import 'package:ftsolo/ui/root_app.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = Catcher2.navigatorKey;
final shellRouteNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(navigatorKey: rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: shellRouteNavigatorKey,
      builder: (ctx, state, child) => FtRootApp(child: child),
      routes: [
        GoRoute(
          path: "/",
          pageBuilder: (ctx, state) => const FtSoloPage(child: FtHomePage()),
        ),
      ]),
]);
