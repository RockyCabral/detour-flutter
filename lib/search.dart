import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello"),
            Text("This is a test page")
          ],
        ),
      ),
    );
  }
}