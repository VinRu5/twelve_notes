import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/ink_well_transparent.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            context.appStrings.settingsTitlePage,
            style: context.twelveStyle?.titleSmall,
          ),
          actions: [
            TextButton(
              onPressed: () => context.router.maybePop(),
              child: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: ListView(
            children: [
              _HeaderSettings(),
              Divider(),
            ],
          ),
        ),
      );
}

class _HeaderSettings extends StatelessWidget {
  const _HeaderSettings();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWellTransparent(
          onTap: () => context.router.navigate(const EditRoute()),
          child: Row(
            children: [
              CircleAvatar(
                radius: 44.0,
                backgroundImage: AssetImage(AppAssets.deafaultAvatar),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vincenzo Russo',
                    style: context.twelveStyle?.headlineSmall,
                  ),
                  Text(
                    'data',
                    style: context.twelveStyle?.bodySmall,
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
