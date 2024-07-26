import 'package:flutter/widgets.dart';

mixin PositionRenderMixin {
  getGlobalHeightPosition(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    return position.dy;
  }
}
