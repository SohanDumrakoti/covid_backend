import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/screens/news/news.dart';
import 'package:coronatracker/screens/prevention/prevention.dart';
import 'package:coronatracker/screens/symptoms/symptoms.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 20.0),
        children: <Widget>[
          DrawerHeader(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: ColorsValues.primaryColor,
                      child: Image.asset(
                        "assets/icons/viruses.png",
                        color: ColorsValues.whiteColor,
                      ),
                    ),
                    Text(
                      "Corona Virus",
                      style: TextStyle(
                        color: ColorsValues.whiteColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Stay Home, Stay Safe",
                      style: TextStyle(
                        color: ColorsValues.whiteColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
            decoration: BoxDecoration(color: ColorsValues.primaryColor),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text("News"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsSection()));
            },
          ),
          ListTile(
            leading: Icon(Icons.mood_bad),
            title: Text("Symptoms"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Symptoms()));
            },
          ),
          ListTile(
            leading: Icon(Icons.healing),
            title: Text("Prevention"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Prevention()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.question_answer),
          //   title: Text("FAQ's"),
          //   onTap: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()));
          //   },
          // ),
        ],
      ),
    );
  }
}
