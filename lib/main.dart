import 'package:detour_project/card_info.dart';
import 'package:detour_project/configuration/persistent.dart';
import 'package:detour_project/configuration/variables.dart';
import 'package:detour_project/home.dart';
import 'package:detour_project/login.dart';
import 'package:detour_project/map.dart';
import 'package:detour_project/profile.dart';
import 'package:detour_project/search.dart';
import 'package:detour_project/splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MaterialApp(
      home: Splash(),
      routes: <String, WidgetBuilder>{
        "/Login": (BuildContext context) => Login(),
        "/MainMenu": (BuildContext context) => MainMenu(),
        "/Search": (BuildContext context) => Search(),
        "/Profile": (BuildContext context) => Profile(),
        "/Home": (BuildContext context) => Home(),
        "/Maps": (BuildContext context) => Maps()
      })
    );
  });
}

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() => new MainMenuState();
}

class MainMenuState extends State<MainMenu> with SingleTickerProviderStateMixin{
  TabController controller;

  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  void exitPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Signing off..."),
          content: new Text("Are you sure you want to exit your account?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                PreferencesHolder().persistLoginStatus(false);
                Navigator.of(context).pushReplacementNamed("/Login");
              },
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: UI_COLOR),
        title: Text("DeTour", style: TextStyle(color: UI_COLOR)),
        backgroundColor: Colors.grey.shade200,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UI_COLOR,
        child: Icon(FontAwesomeIcons.solidCompass),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Maps()))
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: UI_COLOR,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 4.0
          ),
          height: 60.0,
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.home), text: "Home"),
              new Tab(icon: new Icon(Icons.person), text: "Profile")
            ],
          )
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Home(),
          Profile()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: UI_COLOR
              ),
              accountName: Text("Toy Ferrão", style: TextStyle(fontSize: 20.0)),
              accountEmail: Text("toda_a_noite@gmail.com"),
              currentAccountPicture: Hero(
                tag: 'assets/person.jpg',
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(62.5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/person.jpg')
                    )
                  ),
                ),
              )
            ),
            new ListTile(
              trailing: new Icon(Icons.favorite, color: UI_COLOR),
              title: Text("Favourites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: UI_COLOR)),
              onTap: () {},
            ),
            new Divider(
              color: UI_COLOR
            ),
            new ListTile(
              trailing: new Icon(Icons.info, color: UI_COLOR),
              title: Text("About Us", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: UI_COLOR)),
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(builder: (context) => CardInfo())); */
              },
            ),
            new Divider(
              color: UI_COLOR
            ),
            new SizedBox(
              height: 200.0,
            ),
            new Divider(
              color: UI_COLOR
            ),
            new ListTile(
              trailing: new Icon(Icons.exit_to_app, color: UI_COLOR),
              title: Text("Sign Off", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: UI_COLOR)),
              onTap: (){
                exitPopUp();
              },
            ),
            new Divider(
              color: UI_COLOR,
            )
          ],
        ),
      ),
    );
  }
}