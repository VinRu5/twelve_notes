import 'package:flutter/material.dart';
import 'package:twelve_notes/router/router.dart';
import 'package:twelve_notes/views/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twelve Notes',
      initialRoute: HomePage.route,
      onGenerateRoute: RouterTwelve.instance.generateRoute(),
    );
  }
}
