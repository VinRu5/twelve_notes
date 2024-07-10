import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:twelve_notes/src/router/app_router.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Column(
          children: [
            FilledButton(
              onPressed: () => context.router.navigate(const LoginRoute()),
              child: Text('Login'),
            ),
          ],
        ),
      );
}
