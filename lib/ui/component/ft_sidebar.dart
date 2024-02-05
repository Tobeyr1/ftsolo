import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/collections/ftsolo_icons.dart';
import 'package:ftsolo/extensions/constrains.dart';
import 'package:ftsolo/extensions/locale.dart';
import 'package:ftsolo/hooks/controllers/sidebarx_controller.dart';
import 'package:ftsolo/repo/entity/user_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../collections/assets.gen.dart';
import '../../collections/side_bar_tiles.dart';
import '../../hooks/utils/use_brightness_value.dart';
import '../../provider/user_preferences_provider.dart';
import '../../utils/devices_util.dart';
import 'ft_universal_image.dart';

class FtSidebar extends HookConsumerWidget {
  final int? selectedIndex;
  final void Function(int) onSelectedIndexChanged;
  final Widget child;

  const FtSidebar(
      {Key? key,
      required this.selectedIndex,
      required this.onSelectedIndexChanged,
      required this.child})
      : super(key: key);

  static Widget brandLogo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Assets.ftsoloLogoPng.image(height: 50),
    );
  }

  static void goToSettings(BuildContext ctx) {
    GoRouter.of(ctx).go("/settings");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);

    final layoutMode =
        ref.watch(userPreferencesProvider.select((s) => s.layoutMode));

    final controller = ftSidebarXController(
      selectedIndex: selectedIndex ?? 0,
      extended: mediaQuery.lgAndUp,
    );

    final theme = Theme.of(context);
    final bg = theme.colorScheme.surfaceVariant;

    final bgColor = useBrightnessValue(
      Color.lerp(bg, Colors.white, 0.7),
      Color.lerp(bg, Colors.black, 0.45)!,
    );

    final sidebarTileList = useMemoized(
      () => getSidebarTileList(context.l10n),
      [context.l10n],
    );

    useEffect(() {
      if (controller.selectedIndex != selectedIndex && selectedIndex != null) {
        controller.selectIndex(selectedIndex!);
      }
      return null;
    }, [selectedIndex]);

    useEffect(() {
      void listener() {
        onSelectedIndexChanged(controller.selectedIndex);
      }

      controller.addListener(listener);
      return () {
        controller.removeListener(listener);
      };
    }, [controller]);

    useEffect(() {
      if (!context.mounted) return;
      if (mediaQuery.lgAndUp && !controller.extended) {
        controller.setExtended(true);
      } else if (mediaQuery.mdAndDown && controller.extended) {
        controller.setExtended(false);
      }
      return null;
    }, [mediaQuery, controller]);

    if (layoutMode == LayoutMode.compact ||
        (mediaQuery.smAndDown && layoutMode == LayoutMode.adaptive)) {
      return Scaffold(
        body: child,
      );
    }

    return Row(
      children: [
        SafeArea(
          child: SidebarX(
            controller: controller,
            items: sidebarTileList.mapIndexed(
              (index, e) {
                return SidebarXItem(
                  iconWidget: Badge(
                    backgroundColor: theme.colorScheme.primary,
                    isLabelVisible:
                        e.title == "Library" /*&& downloadCount > 0*/,
                    label: Text(
                      /*downloadCount.toString()*/
                      '1',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    child: Icon(
                      e.icon,
                      color: selectedIndex == index
                          ? theme.colorScheme.primary
                          : null,
                    ),
                  ),
                  label: e.title,
                );
              },
            ).toList(),
            headerBuilder: (_, __) => const SidebarHeader(),
            footerBuilder: (_, __) => const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: SidebarFooter(),
            ),
            showToggleButton: false,
            theme: SidebarXTheme(
              width: 50,
              margin: EdgeInsets.only(bottom: 10, top: kIsMacOS ? 35 : 5),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.primary.withOpacity(0.1),
              ),
              selectedIconTheme: IconThemeData(
                color: theme.colorScheme.primary,
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 250,
              margin: EdgeInsets.only(
                bottom: 10,
                left: 0,
                top: kIsMacOS ? 35 : 5,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: bgColor?.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colorScheme.primary.withOpacity(0.1),
              ),
              selectedIconTheme: IconThemeData(
                color: theme.colorScheme.primary,
              ),
              selectedTextStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
              itemTextPadding: const EdgeInsets.only(left: 10),
              selectedItemTextPadding: const EdgeInsets.only(left: 10),
            ),
          ),
        ),
        Expanded(child: child)
      ],
    );
  }
}

class SidebarHeader extends HookWidget {
  const SidebarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    if (mediaQuery.mdAndDown) {
      return Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(bottom: 5),
        child: FtSidebar.brandLogo(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (kIsMacOS) const SizedBox(height: 25),
          Row(
            children: [
              FtSidebar.brandLogo(),
              const SizedBox(width: 10),
              Text(
                "Ftsolo",
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SidebarFooter extends HookConsumerWidget {
  const SidebarFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final data = null;
    final auth = null;
    final avatarImg = "";
    /*final me = useQueries.user.me(ref);
    final data = me.data;

    final avatarImg = TypeConversionUtils.image_X_UrlString(
      data?.images,
      index: (data?.images?.length ?? 1) - 1,
      placeholder: ImagePlaceholder.artist,
    );*/

    //final auth = ref.watch(AuthenticationNotifier.provider);

    if (mediaQuery.mdAndDown) {
      return IconButton(
        icon: const Icon(FtsoloIcons.settings),
        onPressed: () => FtSidebar.goToSettings(context),
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: 12),
      width: 250,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (auth != null && data == null)
            const CircularProgressIndicator()
          else if (data != null)
            Flexible(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: UniversalImage.imageProvider(avatarImg),
                    onBackgroundImageError: (exception, stackTrace) =>
                        Assets.userPlaceholder.image(
                      height: 16,
                      width: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      data.displayName ?? context.l10n.guest,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          IconButton(
            icon: const Icon(FtsoloIcons.settings),
            onPressed: () {
              FtSidebar.goToSettings(context);
            },
          ),
        ],
      ),
    );
  }
}
