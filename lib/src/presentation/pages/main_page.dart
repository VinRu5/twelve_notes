import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Main'),
        ),
        bottomSheet: FilledButton(
          onPressed: () {}, //context.read<AuthCubit>().signOut,
          child: Text('Logout'),
        ),
      );
}
