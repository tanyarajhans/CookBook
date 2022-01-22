import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

import '../models/recipe_model.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<RecipeModel> recipes = [];

  TextEditingController textEditingController = TextEditingController();

  String applicationId = "ae8c805f";
  String apiKey ="f5efd0dd45f47e77bd4d8a5d74191db3";

  getRecipes(String food) async {
    String url = "https://api.edamam.com/search?q=$food&app_id=$applicationId&app_key=$apiKey";

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData['hits'].forEach((element){
      if(element['recipe']!=null){
        RecipeModel recipeModel = RecipeModel.fromMap(element['recipe']);
        recipes.add(recipeModel);
      }
    });

    print(recipes.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                )
              ),
              SizedBox(
                height: 30.0,
            ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                children: [
                  Expanded(
                    child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter ingredients',
                      hintStyle: TextStyle(
                        fontSize: 18.0
                      ) 
                    ),
                    controller: textEditingController,
                  )
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  InkWell(
                    onTap: (){
                      if(textEditingController.text.isNotEmpty){
                        getRecipes(textEditingController.text);
                        print('do it');
                      }
                      else
                      print('not do it');
                    },
                    child: Container(
                      child: Icon(Icons.search,
                      size: 33.0,
                      color: Colors.white),
                  )
                )
                  ],
                )
              )
        ],
       )
      ),
      ]
    )
      )
    );
  }
}

class RecipeTile extends StatelessWidget {
  String url;
  String source;
  String title;
  String postUrl;

  RecipeTile(this.url, this.source, this.title, this.postUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
          Image.network(url),
          Container(
            child: 
          ),
        ]
      ,)
    );
  }
}