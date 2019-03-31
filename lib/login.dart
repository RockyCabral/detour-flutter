import 'package:detour_project/configuration/persistent.dart';
import 'package:detour_project/configuration/variables.dart';
import 'package:detour_project/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email, password;

  Future<void> signIn() async {
    final formState = formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await auth.signInWithEmailAndPassword(email: email, password: password);
        if(user != null) {
          PreferencesHolder().persistLoginStatus(true);
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Splash()));
      } catch(error) {
        print(error);
      }
    }
  }

    Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    try{
      final FirebaseUser user = await auth.signInWithCredential(credential);
      if(user != null){
        PreferencesHolder().persistLoginStatus(true);
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Splash()));
    } catch(err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    final w = size.width;

    final logoComponent = new Column(
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
          padding: EdgeInsets.only(bottom: 10.0),
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
    );

    final emailComponent = new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: new TextFormField(
        validator: (input) {
          if(input.isEmpty){
            return "Please, input a valid email!";
          }
        },
        onSaved: (input) => email = input,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: new Icon(Icons.mail, color: UI_COLOR, size: 18.0),
          labelText: "Email",
          labelStyle: new TextStyle(color: UI_COLOR)
        ),
      ),
    );

    final passwordComponent =  new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: new TextFormField(
        validator: (input) {
          if(input.length < 6) {
            return "Invalid password!";
          }
        },
        onSaved: (input) => password = input,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: new Icon(Icons.vpn_key, color: UI_COLOR, size: 18.0),
          labelText: "Password",
          labelStyle: new TextStyle(color: UI_COLOR)
        ),
        obscureText: true,
      ),
    );

    final signInButton = Container(
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: UI_COLOR,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: signIn,
          child: Text("Sign in", style: TextStyle(color: UI_COLOR, fontSize: 16.0),),
        ),
      ),
    );

    final googleSignInButton = Container(
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.green.shade50,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: signInWithGoogle,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Icon(FontAwesomeIcons.google, color: Colors.red),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              Text("Sign in with Google", style: TextStyle(color: UI_COLOR, fontSize: 16.0)),
            ] 
          ),
        ),
      )
    );

    final alternative = new Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: w * 0.30,
              height: 1.0,
              color: Colors.white,
            ),
            Text("  OR  ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Container(
              width: w * 0.30,
              height: 1.0,
              color: Colors.white,
            ),
          ],
        )
      )
    );

    return Scaffold(
      backgroundColor: UI_COLOR,
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              logoComponent,
              SizedBox(height: 30.0),
              emailComponent,
              SizedBox(height: 10.0),
              passwordComponent,
              SizedBox(height: 15.0),
              signInButton,
              alternative,
              googleSignInButton
            ],
          ),
        ),
      )
    );
  }
}