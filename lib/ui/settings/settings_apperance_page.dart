import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/collections/ftsolo_icons.dart';
import 'package:ftsolo/extensions/locale.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/user_preferences_provider.dart';
import '../../repo/entity/user_preferences.dart';
import '../component/ft_adaptive_select_tile.dart';
import 'ft_settings_ui_component.dart';

class FtSettingsAppearanceSection extends HookConsumerWidget {
  const FtSettingsAppearanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(userPreferencesProvider);
    final preferencesNotifier = ref.watch(userPreferencesProvider.notifier);
    final pickColorScheme = useCallback(() {
      return () => showDialog(
          context: context,
          builder: (context) {
            return const ColorSchemePickerDialog();
          });
    }, []);

    return SectionCardWithHeading(
      heading: context.l10n.appearance,
      children: [
        FtAdaptiveSelectTile<LayoutMode>(
          secondary: const Icon(FtsoloIcons.dashboard),
          title: Text(context.l10n.layout_mode),
          subtitle: Text(context.l10n.override_layout_settings),
          value: preferences.layoutMode,
          onChanged: (value) {
            if (value != null) {
              preferencesNotifier.setLayoutMode(value);
            }
          },
          options: [
            DropdownMenuItem(
              value: LayoutMode.adaptive,
              child: Text(context.l10n.adaptive),
            ),
            DropdownMenuItem(
              value: LayoutMode.compact,
              child: Text(context.l10n.compact),
            ),
            DropdownMenuItem(
              value: LayoutMode.extended,
              child: Text(context.l10n.extended),
            ),
          ],
        ),
        FtAdaptiveSelectTile<ThemeMode>(
          secondary: const Icon(FtsoloIcons.darkMode),
          title: Text(context.l10n.theme),
          value: preferences.themeMode,
          options: [
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(context.l10n.dark),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(context.l10n.light),
            ),
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(context.l10n.system),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              preferencesNotifier.setThemeMode(value);
            }
          },
        ),
        SwitchListTile(
          secondary: const Icon(FtsoloIcons.amoled),
          title: Text(context.l10n.use_amoled_mode),
          subtitle: Text(context.l10n.pitch_dark_theme),
          value: preferences.amoledDarkTheme,
          onChanged: preferencesNotifier.setAmoledDarkTheme,
        ),
        ListTile(
          leading: const Icon(FtsoloIcons.palette),
          title: Text(context.l10n.accent_color),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          trailing: ColorTile.compact(
            color: preferences.accentColorScheme,
            onPressed: pickColorScheme(),
            isActive: true,
          ),
          onTap: pickColorScheme(),
        ),
        SwitchListTile(
          secondary: const Icon(FtsoloIcons.colorSync),
          title: Text(context.l10n.sync_album_color),
          subtitle: Text(context.l10n.sync_album_color_description),
          value: preferences.albumColorSync,
          onChanged: preferencesNotifier.setAlbumColorSync,
        ),
      ],
    );
  }
}
