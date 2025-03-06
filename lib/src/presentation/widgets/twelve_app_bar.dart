import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/presentation/widgets/ink_well_transparent.dart';
import 'package:twelve_notes/src/profile/presentation/pages/settings_page.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class TwelveAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final List<Widget>? actions;

  const TwelveAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: const AssetImage(AppAssets.deafaultAvatar),
            child: InkWellTransparent(
              onTap: () => showCupertinoModalBottomSheet(
                context: context,
                useRootNavigator: true,
                builder: (context) => const SettingsPage(),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: context.twelveStyle?.headlineMedium,
        ),
        actions: actions,
      );

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
