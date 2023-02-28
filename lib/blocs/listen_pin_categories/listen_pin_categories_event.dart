part of 'listen_pin_categories_bloc.dart';

@immutable
abstract class ListenPinCategsEvent {}

class ListenPinCategsManager extends ListenPinCategsEvent {
  final bool isPinned;
  ListenPinCategsManager(this.isPinned);
}
