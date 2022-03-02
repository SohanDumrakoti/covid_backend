import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final url;
  WebViewPage(this.url);

  @override
  _WebViewPageState createState() => _WebViewPageState(this.url);
}

class _WebViewPageState extends State<WebViewPage> {
  _WebViewPageState(this._url);
  var _url;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebView(
        key: _key,
        initialUrl: _url,
      ),
    ));
  }
}
