import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/twelve_app_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TwelveAppBar(
          title: context.appStrings.homeTitlePage,
        ),
        body: Center(
          child: Text('Home'),
        ),
      );
}
