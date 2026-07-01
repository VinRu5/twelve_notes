import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/library/presentation/widgets/choice_add_modal.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/notification_navbar.dart';
import 'package:twelve_notes/src/presentation/widgets/twelve_app_bar.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

@RoutePage()
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TwelveAppBar(
          title: context.appStrings.libraryTitlePage,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.plus),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    builder: (context) => const ChoiceAddModal(),
                  );
                },
              ),
            ),
          ],
        ),
        body: NotificationNavbar(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            children: const [
              _LastSongs(),
            ],
          ),
        ),
      );
}

class _LastSongs extends StatelessWidget {
  const _LastSongs();

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Ultime suonate',
                style: context.twelveStyle?.titleSmall,
              ),
            ],
          ),
        ),
      );
}
