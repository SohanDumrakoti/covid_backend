import 'dart:convert';
import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final String url = "https://nepalcorona.info/api/v1/faqs";
  List faqData = [];
  Map data = {};

  void initState() {
    super.initState();
    fetchQNA();
  }

  Future fetchQNA() async {
    var response = await http.get(Uri.parse(url));
    data = json.decode(response.body);
    setState(() {
      faqData = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "FAQ's",
          style: TextStyle(color: ColorsValues.primaryColor),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorsValues.primaryColor),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
      ),
      backgroundColor: ColorsValues.whiteColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: faqData == null ? 0 : faqData.length,
          itemBuilder: (context, index) {
            return Card(
              color: ColorsValues.defaultColor,
              elevation: 1,
              child: ListTile(
                title: Text(faqData[index]['question']),
                subtitle: Text("Answer : ${faqData[index]['answer']}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
