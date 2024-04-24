import 'package:flutter/material.dart';


class FormValidationExample extends StatefulWidget {
  const FormValidationExample({super.key});

  @override
  FormValidationExampleState createState() {
    return FormValidationExampleState();
  }
}

class FormValidationExampleState extends State<FormValidationExample> {

  final _formKey = GlobalKey<FormState>(); //globalni kljuc da se zna o kojoj formi je rec

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 200, 30, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Name"
                ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field cannot be empty';
                }
                if(value.length < 4){
                  return 'Name must be at least 4 characters long';
                }
                if(value.length > 6){
                  return 'Name must be less than 6 characters long';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('Processing Data')),
                  // );
                  print('---------------------');
                  print("VALIDATION SUCCESS!");
                  print('---------------------');

                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
