import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditSongPage extends StatelessWidget {
  final String? idSong;

  const EditSongPage({
    super.key,
    this.idSong,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Text('data'),
      );
}
