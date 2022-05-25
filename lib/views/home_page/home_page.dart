import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:twelve_notes/models/song.dart';
import 'package:twelve_notes/data/json_data.dart';
import 'package:twelve_notes/theme/colors_twelve.dart';
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
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: ColorsTwelve.orangeGradient,
          ),
          child: Center(
            child: Text(
              'Twelve',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        // RenderSong(
        //   text: song.text,
        //   chords: song.chords,
        //   width: 300,
        // ),
      );
}
