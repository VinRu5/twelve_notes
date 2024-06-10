import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/mockup_widget.dart';
import 'package:twelve_notes/src/theme/twelve_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Twelve Notes',
        theme: TwelveTheme.light(context),
        darkTheme: TwelveTheme.dark(context),
        home: MockupWidget(),
      );
}
