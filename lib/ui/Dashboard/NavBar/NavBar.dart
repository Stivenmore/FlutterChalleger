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
        duration: Duration(milliseconds: 700),
        padding:
            EdgeInsets.only(bottom: (miniheight < size.height / 2) ? 10 : 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: miniheight < size.height / 2? 0 : 1000),
            curve: Curves.elasticInOut,
            height: miniheight,
            width: miniwidth,
            decoration: BoxDecoration(
                borderRadius: miniheight < size.height / 2
                    ? BorderRadius.circular(24)
                    : BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46)),
                color: Color(0xff5B00C5)),
            child: miniheight == 80
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
                : Column(),
          ),
        ),
      ),
    );
  }
}
