import 'package:flutter/material.dart';
import 'package:twelve_notes/misc/paint_song.dart';

class RenderSong extends StatefulWidget {
  final String text;
  final double width;
  const RenderSong({
    required this.text,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<RenderSong> createState() => _RenderSongState();
}

class _RenderSongState extends State<RenderSong> {
  List<int> positions = [];

  @override
  void initState() {
    positions = searchPosition();
    super.initState();
  }

  List<int> searchPosition() {
    List<int> positionsSaved = [];
    List<String> textSplit = widget.text.split('');

    int oldCheck = 0;
    for (var character in textSplit) {
      if (character == '@') {
        int index = textSplit.indexOf(character, (oldCheck + 1));
        positionsSaved.add(
          index,
        );
        oldCheck = index;
      }
    }

    return positionsSaved;
  }

  double getWidth(BuildContext context) {
    print(context.size);
    return 100.0;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: PaintSong(
        text: widget.text.replaceAll('@', ''),
        maxWidth: widget.width, //MediaQuery.of(context).size.width,
        positions: positions,
      ),
    );
  }
}
