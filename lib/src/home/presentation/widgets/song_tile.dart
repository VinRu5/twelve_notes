import 'package:flutter/material.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class SongTile extends StatelessWidget {
  final HomeSong song;
  final double radius;

  const SongTile({
    super.key,
    required this.song,
    this.radius = 50.0,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Container(
          clipBehavior: Clip.antiAlias,
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.elliptical(16.0, 12.0),
              bottom: Radius.elliptical(16.0, 12.0),
            ),
            border: Border.all(color: context.colorScheme.primary, width: 2.0),
          ),
          child: ClipRSuperellipse(
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(14.0, 10.0),
              bottom: Radius.elliptical(14.0, 10.0),
            ),
            child: Image.asset(
              song.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(song.title),
        subtitle: Text(song.artist),
      );
}
