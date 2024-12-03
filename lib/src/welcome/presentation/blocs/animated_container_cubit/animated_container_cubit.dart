import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedContainerCubit extends Cubit<bool> {
  AnimatedContainerCubit() : super(false);

  void toogleAnimation() => emit(!state);
}
