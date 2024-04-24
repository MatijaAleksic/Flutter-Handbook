import 'package:flutter/material.dart';

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog Examples')),
        body: const Center(
          child: Column(children: [
            SimpleDialogExample(),
            SizedBox(height: 20),
            CredentialsInputDialog(),
            SizedBox(height: 20),
            FullScreenDialogExample()
          ]),
        ),
      ),
    );
  }
}

class SimpleDialogExample extends StatelessWidget {
  const SimpleDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Simple Dialog'),
    );
  }
}

class FullScreenDialogExample extends StatelessWidget {
  const FullScreenDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog.fullscreen(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('This is a fullscreen dialog.'),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
        child: const Text('Full screen dialog'));
  }
}

class CredentialsInputDialog extends StatelessWidget {
  const CredentialsInputDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (BuildContext context) => const FirstLastNameDialog(),
        );

        if (result != null) {
          print("--------------------------");
          print('Data recieved is $result');
          print("--------------------------");
        } else {
          print("--------------------------");
          print('DIALOG CANCELED');
          print("--------------------------");
        }
      },
      child: const Text("Show Dialog Form"),
    );
  }
}

class FirstLastNameDialog extends StatefulWidget {
  const FirstLastNameDialog({Key? key});

  @override
  _FirstLastNameDialogState createState() => _FirstLastNameDialogState();
}

class _FirstLastNameDialogState extends State<FirstLastNameDialog> {
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter your name'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'First Name'),
            onChanged: (value) {
              setState(() {
                firstName = value;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Last Name'),
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Combine first and last names and send back to the caller
            final fullName = '$firstName $lastName';
            Navigator.of(context).pop(fullName);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
