import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../home/home.dart';

class Prevention extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Prevention> {
  final String url = "https://www.who.int/health-topics/coronavirus#tab=tab_2";
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Prevention",
          style: TextStyle(color: ColorsValues.primaryColor),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsValues.primaryColor),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      body: WebView(
        initialUrl: url,
        key: _key,
      ),
    );
  }
}
