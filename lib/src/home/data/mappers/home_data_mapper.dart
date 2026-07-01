import 'package:twelve_notes/src/data/mappers/mapper.dart';
import 'package:twelve_notes/src/home/data/services/home_service.dart';
import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';

class HomeArtistMapper extends Mapper<HomeArtist, ArtistDTO> {
  @override
  ArtistDTO toDTO(HomeArtist entity) {
    return ArtistDTO(
      name: entity.name,
      id: entity.id,
      image: entity.image,
    );
  }

  @override
  HomeArtist toModel(ArtistDTO dto) {
    return HomeArtist(
      name: dto.name,
      id: dto.id,
      image: dto.image,
    );
  }
}

class HomeSongMapper extends Mapper<HomeSong, SongDTO> {
  @override
  SongDTO toDTO(HomeSong entity) {
    return SongDTO(
      title: entity.title,
      id: entity.id,
      artist: entity.artist,
      genre: entity.genre,
      image: entity.image,
    );
  }

  @override
  HomeSong toModel(SongDTO dto) {
    return HomeSong(
      title: dto.title,
      id: dto.id,
      artist: dto.artist,
      genre: dto.genre,
      image: dto.image,
    );
  }
}
