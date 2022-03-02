import 'package:coronatracker/screens/home/home.dart';
import 'package:coronatracker/screens/news/news_body.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class NewsSection extends StatefulWidget {
  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsValues.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "News",
          style: TextStyle(
            color: ColorsValues.primaryColor
          ),
        ),
        leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: ColorsValues.primaryColor
        ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        ),
      ),
      body: NewsBodyContainer(),
    );
  }
}