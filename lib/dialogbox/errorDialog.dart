import 'package:flutter/material.dart';
import 'package:icar/authentication_screen.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String message;

  const ErrorAlertDialog({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Route newRoute = MaterialPageRoute(
                builder: (context) => AutheneticationScreen());
            Navigator.pushReplacement(context, newRoute);
          },
          child: Center(
            child: Text("Ok"),
          ),
        ),
      ],
    );
  }
}
