import 'dart:convert';
import 'package:coronatracker/constant.dart';
import 'package:coronatracker/data/news.dart';
import 'package:coronatracker/models/news_model.dart';
import 'package:coronatracker/screens/webview.dart';
import 'package:coronatracker/values/colors_values.dart';
import 'package:flutter/material.dart';

class NewsBodyContainer extends StatefulWidget {
  @override
  _NewsBodyContainerState createState() => _NewsBodyContainerState();
}

class _NewsBodyContainerState extends State<NewsBodyContainer> {
  Map data = {};
  List newsData = [];
  Future<News>? _future;

  NewsResponse response = NewsResponse();

  Future fetchNews() async {
    List data = await response.fetchNews();
    setState(() {
      newsData = data;
    });
  }

  void initState() {
    fetchNews();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
        future: _future,
        builder: (context, AsyncSnapshot<News> sanpshot) {
          if (sanpshot.hasData) {
            return ListView.builder(
              itemCount: newsData.length.bitLength,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Image.network(
                          newsData[index]["image_url"],
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "${newsData[index]['title']}",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${newsData[index]['summary']}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          "Source : ${newsData[index]['source']}",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: ColorsValues.deathColor,
                              fontStyle: FontStyle.italic),
                        ),
                        FlatButton(
                          child: Text("See more"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WebViewPage(newsData[index]["url"])));
                          },
                        ),
                      ],
                    )),
                  ),
                );
              },
            );
          } else if (sanpshot.hasData) {
            return Center(
              child: Text(sanpshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
