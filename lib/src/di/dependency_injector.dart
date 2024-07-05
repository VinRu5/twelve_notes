import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talker/talker.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Provider(
        create: (_) => Talker(
          logger: TalkerLogger(output: log),
        ),
        child: child,
      );
}
