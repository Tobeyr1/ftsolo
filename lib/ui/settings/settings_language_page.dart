import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ftsolo/collections/ftsolo_icons.dart';
import 'package:ftsolo/extensions/constrains.dart';
import 'package:ftsolo/extensions/locale.dart';
import 'package:ftsolo/provider/user_preferences_provider.dart';
import 'package:ftsolo/ui/settings/ft_settings_ui_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../collections/language_codes.dart';
import '../../l10n/l10n.dart';
import '../component/ft_adaptive_select_tile.dart';

class FtSettingsLanguageRegionSection extends HookConsumerWidget {
  const FtSettingsLanguageRegionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(userPreferencesProvider);
    final preferencesNotifier = ref.watch(userPreferencesProvider.notifier);
    final mediaQuery = MediaQuery.of(context);
    return SectionCardWithHeading(
      heading: context.l10n.language_region,
      children: [
        FtAdaptiveSelectTile<Locale>(
          value: preferences.locale,
          onChanged: (locale) {
            if (locale == null) return;
            preferencesNotifier.setLocale(locale);
          },
          title: Text(context.l10n.language),
          secondary: const Icon(FtsoloIcons.language),
          options: [
            DropdownMenuItem(
              value: const Locale("system", "system"),
              child: Text(context.l10n.system_default),
            ),
            for (final locale in L10n.all)
              DropdownMenuItem(
                value: locale,
                child: Builder(builder: (context) {
                  final isoCodeName = LanguageLocals.getDisplayLanguage(
                    locale.languageCode,
                  );
                  return Text(
                    "${isoCodeName.name} (${isoCodeName.nativeName})",
                  );
                }),
              ),
          ],
        ),
        /*FtAdaptiveSelectTile<Market>(
          breakLayout: mediaQuery.lgAndUp,
          secondary: const Icon(FtsoloIcons.shoppingBag),
          title: Text(context.l10n.market_place_region),
          subtitle: Text(context.l10n.recommendation_country),
          value: preferences.recommendationMarket,
          onChanged: (value) {
            if (value == null) return;
            preferencesNotifier.setRecommendationMarket(value);
          },
          options: spotifyMarkets
              .map(
                (country) => DropdownMenuItem(
              value: country.$1,
              child: Text(country.$2),
            ),
          )
              .toList(),
        ),*/
      ],
    );
  }
}
