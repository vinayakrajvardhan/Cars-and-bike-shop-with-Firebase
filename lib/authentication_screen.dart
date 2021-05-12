import 'package:flutter/material.dart';
import 'package:icar/login.dart';
import 'package:icar/register.dart';

class AutheneticationScreen extends StatefulWidget {
  @override
  _AutheneticationScreenState createState() => _AutheneticationScreenState();
}

class _AutheneticationScreenState extends State<AutheneticationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.redAccent],
                begin: FractionalOffset(0.0, 1.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [1.0, 0.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Cars and Bike Shop",
              style: TextStyle(
                  fontSize: 40.0, color: Colors.white, fontFamily: "Lobster"),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white38,
            indicatorWeight: 5.0,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                child: Text("Login"),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                child: Text("Register"),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.redAccent],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(1.0, 0.0),
            ),
          ),
          child: TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }
}
