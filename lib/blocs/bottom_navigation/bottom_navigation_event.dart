part of 'bottom_navigation_bloc.dart';

@immutable
abstract class BottomNavigationEvent {}

class BottomNavigationManager extends BottomNavigationEvent {
  final int index;
  BottomNavigationManager(this.index);
}
