import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double miniheight = 80;
  double miniwidth = 170;
  double dy, dx;
  verticalEnd(details) {
    setState(() {
      miniheight = 80;
      miniwidth = 170;
    });
    print(miniheight);
  }

  verticalupdate(details, size) {
    dy = (details.localPosition.dy / 100);
    setState(() {});
    if (miniheight > 80) {
      setState(() {});
      miniheight = miniheight - (dy * 0.5);
      miniwidth = miniwidth - 2;
      setState(() {});
      print(miniheight);
    } else {
      miniheight = 80;
      miniwidth = 170;
    }
  }

  expandedtap(size) {
    setState(() {
      miniheight = size.height / 2;
      miniwidth = size.width;
    });
    print(miniheight);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) =>
          verticalupdate(details, size),
      onVerticalDragEnd: (DragEndDetails details) => verticalEnd(
        details,
      ),
      onTap: () => expandedtap(size),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 800),
        padding:
            EdgeInsets.only(bottom: (miniheight < size.height / 2) ? 30 : 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration:
                Duration(milliseconds: miniheight < size.height / 2 ? 0 : 1000),
            curve: miniheight < size.height / 2
                ? Curves.bounceIn
                : Curves.elasticInOut,
            height: miniheight,
            width: miniwidth,
            decoration: BoxDecoration(
                borderRadius: miniheight < size.height / 2
                    ? BorderRadius.circular(24)
                    : BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46)),
                color: Color(0xff5B00C5)),
            child: miniheight < 85
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.all_inclusive_rounded, color: Colors.white),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/albums/img3.png'),
                      ),
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/avatar/avatar.png'),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage('assets/albums/img2.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 5,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color(0xff5A0095),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Bloody Teor',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 25,
                        ),
                        Stack(
                          children: [
                             Center(
                               child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                    child: Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                        width: size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.topRight,
                                                colors: [
                                                  Color(0xff5A0095),
                                              Color(0xffAE52FF),
                                              Color(0xff4C65F6),
                                              Color(0xff4C65F6),
                                              Color(0xff3981E9),
                                              Color(0xffAE52FF),
                                              Color(0xff5A0095)
                                            ]   )),
                                      ),
                                    ),
                                  ),
                               
                             ),
                            Center(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 2),
                                child: Container(
                                  height:65,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    color: Color(0xffBBF1ED)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height:50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(CupertinoIcons.bluetooth, color: Colors.white, size: 32,),
                             Icon(CupertinoIcons.pause, color: Colors.white, size: 32,),
                              Icon(CupertinoIcons.chevron_right_2, color: Colors.white, size: 32,),
                          ],
                        ),
                        const SizedBox(height:50,),
                       Container(
                            height: 4,
                            width:150,
                            decoration: BoxDecoration(
                              color: Colors.white
                            )
                          ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
