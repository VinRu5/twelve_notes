import 'package:flutter/material.dart';
import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/home/presentation/blocs/home_search_bloc/home_search_bloc.dart';
import 'package:twelve_notes/src/home/presentation/widgets/song_tile.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/loader.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class SearchResultsWidget extends StatelessWidget {
  final HomeSearchState state;

  const SearchResultsWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) => switch (state) {
        HomeSearchLoading() => const Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(child: Loader()),
          ),
        HomeSearchActive(:final artists, :final songs) =>
          _SearchResults(artists: artists, songs: songs),
        HomeSearchError(:final message) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Text(message)),
          ),
        _ => const SizedBox.shrink(),
      };
}

class _SearchResults extends StatelessWidget {
  final List<HomeArtist> artists;
  final List<HomeSong> songs;

  const _SearchResults({
    required this.artists,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty && songs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(context.appStrings.searchNoResults),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (artists.isNotEmpty) ...[
          _SearchSectionHeader(title: context.appStrings.searchSectionArtists),
          ...artists.map((artist) => _ArtistResultTile(artist: artist)),
        ],
        if (songs.isNotEmpty) ...[
          _SearchSectionHeader(title: context.appStrings.searchSectionSongs),
          ...songs.map((song) => SongTile(
                song: song,
                radius: 32.0,
              )),
        ],
      ],
    );
  }
}

class _SearchSectionHeader extends StatelessWidget {
  final String title;

  const _SearchSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 4.0),
        child: Text(
          title,
          style: context.twelveStyle?.titleColorSmall,
        ),
      );
}

class _ArtistResultTile extends StatelessWidget {
  final HomeArtist artist;

  const _ArtistResultTile({required this.artist});

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: context.colorScheme.primary,
          child: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(artist.image),
          ),
        ),
        title: Text(artist.name),
      );
}
