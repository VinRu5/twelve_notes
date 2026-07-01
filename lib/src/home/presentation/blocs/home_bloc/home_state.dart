part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<HomeArtist> artists;
  final List<HomeSong> songs;

  const HomeLoaded({
    required this.artists,
    required this.songs,
  });

  @override
  List<Object> get props => [artists, songs];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}

final class HomeEmpty extends HomeState {}
