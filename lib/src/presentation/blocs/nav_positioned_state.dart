part of 'nav_positioned_cubit.dart';

sealed class NavPositionedState extends Equatable {
  const NavPositionedState();

  @override
  List<Object> get props => [];
}

final class ShowNavPositioned extends NavPositionedState {}

final class NotShowNavPositioned extends NavPositionedState {}
