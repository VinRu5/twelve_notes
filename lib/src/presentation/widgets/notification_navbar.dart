import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/presentation/blocs/nav_positioned_cubit.dart';

class NotificationNavbar extends StatelessWidget {
  final Widget child;

  const NotificationNavbar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            context.read<NavPositionedCubit>().showNavbar(false);
          } else if (notification is ScrollEndNotification) {
            context.read<NavPositionedCubit>().showNavbar(true);
          }
          return false;
        },
        child: child,
      );
}
