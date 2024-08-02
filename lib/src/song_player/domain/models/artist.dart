import 'package:twelve_notes/src/domain/models/model.dart';

class Artist extends Model {
  final String name;
  final String? image;

  Artist({
    super.id,
    super.createdAt,
    super.updatedAt,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        image,
      ];
}
