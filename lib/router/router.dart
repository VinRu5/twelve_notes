import 'package:flutter/material.dart';
import 'package:twelve_notes/views/home_page/home_page.dart';

class RouterTwelve {
  RouterTwelve._privateConstructor();

  static final RouterTwelve instance = RouterTwelve._privateConstructor();

  generateRoute() {
    return (settings) {
      print(settings);
      final routes = {
        HomePage.route: (_) => HomePage(),
        // MovieDetails.route: (_) =>
        //     MovieDetails(args: (settings.arguments as MovieDetailsArgs)),
      };

      return MaterialPageRoute(builder: routes[settings.name]!);
    };
  }
}
