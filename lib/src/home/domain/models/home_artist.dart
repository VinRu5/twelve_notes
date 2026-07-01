import 'package:equatable/equatable.dart';

class HomeArtist with EquatableMixin {
  final String name;
  final String id;
  final String image;

  HomeArtist({
    required this.name,
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        image,
      ];
}
