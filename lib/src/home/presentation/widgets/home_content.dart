import 'package:flutter/material.dart';
import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/home/presentation/widgets/song_tile_card.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class HomeContent extends StatelessWidget {
  final List<HomeArtist> artists;
  final List<HomeSong> songs;

  const HomeContent({
    super.key,
    required this.artists,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _SectionTitle(
                title: 'Popular Artists',
              ),
            ),
            SliverToBoxAdapter(
              child: _ArtistList(artists: artists),
            ),
            SliverToBoxAdapter(
              child: _SectionTitle(
                title: 'Popular Songs',
              ),
            ),
            SliverList.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTileCard(song: songs[index]),
            ),
          ],
        ),
      );
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          title,
          style: context.twelveStyle?.titleColorSmall,
        ),
      );
}

class _ArtistList extends StatelessWidget {
  final List<HomeArtist> artists;

  const _ArtistList({
    required this.artists,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: artists.length,
          itemBuilder: (context, index) {
            final artist = artists[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: context.colorScheme.primary,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(artist.image),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(artist.name),
                ],
              ),
            );
          },
        ),
      );
}
