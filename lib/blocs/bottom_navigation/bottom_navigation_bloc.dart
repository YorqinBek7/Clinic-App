import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_event.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, int> {
  BottomNavigationBloc() : super(0) {
    on<BottomNavigationEvent>((event, emit) {});
  }
}
