import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/twelve_app_bar.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TwelveAppBar(
          title: context.appStrings.searchTitlePage,
        ),
        body: Center(
          child: Text('Search'),
        ),
      );
}
