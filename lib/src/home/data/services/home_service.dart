import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class HomeService {
  Future<List<ArtistDTO>> _loadArtists() async {
    final json = await rootBundle.loadString('assets/mocks/home_artists.json');
    final List<dynamic> list = jsonDecode(json);
    return list.map((e) => ArtistDTO.fromJson(e)).toList();
  }

  Future<List<SongDTO>> _loadSongs() async {
    final json = await rootBundle.loadString('assets/mocks/home_search.json');
    final List<dynamic> list = jsonDecode(json);
    return list.map((e) => SongDTO.fromJson(e)).toList();
  }

  Future<List<ArtistDTO>> getHomeArtists() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _loadArtists();
  }

  Future<List<SongDTO>> getHomeSong() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _loadSongs();
  }

  Future<List<ArtistDTO>> searchArtists(String query) async {
    final all = await _loadArtists();
    final q = query.toLowerCase();
    return all.where((a) => a.name.toLowerCase().contains(q)).toList();
  }

  Future<List<SongDTO>> searchSongs(String query) async {
    final all = await _loadSongs();
    final q = query.toLowerCase();
    return all
        .where(
          (s) =>
              s.title.toLowerCase().contains(q) ||
              s.artist.toLowerCase().contains(q),
        )
        .toList();
  }
}

class ArtistDTO with EquatableMixin {
  final String name;
  final String id;
  final String image;

  const ArtistDTO({
    required this.name,
    required this.id,
    required this.image,
  });

  factory ArtistDTO.fromJson(Map<String, dynamic> json) {
    return ArtistDTO(
      name: json['name'] as String,
      id: json['id'] as String,
      image: json['avatar_image'] as String,
    );
  }

  @override
  List<Object?> get props => [
        name,
        id,
        image,
      ];
}

class SongDTO with EquatableMixin {
  final String title;
  final String id;
  final String artist;
  final String genre;
  final String image;

  const SongDTO({
    required this.title,
    required this.id,
    required this.artist,
    required this.genre,
    required this.image,
  });

  factory SongDTO.fromJson(Map<String, dynamic> json) {
    return SongDTO(
      title: json['title'] as String,
      id: json['id'] as String,
      artist: json['artist'] as String,
      genre: json['genre'] as String,
      image: json['image'] as String,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        artist,
        genre,
        image,
      ];
}
