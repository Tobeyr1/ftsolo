import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/extensions/locale.dart';
import 'package:ftsolo/provider/user_preferences_provider.dart';
import 'package:ftsolo/ui/component/ft_window_title_bar.dart';
import 'package:ftsolo/ui/settings/settings_apperance_page.dart';
import 'package:ftsolo/ui/settings/settings_language_page.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FtSettingsPage extends HookConsumerWidget {
  const FtSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();
    final preferencesNotifier = ref.watch(userPreferencesProvider.notifier);

    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: FTWindowTitleBar(
          title: Text(context.l10n.settings),
          centerTitle: true,
        ),
        body: Scrollbar(
          controller: controller,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1366),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(scrollbars: false),
                child: ListView(
                  controller: controller,
                  children: [
                    //const SettingsAccountSection(),
                    const FtSettingsLanguageRegionSection(),
                    const FtSettingsAppearanceSection(),
                    //const SettingsPlaybackSection(),
                    //const SettingsDownloadsSection(),
                    /* if (DevicesOS.isDesktop)
                      const SettingsDesktopSection(),
                    if (!kIsWeb) const SettingsDevelopersSection(),
                    const SettingsAboutSection(),*/
                    Center(
                      child: FilledButton(
                        onPressed: preferencesNotifier.reset,
                        child: Text(context.l10n.restore_defaults),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
