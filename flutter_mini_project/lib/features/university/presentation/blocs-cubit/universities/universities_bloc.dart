import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mini_project/core/utils/constants/loading_enum.dart';
import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/domain/constants/university_constants.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/university_mapper.dart';
import 'package:flutter_mini_project/features/university/domain/usecase/university_usecase.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'universities_event.dart';
part 'universities_state.dart';

class UniversityBloc extends HydratedBloc<UniversityEvent, UniversityState> {
  final UniversityUsecase _universityUsecase;

  UniversityBloc({
    required UniversityUsecase universityUsecase,
  })  : _universityUsecase = universityUsecase,
        super(const UniversityInitialState()) {
    on<LoadUniversitiesEvent>(_loadUniversities);
  }

  void _loadUniversities(
    LoadUniversitiesEvent event,
    Emitter<UniversityState> emit,
  ) async {
    emit(state.copyWith(status: LoadingState.loading));
    try {
      final universities =
          await _universityUsecase.getUniversities(event.country);
      if (universities.isEmpty) {
        emit(state.copyWith(status: LoadingState.empty));
      } else {
        emit(state.copyWith(
            universities: universities,
            country: event.country,
            status: LoadingState.loaded));
      }
    } catch (e) {
      emit(state.copyWith(status: LoadingState.failure));
    }
  }

  @override
  UniversityState? fromJson(Map<String, dynamic> json) {
    return UniversityState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UniversityState state) {
    return state.toJson();
  }
}
