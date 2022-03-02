import 'dart:io';
import 'package:coronatracker/data/auth.dart';
import 'package:coronatracker/drawer/navdrawer.dart';
import 'package:coronatracker/screens/home/body_container.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: ColorsValues.whiteColor,
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: ColorsValues.primaryColor,
              ),
              onPressed: () {
                _scaffoldkey.currentState!.openDrawer();
              }),
          title: Text(
            "CoronaTracker",
            style: TextStyle(color: ColorsValues.primaryColor),
          ),
          centerTitle: true,
          backgroundColor: ColorsValues.whiteColor,
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: ColorsValues.primaryColor,
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: ElevatedButton(
                      child: Text("Logout"),
                      onPressed: () async {
                        await auth.logout();
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ElevatedButton(
                      child: Text("Exit"),
                      onPressed: () {
                        exit(0);
                      },
                    ),
                  ),
                ];
              },
            )
          ]),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BodyContainer(),
      ),
      drawer: NavDrawer(),
    );
  }
}
