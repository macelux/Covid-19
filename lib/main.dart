import 'package:flutter/material.dart';
import './widgets/counter.dart';
import './widgets/MyHeaeder.dart';
import './constants.dart';
import './info_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: KBackgorundColor,
          textTheme: TextTheme(body1: TextStyle(color: KBodyTextColor))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          MyHeader(
            image: "assets/images/avatar-3.jpg",
            textTop: "All you need",
            textBottom: "To stay safe",
          ), 
          SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: DropDown() 
                  )
                ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Case Updated\n",
                            style: KTitleTextStyle,
                          ),
                          TextSpan(
                            text: "Newest Update August 4",
                            style: TextStyle(
                              color: KTextLightColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: KPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: KShadowColor,
                          offset: Offset(0, 4),
                          blurRadius: 30)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                          color: KInfectedColor,
                          number: 1089,
                          title: "Infected"),
                      Counter(color: KDeathColor, number: 89, title: "Deaths"),
                      Counter(
                          color: KRecoverColor, number: 45, title: "Recoverd")
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Spread of Virus", style: KTitleTextStyle),
                    Text(
                      "See details",
                      style: TextStyle(
                          color: KPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: KShadowColor,
                        offset: Offset(0, 10),
                        blurRadius: 30,
                      )
                    ],
                  ),
                  child: Image.asset('assets/images/avatar-3.jpg',
                      fit: BoxFit.contain),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



// dropdown widget
class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
          value: _value,
          isExpanded: true,
          underline: SizedBox(),
          items: [
            DropdownMenuItem(
              child: Text("First Item"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Second Item"),
              value: 2,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }
}
 