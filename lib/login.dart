import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icar/dialogbox/errorDialog.dart';
import 'package:icar/dialogbox/loadingDialog.dart';
import 'package:icar/homescreen.dart';

import 'package:icar/widgets/customField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Image.asset(
                "images/logo.png",
                height: 170.0,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFiled(
                  controller: _emailController,
                  hinText: "email",
                  isObsecure: false,
                  iconData: Icons.person,
                ),
                CustomTextFiled(
                  controller: _passwordController,
                  hinText: "password",
                  isObsecure: true,
                  iconData: Icons.lock,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 12.0),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    color: Colors.deepOrangeAccent,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty
                          ? _login()
                          : showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorAlertDialog(
                                  message:
                                      "Please write the credentials to login..",
                                );
                              });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    showDialog(
        context: context,
        builder: (context) {
          return LoadingAlertDialog(
            message: "Please wait..",
          );
        });
    User currentUser;
    await _auth
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = _auth.currentUser;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (contetx) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      Route newRoute = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushReplacement(context, newRoute);
    } else {
      print("error");
    }
  }
}
