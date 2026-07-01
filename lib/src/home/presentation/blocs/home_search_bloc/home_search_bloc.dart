import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/home/domain/repositories/home_repository.dart';

part 'home_search_event.dart';
part 'home_search_state.dart';

EventTransformer<E> _debounce<E>(Duration duration) =>
    (events, mapper) => events.debounceTime(duration).switchMap(mapper);

class HomeSearchBloc extends Bloc<HomeSearchEvent, HomeSearchState> {
  final HomeRepository _homeRepository;

  HomeSearchBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(HomeSearchIdle()) {
    on<HomeSearchQueryChanged>(
      _onQueryChanged,
      transformer: _debounce(const Duration(milliseconds: 300)),
    );
    on<HomeSearchCleared>(_onCleared);
  }

  Future<void> _onQueryChanged(
    HomeSearchQueryChanged event,
    Emitter<HomeSearchState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(HomeSearchIdle());
      return;
    }

    emit(HomeSearchLoading(query: event.query));

    try {
      final result = await _homeRepository.searchData(event.query);
      emit(
        HomeSearchActive(
          query: event.query,
          artists: result.artists,
          songs: result.songs,
        ),
      );
    } catch (e) {
      emit(HomeSearchError(query: event.query, message: e.toString()));
    }
  }

  void _onCleared(
    HomeSearchCleared event,
    Emitter<HomeSearchState> emit,
  ) {
    emit(HomeSearchIdle());
  }
}
