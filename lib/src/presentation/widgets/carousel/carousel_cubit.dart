import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker/talker.dart';

class CarouselCubit extends Cubit<int> {
  final Talker? talker;
  final int totalPage;
  final bool autoAnimation;

  Timer? timer;

  CarouselCubit({
    required this.totalPage,
    this.autoAnimation = true,
    this.talker,
  }) : super(0) {
    if (autoAnimation) {
      timer = Timer.periodic(
        const Duration(seconds: 4),
        _handleTimer,
      );
    }
  }

  int get lastIndexPage => totalPage - 1;

  final PageController pageController = PageController();

  void onPageChanged(int page) {
    talker?.debug(page);
    if (!autoAnimation) {
      emit(page);
    }
  }

  void _handleTimer(Timer timer) {
    if (state == lastIndexPage) {
      // timer.cancel();
      emit(-1);
    }
    if (state < lastIndexPage) {
      emit(state + 1);
    }
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
