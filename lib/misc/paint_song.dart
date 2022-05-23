import 'package:flutter/material.dart';

class PaintSong extends CustomPainter {
  final String text;
  final double maxWidth;
  final List<int> positions;

  PaintSong({
    required this.text,
    required this.maxWidth,
    required this.positions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final mainText = TextSpan(
      text: text,
      style: TextStyle(height: 3, color: Colors.black),
    );
    final chord = TextSpan(
      text: 'SOL',
      style: TextStyle(color: Colors.black),
    );

    final drawMainText = TextPainter()
      ..textDirection = TextDirection.ltr
      ..text = mainText
      ..layout(maxWidth: maxWidth);

    final drawChord = TextPainter()
      ..textDirection = TextDirection.ltr
      ..text = chord
      ..layout(maxWidth: maxWidth);
    drawMainText.paint(canvas, Offset(0, 0));

    for (var position in positions) {
      final caretOffset = drawMainText.getOffsetForCaret(
        TextPosition(
          offset: position,
          affinity: TextAffinity.upstream,
        ),
        Rect.zero,
      );
      final dx = caretOffset.dx;
      final dy = caretOffset.dy;

      drawChord.paint(canvas, Offset(dx, (dy - 15)));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
