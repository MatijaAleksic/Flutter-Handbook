import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: DataTable(
            border: TableBorder.all(
              width: 1,
              color: Colors.black,
            ),
            columns: const [
              DataColumn(
                  label: Text(
                'FirstName',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
              DataColumn(
                  label: Text(
                'LastName',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
              DataColumn(
                  label: Text(
                'Age',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("Pera")),
                DataCell(Text("Peric")),
                DataCell(Text("12")),
              ]),
              DataRow(cells: [
                DataCell(Text("Pera")),
                DataCell(Text("Peric")),
                DataCell(Text("12")),
              ]),
              DataRow(cells: [
                DataCell(Text("Pera")),
                DataCell(Text("Peric")),
                DataCell(Text("12")),
              ]),
            ]),
      ),
    );
  }
}
