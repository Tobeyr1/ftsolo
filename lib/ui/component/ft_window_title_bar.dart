import 'package:flutter/material.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

class FTWindowTitleBar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? actionsIconTheme;
  final bool? centerTitle;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final double? titleWidth;
  final Widget? title;

  const FTWindowTitleBar({
    Key? key,
    this.actions,
    this.title,
    this.toolbarOpacity = 1,
    this.backgroundColor,
    this.actionsIconTheme,
    this.automaticallyImplyLeading = false,
    this.centerTitle,
    this.foregroundColor,
    this.leading,
    this.leadingWidth,
    this.titleSpacing,
    this.titleTextStyle,
    this.titleWidth,
    this.toolbarTextStyle,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FTWindowTitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FTWindowTitleBarState extends ConsumerState<FTWindowTitleBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      actions: [
        ...?widget.actions,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (DevicesOS.isDesktop)
              WindowCaption(
                brightness: theme.brightness,
                backgroundColor: Colors.transparent,
              )
          ],
        ),
      ],
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      actionsIconTheme: widget.actionsIconTheme,
      centerTitle: widget.centerTitle,
      titleSpacing: widget.titleSpacing,
      toolbarOpacity: widget.toolbarOpacity,
      leadingWidth: widget.leadingWidth,
      toolbarTextStyle: widget.toolbarTextStyle,
      titleTextStyle: widget.titleTextStyle,
      title: widget.title,
    );
  }
}
