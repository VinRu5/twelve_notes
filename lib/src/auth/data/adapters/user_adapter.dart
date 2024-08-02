import 'package:twelve_notes/src/auth/domain/models/user.dart';
import 'package:twelve_notes/src/data/adapters/firebase_adpter.dart';

class UserAdapter implements FirebaseAdapter<User> {
  static const firstNameKey = 'first_name';
  static const lastNameKey = 'last_name';
  static const pictureKey = 'picture';
  static const imageBgKey = 'image_bg';
  static const isAuthorKey = 'is_author';
  static const favoutireSongsKey = 'favourite_songs';
  static const playlistKey = 'playlists';
  static const createdAtKey = 'created_at';
  static const updateAtKey = 'updated_at';

  @override
  User fromFirebase(Map<String, dynamic> map) => User(
        firstName: map[firstNameKey],
        lastName: map[lastNameKey],
        picture: map[pictureKey],
        imageBg: map[imageBgKey],
        isAuthor: map[isAuthorKey],
        favouriteSongs: map[favoutireSongsKey],
        playlists: map[playlistKey],
        createdAt: map[createdAtKey] != null
            ? DateTime.fromMillisecondsSinceEpoch(map[createdAtKey])
            : null,
        updatedAt:
            map[updateAtKey] != null ? DateTime.fromMillisecondsSinceEpoch(map[updateAtKey]) : null,
      );

  @override
  Map<String, dynamic> toFirebase(User entity) => {
        UserAdapter.firstNameKey: entity.firstName,
        UserAdapter.lastNameKey: entity.lastName,
        UserAdapter.pictureKey: entity.picture,
        UserAdapter.imageBgKey: entity.imageBg,
        UserAdapter.isAuthorKey: entity.isAuthor,
        UserAdapter.favoutireSongsKey: entity.favouriteSongs,
        UserAdapter.playlistKey: entity.playlists,
        UserAdapter.createdAtKey: entity.createdAt.millisecondsSinceEpoch,
        UserAdapter.updateAtKey: entity.updatedAt?.millisecondsSinceEpoch,
      };
}

/*
factory City.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return City(
      name: data?['name'],
      state: data?['state'],
      country: data?['country'],
      capital: data?['capital'],
      population: data?['population'],
      regions: data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (state != null) "state": state,
      if (country != null) "country": country,
      if (capital != null) "capital": capital,
      if (population != null) "population": population,
      if (regions != null) "regions": regions,
    };
  }
  */