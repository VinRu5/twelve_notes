import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';

class HomeData {
  final List<HomeArtist> artists;
  final List<HomeSong> songs;

  HomeData({
    required this.artists,
    required this.songs,
  });
}
