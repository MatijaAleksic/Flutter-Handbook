import 'package:flutter/material.dart';
import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/university_card.dart';

class UniversitiesListView extends StatelessWidget {
  const UniversitiesListView({required this.universities, super.key});

  final List<UniversityEntity> universities;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          prototypeItem: UniversityCard(university: universities.first),
          itemCount: universities.length,
          itemBuilder: (context, index) {
            return UniversityCard(university: universities[index]);
          }),
    );
  }
}
