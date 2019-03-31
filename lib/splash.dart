import 'package:detour_project/configuration/variables.dart';
import 'package:flutter/material.dart';
import 'package:detour_project/configuration/persistent.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Timer(
        Duration(seconds: 3),
        () async {
          final signedIn = await PreferencesHolder().isSignedIn();
          if(signedIn) {
            Navigator.of(context).pushReplacementNamed("/MainMenu");
          } else {
            Navigator.of(context).pushReplacementNamed("/Login");
          }
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: UI_COLOR),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60.0,
                        child: new Icon(
                          Icons.card_travel,
                          color: UI_COLOR,
                          size: 100.0
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "DeTour",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ],
                  )
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Text("Take a DeTour, enjoy your trips!", style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}