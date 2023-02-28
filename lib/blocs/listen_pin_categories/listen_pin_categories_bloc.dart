import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'listen_pin_categories_event.dart';
part 'listen_pin_categories_state.dart';

class ListenPinCategsBloc
    extends Bloc<ListenPinCategsEvent, ListenPinCategsState> {
  bool isPinned = false;
  ListenPinCategsBloc() : super(ListenPinCategsInitial()) {
    on<ListenPinCategsManager>((event, emit) {
      if (event.isPinned) {
        isPinned = event.isPinned;
        emit(ListenPinCategsPinned());
      }
      emit(ListenPinCategsInitial());
    });
  }
}
