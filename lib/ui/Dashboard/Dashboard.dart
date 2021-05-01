import 'package:challenger_02_05_2021/ui/Dashboard/Home/Home.dart';
import 'package:challenger_02_05_2021/ui/Dashboard/NavBar/NavBar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Home(),
        NavBar()
      ],
    );
  }
}
