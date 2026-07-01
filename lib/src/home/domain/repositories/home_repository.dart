import 'package:twelve_notes/src/home/data/mappers/home_data_mapper.dart';
import 'package:twelve_notes/src/home/data/services/home_service.dart';
import 'package:twelve_notes/src/home/domain/models/home_data.dart';

class HomeRepository {
  final HomeService _homeService;
  final HomeArtistMapper _artistMapper;
  final HomeSongMapper _songMapper;

  const HomeRepository({
    required HomeService homeService,
    required HomeArtistMapper artistMapper,
    required HomeSongMapper songMapper,
  })  : _homeService = homeService,
        _artistMapper = artistMapper,
        _songMapper = songMapper;

  Future<HomeData> getHomeData() async {
    final homeData = await Future.wait([
      _homeService.getHomeArtists(),
      _homeService.getHomeSong(),
    ]);

    final artists = homeData[0] as List<ArtistDTO>;
    final songs = homeData[1] as List<SongDTO>;

    return HomeData(
      artists: artists
          .map(
            (artist) => _artistMapper.toModel(artist),
          )
          .toList(growable: false),
      songs: songs
          .map(
            (song) => _songMapper.toModel(song),
          )
          .toList(growable: false),
    );
  }

  Future<HomeData> searchData(String query) async {
    if (query.trim().isEmpty) return HomeData(artists: [], songs: []);

    final results = await Future.wait([
      _homeService.searchArtists(query),
      _homeService.searchSongs(query),
    ]);

    final artists = results[0] as List<ArtistDTO>;
    final songs = results[1] as List<SongDTO>;

    return HomeData(
      artists: artists
          .map(_artistMapper.toModel)
          .toList(growable: false),
      songs: songs
          .map(_songMapper.toModel)
          .toList(growable: false),
    );
  }
}
