part of 'home_search_bloc.dart';

sealed class HomeSearchState extends Equatable {
  const HomeSearchState();

  @override
  List<Object> get props => [];
}

final class HomeSearchIdle extends HomeSearchState {}

final class HomeSearchLoading extends HomeSearchState {
  final String query;

  const HomeSearchLoading({required this.query});

  @override
  List<Object> get props => [query];
}

final class HomeSearchActive extends HomeSearchState {
  final String query;
  final List<HomeArtist> artists;
  final List<HomeSong> songs;

  const HomeSearchActive({
    required this.query,
    required this.artists,
    required this.songs,
  });

  @override
  List<Object> get props => [query, artists, songs];
}

final class HomeSearchError extends HomeSearchState {
  final String query;
  final String message;

  const HomeSearchError({
    required this.query,
    required this.message,
  });

  @override
  List<Object> get props => [query, message];
}
