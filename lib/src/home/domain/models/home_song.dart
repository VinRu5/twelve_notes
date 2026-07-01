import 'package:equatable/equatable.dart';

class HomeSong with EquatableMixin {
  final String title;
  final String id;
  final String artist;
  final String genre;
  final String image;

  HomeSong({
    required this.title,
    required this.id,
    required this.artist,
    required this.genre,
    required this.image,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        artist,
        genre,
        image,
      ];
}
