import 'package:flutter/material.dart';
import './widgets//MyHeaeder.dart';
import './constants.dart';
import 'package:covid_19/fetch_screen.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/images/avatar-5.jpg",
              textTop: "Get to know",
              textBottom: "About Covid-19",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Text("Symptoms", style: KTitleTextStyle),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 8, // gap between adjacent box
                    runSpacing: 6.0, // gap between lines
                    direction: Axis.horizontal,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymtomCard(
                        image: "assets/images/reminder.png",
                        title: "headache",
                      ),
                      SymtomCard(
                        image: "assets/images/reminder.png",
                        title: "Cover",
                        isActive: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Prevention", style: KTitleTextStyle),
                  SizedBox(height: 20),
                  PreventCard(
                    image: "assets/images/avatar-4.jpg",
                    title: "Wear face mask",
                    text: "WE all know that it is important to wear a facemask",
                  ),
                  PreventCard(
                    image: "assets/images/avatar-2.jpg",
                    title: "Wear face mask",
                    text: "WE all know that it is important to wear a facemask",
                  ),
                  PreventCard(
                    image: "assets/images/avatar-3.jpg",
                    title: "Wear face mask",
                    text: "WE all know that it is important to wear a facemask",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String title;
  final String image;
  final String text;

  const PreventCard({
    Key key,
    this.title,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
          height: 156,
          child: Stack(
            children: <Widget>[
              Container(
                height: 136,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: KShadowColor,
                          blurRadius: 24),
                    ]),
              ),
              Image.asset(image),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: KTitleTextStyle.copyWith(fontSize: 14)),
                      Text(
                        text,
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class SymtomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymtomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // final snackBar = SnackBar(content: Text("Tap"));
        // Scaffold.of(context).showSnackBar(snackBar);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FetchScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: KActiveShadowColor)
                : BoxShadow(
                    offset: Offset(0, 3), blurRadius: 5, color: KShadowColor),
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.asset(image, height: 90),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
