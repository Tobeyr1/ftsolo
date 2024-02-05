import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ftsolo_icons.dart';

class SideBarTiles {
  final IconData icon;
  final String title;
  final String id;

  SideBarTiles({required this.icon, required this.title, required this.id});
}

List<SideBarTiles> getSidebarTileList(AppLocalizations l10n) => [
      SideBarTiles(id: "browse", icon: FtsoloIcons.home, title: l10n.browse),
      SideBarTiles(id: "search", icon: FtsoloIcons.search, title: l10n.search),
      SideBarTiles(
          id: "library", icon: FtsoloIcons.library, title: l10n.library),
      SideBarTiles(id: "lyrics", icon: FtsoloIcons.music, title: l10n.lyrics),
    ];

List<SideBarTiles> getNavbarTileList(AppLocalizations l10n) => [
      SideBarTiles(id: "browse", icon: FtsoloIcons.home, title: l10n.browse),
      SideBarTiles(id: "search", icon: FtsoloIcons.search, title: l10n.search),
      SideBarTiles(
        id: "library",
        icon: FtsoloIcons.library,
        title: l10n.library,
      ),
      SideBarTiles(
        id: "settings",
        icon: FtsoloIcons.settings,
        title: l10n.settings,
      )
    ];
