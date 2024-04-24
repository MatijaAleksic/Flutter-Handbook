import 'package:flutter/material.dart';
import 'package:flutter_practice/Views/UsefulComponents/BlocPattern/bloc_homepage.dart';
import 'package:flutter_practice/Views/GoRouter/route_constants.dart';
import 'package:flutter_practice/Views/UsefulComponents/AlertDialog/alert_dialog.dart';
import 'package:flutter_practice/Views/UsefulComponents/Bottomsheet/bootom_sheet_example.dart';
import 'package:flutter_practice/Views/UsefulComponents/CustomPain/custom_paint.dart';
import 'package:flutter_practice/Views/UsefulComponents/DataTable/data_table.dart';
import 'package:flutter_practice/Views/UsefulComponents/DatePicker/date_picker.dart';
import 'package:flutter_practice/Views/UsefulComponents/FormValidation/form_validation_example.dart';
import 'package:flutter_practice/Views/UsefulComponents/ListTile/list_tile_example.dart';
import 'package:flutter_practice/Views/UsefulComponents/ListViewBuilder/list_view_builder_example.dart';
import 'package:flutter_practice/Views/UsefulComponents/NavigationComponents/NavigationDrawer/NavigationDrawerExample.dart';
import 'package:flutter_practice/Views/UsefulComponents/ProgressBar/progress_bar_example.dart';
import 'package:flutter_practice/Views/UsefulComponents/SilversScroll/sliver_scroll.dart';
import 'package:flutter_practice/Views/UsefulComponents/SliversGrid/slivers_grid.dart';
import 'package:flutter_practice/Views/UsefulComponents/TimePicker/time_picker.dart';
import 'package:go_router/go_router.dart';
import '../UsefulComponents/NavigationComponents/BottomNavigationBar/bottom_navigation_bar.dart';
import '../UsefulComponents/SnackBar/snack_bar_example.dart';
import 'go_router_homepage.dart';

GoRouter customRouter = GoRouter(routes: [
  GoRoute(
    name: RouteConstants.goRouterHomepage,
    path: '/',
    pageBuilder: (context, state) =>
        const MaterialPage(child: GoRouterHomepage()),
  ),
  GoRoute(
    name: RouteConstants.blocPatterHomepage,
    path: '/${RouteConstants.blocPatterHomepage}',
    pageBuilder: (context, state) => const MaterialPage(child: BlocHomepage()),
  ),
  GoRoute(
    name: RouteConstants.bottomNavigationBar,
    path: '/${RouteConstants.bottomNavigationBar}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: BottomNavigationBarExample()),
  ),
  GoRoute(
    name: RouteConstants.listViewBuilder,
    path: '/${RouteConstants.listViewBuilder}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: ListViewBuilderExample()),
  ),
  GoRoute(
    name: RouteConstants.bottomSheet,
    path: '/${RouteConstants.bottomSheet}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: BottomSheetExample()),
  ),
  GoRoute(
    name: RouteConstants.listTile,
    path: '/${RouteConstants.listTile}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: ListTileExampleMain()),
  ),
  GoRoute(
    name: RouteConstants.progressBar,
    path: '/${RouteConstants.progressBar}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: ProgressBarExampleMain()),
  ),
  GoRoute(
    name: RouteConstants.snackBar,
    path: '/${RouteConstants.snackBar}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: SnackBarExampleMain()),
  ),
  GoRoute(
    name: RouteConstants.alertDialog,
    path: '/${RouteConstants.alertDialog}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: AlertDialogExample()),
  ),
  GoRoute(
    name: RouteConstants.formValidation,
    path: '/${RouteConstants.formValidation}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: FormValidationExample()),
  ),
  GoRoute(
    name: RouteConstants.navigationDrawer,
    path: '/${RouteConstants.navigationDrawer}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: NavigationDrawerExample()),
  ),
  GoRoute(
    name: RouteConstants.sliverScroll,
    path: '/${RouteConstants.sliverScroll}',
    pageBuilder: (context, state) => const MaterialPage(child: SliverScroll()),
  ),
  GoRoute(
    name: RouteConstants.sliverGrid,
    path: '/${RouteConstants.sliverGrid}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: SliversGridExample()),
  ),
  GoRoute(
    name: RouteConstants.datePicker,
    path: '/${RouteConstants.datePicker}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: DatePickerExample()),
  ),
  GoRoute(
    name: RouteConstants.timePicker,
    path: '/${RouteConstants.timePicker}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: ShowTimePickerApp()),
  ),
  GoRoute(
    name: RouteConstants.customPainter,
    path: '/${RouteConstants.customPainter}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: CustomPainExample()),
  ),
  GoRoute(
    name: RouteConstants.dataTable,
    path: '/${RouteConstants.dataTable}',
    pageBuilder: (context, state) =>
        const MaterialPage(child: DataTableExample()),
  ),
]);
