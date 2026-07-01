import 'package:flutter/material.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/home/presentation/widgets/song_tile.dart';

class SongTileCard extends StatelessWidget {
  final HomeSong song;

  const SongTileCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) => Card(
        child: SongTile(song: song),
      );
}
