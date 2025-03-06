import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_positioned_state.dart';

class NavPositionedCubit extends Cubit<NavPositionedState> {
  NavPositionedCubit() : super(ShowNavPositioned());

  showNavbar(bool showNav) => showNav ? emit(ShowNavPositioned()) : emit(NotShowNavPositioned());
}
