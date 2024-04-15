part of 'universities_bloc.dart';

@immutable
abstract class UniversityEvent {}

class LoadUniversitiesEvent extends UniversityEvent {
  final String country;

  LoadUniversitiesEvent({required this.country});
}
