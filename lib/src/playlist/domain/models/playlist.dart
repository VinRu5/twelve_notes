import 'package:twelve_notes/src/domain/models/model.dart';
import 'package:twelve_notes/src/song_player/domain/models/song.dart';

class Playlist extends Model {
  final List<Song> songs;

  Playlist({
    super.id,
    required this.songs,
    super.createdAt,
    super.updatedAt,
  });
}
