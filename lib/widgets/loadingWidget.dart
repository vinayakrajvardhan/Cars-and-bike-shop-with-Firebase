import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    padding: EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.lightGreenAccent,
      ),
    ),
  );
}

linearProgress() {
  return Container(
    padding: EdgeInsets.only(top: 12.0),
    alignment: Alignment.center,
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
    ),
  );
}
