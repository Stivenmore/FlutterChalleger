import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool state = false;
  double miniheight = 80;
  double miniwidth = 150;
  double dy, dx;

      verticalupdate(details){
            print('Update');
        print(details.localPosition);
        print('dy ' + '${details.localPosition.dy / 100}');
        print('dx ' + '${details.localPosition.dx / 100}');
         dy = (details.localPosition.dy / 100) * 10;
         dx = (details.localPosition.dx / 100) * 10;
        setState(() {
          if (dy < 80 && dx < 120) {
            miniheight = dy;
            miniwidth = dx;
          } else {
            miniwidth = 150;
            miniheight = 80;
          }
        });
      }
      expandedtap(size){
        setState(() {
          miniheight = size.height / 2;
          miniwidth = size.width;
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) => verticalupdate(details),
      onTap: () => expandedtap(size),
      child: AnimatedPadding(
        duration: Duration(milliseconds: 700),
        padding:
            EdgeInsets.only(bottom: (miniheight < size.height / 2) ? 10 : 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1200),
            curve: state ? Curves.linear : Curves.elasticInOut,
            height: miniheight,
            width: miniwidth,
            constraints: BoxConstraints(
              minHeight: 80,
              minWidth: 150,
              maxHeight: size.height/2,
              maxWidth: size.width
            ),
            decoration: BoxDecoration(
                borderRadius: miniheight < size.height / 2
                    ? BorderRadius.circular(24)
                    : BorderRadius.only(
                        topLeft: Radius.circular(46),
                        topRight: Radius.circular(46)),
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
