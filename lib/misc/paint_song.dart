import 'package:flutter/material.dart';

class PaintSong extends CustomPainter {
  final String text;
  final double maxWidth;
  final List<int> positions;
  final List<dynamic> chords;

  PaintSong({
    required this.text,
    required this.maxWidth,
    required this.positions,
    required this.chords,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final mainText = TextSpan(
      text: text,
      style: TextStyle(height: 3, color: Colors.black),
    );

    final drawMainText = TextPainter()
      ..textDirection = TextDirection.ltr
      ..text = mainText
      ..layout(maxWidth: maxWidth);

    drawMainText.paint(canvas, Offset(0, 0));

    for (var i = 0; i < positions.length; i++) {
      final position = positions[i];
      final textChord = chords[i];

      final chord = TextSpan(
        text: textChord,
        style: TextStyle(color: Colors.black),
      );

      final drawChord = TextPainter()
        ..textDirection = TextDirection.ltr
        ..text = chord
        ..layout(maxWidth: maxWidth);

      final caretOffset = drawMainText.getOffsetForCaret(
        TextPosition(
          offset: position,

          ///affinity: TextAffinity.upstream,
        ),
        Rect.zero,
      );
      // final dx = caretOffset.dx;
      // final dy = caretOffset.dy;

      drawChord.paint(canvas, caretOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
