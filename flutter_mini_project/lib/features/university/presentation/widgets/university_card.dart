import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/constants/app_assets.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';
import 'package:flutter_mini_project/features/university/domain/constants/university_constants.dart';

class UniversityCard extends StatelessWidget {
  final UniversityEntity university;

  const UniversityCard({super.key, required this.university});

  _onUniversityCardClick(BuildContext context) {
    AppRoutes.university.push(context,
        extra: {UniversityConstants.extraUniversity: university});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onUniversityCardClick(context),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: context.height / 7,
              child: Row(children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.asset(AppAssets.noImagePath),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _UniversityName(universityName: university.name),
                          const Padding(padding: EdgeInsets.only(bottom: 5)),
                          _UniversityCountry(
                              universityCountry: university.country!),
                        ],
                      )),
                ),
              ]),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _UniversityName extends StatelessWidget {
  final String? universityName;

  const _UniversityName({this.universityName});

  @override
  Widget build(BuildContext context) {
    return Text(
      universityName!,
      maxLines: 2,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _UniversityCountry extends StatelessWidget {
  final String? universityCountry;

  const _UniversityCountry({this.universityCountry});

  @override
  Widget build(BuildContext context) {
    return Text(
      universityCountry!,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.black54,
      ),
    );
  }
}
