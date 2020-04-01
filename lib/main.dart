import 'package:flutter/material.dart';
import 'package:pantaucovid19/screens/mainScreen.dart';
//import 'package:pantaucovid19/screens/mainScreen.dart';
import 'package:pantaucovid19/screens/splashScreen_vw.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "Pantau Covid19",
    theme: ThemeData(
     // primaryColor: Color(0xffd64136),
     primaryColor: Color(0xFFFF6f00),
    //  accentColor: Color(0xffd64136),
    accentColor: Color(0xFFFF6f00),
      cardTheme: CardTheme(
        color: Colors.white,
      ),
      colorScheme: ColorScheme.light().copyWith(surface: Colors.grey.shade100),
    ),
    home: SplasScreenview(),
    routes: {
      "/mainscreen": (context) => MainScreen()
    },
  );
  }
}