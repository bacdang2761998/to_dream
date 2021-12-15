import 'package:dream/app_other/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewAccep extends StatelessWidget {
  const WebViewAccep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          AppUrl.UrlAccep,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: WebView(
        initialUrl: AppUrl.UrlAccep,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
