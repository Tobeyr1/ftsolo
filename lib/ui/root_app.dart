import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    return Scaffold();
  }
}
