import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffC6FFDD),
                Color(0xffFBD786),
                Color(0xfff7797d),
              ])
            ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
        child: Column(
          children: <Widget>[
            Row(
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
              
            ),
            SizedBox(
                height: 40.0,
            ),
            Text('What will you cook today?', style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600
                )),
                SizedBox(
                height: 8.0,
            ),
            Text('Enter the recipe you want to know about', style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                )),
        ],
       )
      ),
      ]
    )
    );
  }
}