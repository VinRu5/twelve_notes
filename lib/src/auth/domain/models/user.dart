import 'package:twelve_notes/src/domain/models/model.dart';
import 'package:twelve_notes/src/playlist/domain/models/playlist.dart';
import 'package:twelve_notes/src/song_player/domain/models/song.dart';

class User extends Model {
  final String firstName;
  final String lastName;
  final String? picture;
  final String? imageBg;
  final bool isAuthor;
  final List<Song> favouriteSongs;
  final List<Playlist> playlists;

  User({
    super.id,
    required this.firstName,
    required this.lastName,
    this.picture,
    this.imageBg,
    this.isAuthor = false,
    required this.favouriteSongs,
    required this.playlists,
    super.createdAt,
    super.updatedAt,
  });

  String get initials => (firstName.substring(0, 1) + lastName.substring(0, 1)).toUpperCase();
  String get displayName => '$firstName $lastName';

  @override
  List<Object?> get props => [
        ...super.props,
        firstName,
        lastName,
        picture,
        imageBg,
        isAuthor,
        favouriteSongs,
        playlists,
      ];
}
