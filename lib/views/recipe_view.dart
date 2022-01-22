import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {

  final String postUrl;
  

  RecipeView(this.postUrl);
  @override
  _State createState() => _State();
}

class _State extends State<RecipeView> {
  late String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState(){
    if(widget.postUrl.contains("http://")){
      finalUrl=widget.postUrl.replaceAll("http://", "https://");
    }else{
      finalUrl=widget.postUrl;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: Column(
        children: <Widget>[
        Column(
        children: [
        Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 60.0, right: 20.0, left: 20.0, bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Text('Cook', style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500
                )
                ),
                Text('Book', style: TextStyle(
                  color: Colors.amber[900],
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500
                )
                )
              ],
             )
            ),

      ],),
      Container(
        height: MediaQuery.of(context).size.height-110,
        width: MediaQuery.of(context).size.width,
        child:
      WebView(
        initialUrl: finalUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          setState(() {
            _controller.complete(webViewController);
          });
        }
      ))
      ]
    ))
      
    );
  }
}