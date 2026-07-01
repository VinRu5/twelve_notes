import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/home/domain/models/home_artist.dart';
import 'package:twelve_notes/src/home/domain/models/home_song.dart';
import 'package:twelve_notes/src/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchHomeData>(_fetchHomeData);
  }

  FutureOr<void> _fetchHomeData(FetchHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final homeData = await homeRepository.getHomeData();
      emit(HomeLoaded(artists: homeData.artists, songs: homeData.songs));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  void fetchData() => add(FetchHomeData());
}
