import 'package:detour_project/configuration/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<Profile> {
  
  Widget buildImage(String image) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }

  Widget buildInfoDetail(String title, description) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                )
              ),
              SizedBox(height: 7.0),
              Row(
                children: <Widget>[
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.0
                    )
                  ),
                  SizedBox(width: 4.0),
                  Icon(Icons.timer, size: 4.0, color: Colors.black),
                  SizedBox(width: 4.0),
                  Text(
                    '3 videos',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.0
                    )
                  )
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 15.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Icon(FontAwesomeIcons.paperPlane),
                ),
              ),
              SizedBox(width: 15.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Icon(FontAwesomeIcons.comments),
                ),
              ),
              SizedBox(width: 20.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Icon(FontAwesomeIcons.bookmark),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'assets/person.jpg',
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/person.jpg')
                    )
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Text(
                "Toy Ferrão",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 4.0),
              Text(
                "Setúbal, Portugal",
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "420",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "FOLLOWERS",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "31",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "ROUTES",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "78",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "BOOKMARKS",
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(height: 0.0, color: UI_COLOR),
              buildImage('assets/mountains.jpg'),
              buildInfoDetail('Climbing the Mountains!', 'A DeTour to the clouds...'),
              buildImage('assets/desert.jpg'),
              buildInfoDetail('Sand everywhere!', 'A deserty Detour far away...'),
              SizedBox(height: 20.0)
            ],
          )
        ],
      )
    );
  }
}