import 'package:flutter/material.dart';
import 'package:flutter_practice/Views/GoRouter/route_constants.dart';
import 'package:flutter_practice/Views/GoRouter/router_button.dart';

class GoRouterHomepage extends StatelessWidget {
  const GoRouterHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoRouter Homepage"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        crossAxisCount: 2,
        childAspectRatio: 7 / 2,
        children: const [
          RouterButton(
              name: 'Bloc Pattern',
              path: RouteConstants.blocPatterHomepage,
              buttonColor: Colors.green),
          RouterButton(
              name: "Bottom Navigation Bar",
              path: RouteConstants.bottomNavigationBar,
              buttonColor: Colors.deepPurpleAccent),
          RouterButton(
              name: "Bottom Sheet",
              path: RouteConstants.bottomSheet,
              buttonColor: Colors.amber),
          RouterButton(
              name: "List Tile",
              path: RouteConstants.listTile,
              buttonColor: Colors.blueGrey),
          RouterButton(
              name: "Progress Bar",
              path: RouteConstants.progressBar,
              buttonColor: Colors.cyanAccent),
          RouterButton(
              name: "Snack Bar",
              path: RouteConstants.snackBar,
              buttonColor: Colors.teal),
          RouterButton(
              name: "Alert Dialog",
              path: RouteConstants.alertDialog,
              buttonColor: Colors.red),
          RouterButton(
              name: "Form Validation",
              path: RouteConstants.formValidation,
              buttonColor: Colors.black),
          RouterButton(
              name: "Navigation drawer",
              path: RouteConstants.navigationDrawer,
              buttonColor: Colors.lightBlue),
          RouterButton(
              name: "List View Builder",
              path: RouteConstants.listViewBuilder,
              buttonColor: Colors.deepOrangeAccent),
          RouterButton(
              name: "Sliver scroll",
              path: RouteConstants.sliverScroll,
              buttonColor: Colors.purpleAccent),
          RouterButton(
              name: "Sliver grid",
              path: RouteConstants.sliverGrid,
              buttonColor: Colors.orange),
          RouterButton(
              name: "Date picker",
              path: RouteConstants.datePicker,
              buttonColor: Colors.deepPurple),
          RouterButton(
              name: "Time picker",
              path: RouteConstants.timePicker,
              buttonColor: Colors.green),
          RouterButton(
              name: "Custom painter",
              path: RouteConstants.customPainter,
              buttonColor: Colors.red),
          RouterButton(
              name: "Data table",
              path: RouteConstants.dataTable,
              buttonColor: Colors.blue),
        ],
      ),
    );
  }
}
