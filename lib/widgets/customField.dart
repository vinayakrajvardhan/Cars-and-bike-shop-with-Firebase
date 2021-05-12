import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hinText;
  bool isObsecure = true;

  CustomTextFiled(
      {Key key, this.controller, this.iconData, this.hinText, this.isObsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10.0),
      width: _screenWidth * .5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
          prefixIcon: Icon(
            iconData,
            color: Colors.cyan,
          ),
          focusColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
