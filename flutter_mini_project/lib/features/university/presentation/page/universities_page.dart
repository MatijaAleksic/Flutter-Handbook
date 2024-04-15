import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/utils/constants/loading_enum.dart';
import 'package:flutter_mini_project/core/utils/widgets/defualt_state_widget.dart';
import 'package:flutter_mini_project/core/utils/widgets/error_state_widget.dart';
import 'package:flutter_mini_project/core/utils/widgets/loading_state_widge.dart';
import 'package:flutter_mini_project/features/university/presentation/blocs-cubit/universities/universities_bloc.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/country_dropdown_menu/country_dropdown_menu.dart';
import 'package:flutter_mini_project/features/university/presentation/widgets/universities_list_view.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({super.key});

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  @override
  void initState() {
    _fetchInitialUniversities();
    super.initState();
  }

  void _fetchInitialUniversities() {
    UniversityState universityState =
        serviceLocator.get<UniversityBloc>().state;

    if (universityState.status == LoadingState.initial) {
      context
          .read<UniversityBloc>()
          .add(LoadUniversitiesEvent(country: universityState.country));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
              child: CountryDropdownMenu(
                width: 200,
                menuHeight: 400,
              ),
            ),
            BlocBuilder<UniversityBloc, UniversityState>(
              builder: (context, state) {
                switch (state.status) {
                  case LoadingState.loading:
                    return const LoadingStateWidget();
                  case LoadingState.loaded:
                    return UniversitiesListView(
                      universities: state.universities,
                    );
                  case LoadingState.failure:
                    return const ErrorStateWidget(
                      errorMessage: 'ERROR: Something went wrong',
                    );
                  default:
                    return const DefaultStateWidget(
                      message: "No universities found",
                    );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
