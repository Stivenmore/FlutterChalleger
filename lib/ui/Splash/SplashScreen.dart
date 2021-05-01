import 'package:challenger_02_05_2021/data/repository.dart';
import 'package:challenger_02_05_2021/ui/Dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({Key key}) : super(key: key);

  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  final Artists artists;

  _SplasScreenState({this.artists});
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/animation/lottie.json',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                backgroundColor: Color(0xff5B00C5),
              )
            ],
          ),
        ));
  }
}
