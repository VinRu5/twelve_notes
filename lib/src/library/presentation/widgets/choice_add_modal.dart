import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/library/domain/model/choice_ui.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class ChoiceAddModal extends StatelessWidget {
  const ChoiceAddModal({super.key});

  List<ChoiceUI> choices(BuildContext context) => [
        ChoiceUI(
          title: "Libro",
          subtitle: "Aggiungi una libro con le tue canzoni preferite",
          icon: FontAwesomeIcons.rectangleList,
          action: () {},
        ),
        ChoiceUI(
          title: "Canzone",
          subtitle: "Aggingi il tab per la tua canzone preferita che non trovi",
          icon: FontAwesomeIcons.music,
          action: () {
            context.router.maybePop();
            context.router.navigate(
              EditSongRoute(),
            );
          },
        ),
      ];

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Arricchisci la tua libreria',
              style: context.twelveStyle?.titleMedium,
            ),
          ),
          const Divider(),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 24.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: choices(context).length,
            // separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4.0),
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: FaIcon(choices(context)[index].icon),
              title: Text(
                choices(context)[index].title,
                style: context.twelveStyle?.bodyMedium,
              ),
              subtitle: Text(
                choices(context)[index].subtitle,
                style: context.twelveStyle?.labelSmall,
              ),
              onTap: () => choices(context)[index].action(),
            ),
          ),
        ],
      );
}
