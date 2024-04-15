import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarUniversityState()) {
    on<BottomNavBarChangedEvent>(_onBottomNavBarIndexChanged);
  }

  void _onBottomNavBarIndexChanged(
      BottomNavBarChangedEvent event, Emitter<BottomNavBarState> emit) {
    if (event.pageIndex == 0) {
      emit(BottomNavBarUniversityState());
    }
    if (event.pageIndex == 1) {
      emit(BottomNavBarProfileState());
    }
  }
}
