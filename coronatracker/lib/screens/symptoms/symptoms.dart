import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  final String url = "https://www.who.int/health-topics/coronavirus#tab=tab_3";
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsValues.primaryColor),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
        title: Text(
          "Symptoms",
          style: TextStyle(color: ColorsValues.primaryColor),
        ),
      ),
      body: WebView(
        initialUrl: url,
        key: _key,
      ),
    );
  }
}
