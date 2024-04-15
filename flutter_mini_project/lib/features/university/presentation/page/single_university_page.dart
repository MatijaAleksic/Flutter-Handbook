import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/constants/app_assets.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/core/utils/extensions/string_extension.dart';
import 'package:flutter_mini_project/features/university/data/entities/university_entity.dart';

class SingleUniversityPage extends StatelessWidget {
  final UniversityEntity university;

  const SingleUniversityPage({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const _GoBackButton(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const _UniversityAvatar(),
            _UniversityTile(name: university.name),
            const SizedBox(height: 20),
            const Divider(),
            _UniversitStringDataDisplay(
              name: "Country",
              value: university.country,
            ),
            _UniversitStringDataDisplay(
              name: "AlphaTwoCode",
              value: university.alphaTwoCode,
            ),
            _UniversityStringListDataDisplay(
              name: "Web Pages",
              list: university.webPages,
            ),
            _UniversitStringDataDisplay(
              name: "State Province",
              value: university.stateProvince,
            ),
            _UniversityStringListDataDisplay(
              name: "Domains",
              list: university.domains,
            ),
          ],
        ),
      ),
    );
  }
}

class _UniversitStringDataDisplay extends StatelessWidget {
  final String? name;
  final String? value;
  const _UniversitStringDataDisplay({this.name, this.value});

  @override
  Widget build(BuildContext context) {
    if (value.isEmptyOrNull) return const SizedBox.shrink();
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                '$name: '),
            Text(value!),
          ],
        )
      ],
    );
  }
}

class _UniversityStringListDataDisplay extends StatelessWidget {
  final String? name;
  final List<String>? list;
  const _UniversityStringListDataDisplay({this.name, this.list});

  @override
  Widget build(BuildContext context) {
    if (list == null) return const SizedBox.shrink();
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                '$name: '),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list!.map((element) => Text(element)).toList()),
          ],
        ),
      ],
    );
  }
}

class _UniversityAvatar extends StatelessWidget {
  const _UniversityAvatar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(0, context.height / 50, 0, context.height / 50),
      child: CircleAvatar(
        radius: context.height / 10,
        backgroundImage: AssetImage(AppAssets.noImagePath),
      ),
    );
  }
}

class _UniversityTile extends StatelessWidget {
  final String? name;

  const _UniversityTile({required this.name});

  @override
  Widget build(BuildContext context) {
    if (name.isEmptyOrNull) return const SizedBox.shrink();
    return Text(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        name!);
  }
}

class _GoBackButton extends StatelessWidget {
  const _GoBackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColors.primaryColor),
              child:
                  const Text(style: TextStyle(color: Colors.white), 'Go Back'),
              onPressed: () => AppRoutes.university.goBack(context)),
        ));
  }
}
