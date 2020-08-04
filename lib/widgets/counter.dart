import 'package:flutter/material.dart';
import '../constants.dart';


class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: KInfectedColor.withOpacity(.20),
          ),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: KInfectedColor,
                  width: 2,
                )),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(fontSize: 40, color: color),
        ),
        Text("$title", style: KSubTextStyle)
      ],
    );
  }
}

