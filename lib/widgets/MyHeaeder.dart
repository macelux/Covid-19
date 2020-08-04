import 'package:flutter/material.dart';

import 'package:covid_19/constants.dart';

import 'package:covid_19/info_screen.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;

  const MyHeader({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 30, right: 1),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  color: Colors.white,
                  iconSize: 25,
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfoScreen();
                    }));
                  }),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Image.asset(
                  //   "assets/images/avatar-3.jpg",
                  //   width: 230,
                  //   fit: BoxFit.fitWidth,
                  //   alignment: Alignment.topCenter,
                  // ),
                  Positioned(
                    top: 20,
                    left: 130,
                    child: Text(
                      '$textTop \n$textBottom',
                      style: KHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
