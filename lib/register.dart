import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icar/dialogbox/errorDialog.dart';
import 'package:icar/homescreen.dart';
import 'package:icar/widgets/customField.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'globalvar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _phoneConfirmController = TextEditingController();
  final _imageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Image.asset(
                "images/register.png",
                height: 270.0,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFiled(
                  iconData: Icons.person,
                  hinText: "Name",
                  isObsecure: false,
                  controller: _nameController,
                ),
                CustomTextFiled(
                  iconData: Icons.phone,
                  hinText: "Phone",
                  isObsecure: false,
                  controller: _phoneConfirmController,
                ),
                CustomTextFiled(
                  iconData: Icons.email,
                  hinText: "Email",
                  isObsecure: false,
                  controller: _emailController,
                ),
                CustomTextFiled(
                  iconData: Icons.camera_alt_outlined,
                  hinText: "Image Url",
                  isObsecure: false,
                  controller: _imageController,
                ),
                CustomTextFiled(
                  iconData: Icons.lock,
                  hinText: "Password",
                  isObsecure: true,
                  controller: _passwordController,
                ),
                CustomTextFiled(
                  iconData: Icons.lock,
                  hinText: "Confirm Password",
                  isObsecure: true,
                  controller: _passwordConfirmController,
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
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _register();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveData() {
    Map<String, dynamic> userData = {
      "userName": _nameController.text.trim(),
      "uid": userId,
      "userNumber": _phoneConfirmController.text.trim(),
      "imgPro": _imageController.text.trim(),
      "time": DateTime.now(),
    };

    FirebaseFirestore.instance.collection("users").doc(userId).set(userData);
  }

  void _register() async {
    User currentuser;
    await _auth
        .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
        .then((auth) {
      currentuser = auth.user;
      userId = currentuser.uid;
      userEmail = currentuser.email;
      getUserName = _nameController.text.trim();
      saveData();
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentuser != null) {
      Route newRoute = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushReplacement(context, newRoute);
    }
  }
}
