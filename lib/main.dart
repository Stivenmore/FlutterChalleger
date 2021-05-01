import 'package:challenger_02_05_2021/ui/Dashboard/Dashboard.dart';
import 'package:challenger_02_05_2021/ui/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenger',
      theme: ThemeData(
        accentColor: Colors.white
      ),
      home: SplasScreen()
    );
  }
}