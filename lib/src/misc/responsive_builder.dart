import 'package:flutter/material.dart';

typedef ResponsiveWidgetBuilder = Widget Function(BuildContext context, DeviceType devType);

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveBuilder({required this.builder, super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          DeviceType devType = DeviceType.phone;

          if (constraints.maxWidth > 1400) {
            devType = DeviceType.desktop;
          } else if (constraints.maxWidth > 700) {
            devType = DeviceType.tablet;
          }

          return builder(context, devType);
        },
      );
}

enum DeviceType {
  phone,
  tablet,
  desktop;

  bool operator <(DeviceType other) {
    return index < other.index;
  }

  bool operator <=(DeviceType other) {
    return index <= other.index;
  }

  bool operator >(DeviceType other) {
    return index > other.index;
  }

  bool operator >=(DeviceType other) {
    return index >= other.index;
  }
}
