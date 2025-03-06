import 'package:flutter/material.dart';

class InkWellTransparent extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;

  const InkWellTransparent({
    super.key,
    this.child,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        child: child,
      );
}
