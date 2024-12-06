import 'package:flutter/material.dart';

class InkWellTransparent extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const InkWellTransparent({
    super.key,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: child,
      );
}
