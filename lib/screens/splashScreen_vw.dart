import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'dart:async';

import 'pinkode.dart';

class SplasScreenview extends StatefulWidget {
  @override
  _SplasScreenviewState createState() => _SplasScreenviewState();
}

class _SplasScreenviewState extends State<SplasScreenview> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return PinKodeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      body: SafeArea(
              child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   tileMode: TileMode.repeated,
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight, 
                   colors: [Colors.yellow[900], Colors.blue[100],
                   ])
               ), 
          height: double.maxFinite,
          child: Stack(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Positioned(
                child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comic"),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/Icon-512.jpg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5 ,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "@JejoJepri 2020",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Comic"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
