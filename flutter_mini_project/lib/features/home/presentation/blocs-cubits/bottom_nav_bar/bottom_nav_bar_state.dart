part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarState {
  int pageIndex;

  BottomNavBarState({required this.pageIndex});
}

class BottomNavBarUniversityState extends BottomNavBarState {
  BottomNavBarUniversityState() : super(pageIndex: 0);
}

class BottomNavBarProfileState extends BottomNavBarState {
  BottomNavBarProfileState() : super(pageIndex: 1);
}
