import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecipeView extends StatefulWidget {

  final String postUrl;

  RecipeView(this.postUrl);
  @override
  _State createState() => _State();
}

class _State extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
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
            
      ],)
    );
  }
}