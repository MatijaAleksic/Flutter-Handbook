part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent {}

class BottomNavBarUniversityEvent extends BottomNavBarEvent {}

class BottomNavBarProfileEvent extends BottomNavBarEvent {}

class BottomNavBarChangedEvent extends BottomNavBarEvent {
  final int pageIndex;

  BottomNavBarChangedEvent({required this.pageIndex});
}
