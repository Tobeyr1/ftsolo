import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/ui/component/ft_window_title_bar.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FtHomePage extends HookConsumerWidget {
  const FtHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: DevicesOS.isMobile ? null : const FTWindowTitleBar(),
        body: CustomScrollView(
          controller: controller,
        ),
      ),
    );
  }
}
