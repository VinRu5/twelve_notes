import 'package:twelve_notes/src/song_player/domain/models/artist.dart';
import 'package:twelve_notes/src/domain/models/model.dart';

class Album extends Model {
  final String name;
  final String? image;
  final Artist artist;

  Album({
    super.id,
    super.createdAt,
    super.updatedAt,
    required this.name,
    this.image,
    required this.artist,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        image,
        artist,
      ];
}
