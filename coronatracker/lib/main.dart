import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:coronatracker/data/token_Storage.dart';
import 'package:coronatracker/screens/auth/login_screen.dart';
import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'channel1',
            channelDescription: "This is notification channel",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            importance: NotificationImportance.High,
            enableVibration: true)
      ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: "Corona Tracker",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _token = "";

  checkToken() async {
    String? token = await TokenStorage.readToken("token");
    setState(() {
      _token = token!;
    });
  }

  void initState() {
    checkToken();
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => (_token != '' || _token.isNotEmpty)
                    ? HomePage()
                    : LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: ColorsValues.primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: ColorsValues.primaryColor,
                        child: Image.asset(
                          "assets/icons/viruses.png",
                          color: ColorsValues.whiteColor,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "CoronaTracker",
                        style: TextStyle(
                          color: ColorsValues.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Stay Home, Stay Safe",
                      style: TextStyle(
                        color: ColorsValues.whiteColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
