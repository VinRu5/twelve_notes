import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final double? height;
  final String asset;

  const ImageBackground({
    super.key,
    required this.asset,
    this.height,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.elliptical(24.0, 18.0),
          ),
          image: DecorationImage(
            image: AssetImage(
              asset,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
}
