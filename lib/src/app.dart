import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Twelve Notes',
        home: Scaffold(
          body: Placeholder(),
        ),
      );
}
