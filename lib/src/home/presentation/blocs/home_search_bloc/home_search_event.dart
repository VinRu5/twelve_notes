part of 'home_search_bloc.dart';

sealed class HomeSearchEvent extends Equatable {
  const HomeSearchEvent();

  @override
  List<Object> get props => [];
}

final class HomeSearchQueryChanged extends HomeSearchEvent {
  final String query;

  const HomeSearchQueryChanged({required this.query});

  @override
  List<Object> get props => [query];
}

final class HomeSearchCleared extends HomeSearchEvent {}

