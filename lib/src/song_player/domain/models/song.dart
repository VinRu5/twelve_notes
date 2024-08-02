import 'package:twelve_notes/src/auth/domain/models/user.dart';
import 'package:twelve_notes/src/song_player/domain/models/album.dart';
import 'package:twelve_notes/src/song_player/domain/models/artist.dart';
import 'package:twelve_notes/src/domain/models/model.dart';

class Song extends Model {
  final String title;
  final String lyric;
  final List<String> chords;
  final String tune;
  final User author;
  final Artist artist;
  final Album album;

  Song({
    super.id,
    super.createdAt,
    super.updatedAt,
    required this.title,
    required this.lyric,
    required this.chords,
    required this.tune,
    required this.author,
    required this.artist,
    required this.album,
  });
}
