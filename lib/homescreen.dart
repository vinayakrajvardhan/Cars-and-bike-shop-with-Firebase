import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icar/authentication_screen.dart';
import 'package:icar/profilescreen.dart';
import 'package:icar/searchCar.dart';
import 'package:timeago/timeago.dart' as tAgo;

import 'functions.dart';
import 'globalvar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String userName;
  String userNumber;
  String carPrice;
  String carModel;
  String carColor;
  String description;
  String urlImage;
  String carLocation;
  QuerySnapshot cars;
  CarMethod carObj = new CarMethod();
  Future<bool> showDialogForAddingData() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Post a New Ad",
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "Bebas",
                letterSpacing: 1.2,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Enter your Name"),
                  onChanged: (value) {
                    this.userName = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Enter your PhoneNumbber"),
                  onChanged: (value) {
                    this.userNumber = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Price"),
                  onChanged: (value) {
                    this.carPrice = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Name"),
                  onChanged: (value) {
                    this.carModel = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Color"),
                  onChanged: (value) {
                    this.carColor = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Location"),
                  onChanged: (value) {
                    this.carLocation = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Write Car Description"),
                  onChanged: (value) {
                    this.description = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Image Url"),
                  onChanged: (value) {
                    this.urlImage = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            actions: [
              Container(
                width: 100,
                child: MaterialButton(
                  shape: StadiumBorder(),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                child: MaterialButton(
                  padding: EdgeInsets.all(5.0),
                  shape: StadiumBorder(),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    "Add Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Map<String, dynamic> carData = {
                      "userName": this.userName,
                      "uId": userId,
                      "userNumber": this.userNumber,
                      "carPrice": this.carPrice,
                      "carModel": this.carModel,
                      "carColor": this.carColor,
                      "carLocation": this.carLocation,
                      "description": this.description,
                      "urlImage": this.urlImage,
                      "imgPro": userImageUrl,
                      "time": DateTime.now(),
                    };
                    carObj.addData(carData).then((value) {
                      print("Data added successfully ");
                      Route newRoute =
                          MaterialPageRoute(builder: (context) => HomeScreen());
                      Navigator.pushReplacement(context, newRoute);
                    }).catchError((error) {
                      print(error);
                    });
                  },
                ),
              ),
            ],
          );
        });
  }

  Future<bool> showDialogForUpdateData(selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Update Data",
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "Bebas",
                letterSpacing: 1.2,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Enter your Name"),
                  onChanged: (value) {
                    this.userName = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Enter your PhoneNumbber"),
                  onChanged: (value) {
                    this.userNumber = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Price"),
                  onChanged: (value) {
                    this.carPrice = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Name"),
                  onChanged: (value) {
                    this.carModel = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Color"),
                  onChanged: (value) {
                    this.carColor = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Car Location"),
                  onChanged: (value) {
                    this.carLocation = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Write Car Description"),
                  onChanged: (value) {
                    this.description = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Enter Image Url"),
                  onChanged: (value) {
                    this.urlImage = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            actions: [
              Container(
                width: 100,
                child: MaterialButton(
                  shape: StadiumBorder(),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                child: MaterialButton(
                  padding: EdgeInsets.all(5.0),
                  shape: StadiumBorder(),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    "Update Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Map<String, dynamic> carData = {
                      "userName": this.userName,
                      "userNumber": this.userNumber,
                      "carPrice": this.carPrice,
                      "carModel": this.carModel,
                      "carColor": this.carColor,
                      "carLocation": this.carLocation,
                      "description": this.description,
                      "urlImage": this.urlImage,
                    };
                    carObj
                        .upDateData(selectedDoc, carData)((value) {
                      print("Data updated successfully ");
                      Route newRoute =
                          MaterialPageRoute(builder: (context) => HomeScreen());
                      Navigator.pushReplacement(context, newRoute);
                    })
                        .catchError((error) {
                      print(error);
                    });
                  },
                ),
              ),
            ],
          );
        });
  }

  getMyData() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get()
        .then((results) {
      setState(() {
        userImageUrl = results.data()["imgPro"];
        getUserName = results.data()["userName"];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser.uid;
    userEmail = FirebaseAuth.instance.currentUser.email;
    carObj.getData().then((results) {
      setState(() {
        cars = results;
      });
    });
    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    Widget showCarList() {
      if (cars != null) {
        return ListView.builder(
          itemCount: cars.docs.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, i) {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(cars.docs[i].data()['imgPro']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                                  sellerId: cars.docs[i].data()['uId'],
                                ));
                        Navigator.pushReplacement(context, newRoute);
                      },
                      child: Text(cars.docs[i].data()['userName']),
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                        Route newRoute = MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                                  sellerId: cars.docs[i].data()['uId'],
                                ));
                        Navigator.pushReplacement(context, newRoute);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cars.docs[i].data()['carLocation'],
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    trailing: cars.docs[i].data()['uId'] == userId
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (cars.docs[i].data()['uId'] == userId) {
                                    showDialogForUpdateData(cars.docs[i].id);
                                  }
                                },
                                child: Icon(
                                  Icons.edit_outlined,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (cars.docs[i].data()['uId'] == userId) {
                                    FirebaseFirestore.instance
                                        .collection('cars')
                                        .doc(cars.docs[i].id)
                                        .delete()
                                        .catchError((e) {
                                      print(e);
                                    });
                                    Route newRoute = MaterialPageRoute(
                                        builder: (context) => HomeScreen());
                                    Navigator.pushReplacement(
                                        context, newRoute);
                                  }
                                },
                                child: Icon(
                                  Icons.delete_forever_sharp,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [],
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.network(
                      cars.docs[i].data()['urlImage'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      '\$' + cars.docs[i].data()['carPrice'],
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontFamily: "Bebas",
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.directions_car,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Align(
                                child: Text(cars.docs[i].data()['carModel']),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch_later_outlined),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Align(
                                child: Text(tAgo.format(
                                    (cars.docs[i].data()["time"]).toDate())),
                                alignment: Alignment.topRight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.brush_outlined,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Align(
                                child: Text(cars.docs[i].data()["carColor"]),
                                alignment: Alignment.topLeft,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone_android),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Align(
                                child: Text(cars.docs[i].data()["userNumber"]),
                                alignment: Alignment.topRight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Align(
                      child: Text(
                        cars.docs[i].data()["description"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        );
      } else {
        return Text("Loading...");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: () {
            Route newRoute = MaterialPageRoute(builder: (_) => HomeScreen());
            Navigator.pushReplacement(context, newRoute);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Route newRoute =
                  MaterialPageRoute(builder: (_) => ProfileScreen());
              Navigator.pushReplacement(context, newRoute);
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Route newRoute = MaterialPageRoute(builder: (_) => SearchCar());
              Navigator.pushReplacement(context, newRoute);
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              auth.signOut().then((_) {
                Route newRoute =
                    MaterialPageRoute(builder: (_) => AutheneticationScreen());
                Navigator.pushReplacement(context, newRoute);
              });
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.login_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              colors: [Colors.blueAccent, Colors.redAccent],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: _screenWidth * .5,
          child: showCarList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          showDialogForAddingData();
        },
        tooltip: "Add Post",
        child: Icon(Icons.add),
      ),
    );
  }
}
