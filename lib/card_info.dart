import 'package:detour_project/configuration/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInfo extends StatefulWidget {
  @override
  CardInfoState createState() => new CardInfoState();
}

class CardInfoState extends State<CardInfo> {
  double rating = 4.5;
  int startCount = 5;

  Widget buildCard(String image) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            fit: BoxFit.fill,
            height: 100.0,
            width: 160.0,
            image: AssetImage(image),
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Image(
                      image: AssetImage('assets/casteloTN.jpg'),
                      fit: BoxFit.fill,
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Castelo de Torres Novas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              height: 140.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  buildCard('assets/casteloTN1.jpg'),
                  buildCard('assets/casteloTN2.jpg'),
                  buildCard('assets/casteloTN3.jpg'),
                  buildCard('assets/casteloTN4.jpg')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Rating: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                StarRating(
                  size: 22.5,
                  rating: rating,
                  color: UI_COLOR,
                )
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Descrição:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                    SizedBox(height: 10.0),
                    Text("You don't have to be crazy to do this but it does help. Painting should do one thing. It should put happiness in your heart. Sometimes you learn more from your mistakes than you do from your masterpieces. Be so very light. Be a gentle whisper. Isn't that fantastic? How do you make a round circle with a square knife? That's your challenge for the day.", style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 20.0),
                    Text("Serviços:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(FontAwesomeIcons.toilet),
                        SizedBox(width: 10.0),
                        Text("Toilets", style: TextStyle(fontSize: 16.0)),
                        SizedBox(width: 70.0),
                        Icon(FontAwesomeIcons.glassMartini),
                        SizedBox(width: 10.0),
                        Text("Bares", style: TextStyle(fontSize: 16.0))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Icon(FontAwesomeIcons.utensils),
                        SizedBox(width: 10.0),
                        Text("Restaurantes", style: TextStyle(fontSize: 16.0)),
                        SizedBox(width: 30.0),
                        Icon(FontAwesomeIcons.music),
                        SizedBox(width: 10.0),
                        Text("Música", style: TextStyle(fontSize: 16.0))
                      ],
                    ),
                    SizedBox(height: 20.0)
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text("Comentários:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Divider(height: 5.0, color: UI_COLOR),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),
                    Row(
                      children: <Widget>[
                        Hero(
                          tag: 'assets/person.jpg',
                          child: Container(
                            height: 75.0,
                            width: 75.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(62.5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/person.jpg')
                              )
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Toy Ferrão", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10.0),
                              Text("Absolutly amazing! Toda a noite!")
                            ],
                          )
                        )
                      ],
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}