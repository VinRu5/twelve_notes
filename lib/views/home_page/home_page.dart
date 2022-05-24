import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:twelve_notes/models/song.dart';
import 'package:twelve_notes/data/json_data.dart';
import 'package:twelve_notes/widgets/render_song.dart';

class HomePage extends StatefulWidget {
  static const route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Song song;

  @override
  void initState() {
    final data = jsonDecode(jsonData);
    song = Song.fromJson(data[0] as Map<String, dynamic>);
    print(song);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body(),
    );
  }

  Widget body() => Container(
        padding: const EdgeInsets.only(top: 100.0),
        child: RenderSong(
          text: song.text,
          chords: song.chords,
          width: 300,
        ),
      );
}
