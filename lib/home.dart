import 'package:detour_project/card_info.dart';
import 'package:detour_project/configuration/variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  Widget buildCard(String image, info) {
    return InkWell(
      splashColor: UI_COLOR,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CardInfo()));
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              fit: BoxFit.fill,
              height: 100.0,
              width: 200.0,
              image: AssetImage(image),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(info, style: TextStyle(fontWeight: FontWeight.bold))
            )
          ]
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: new ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.chevronRight, color: UI_COLOR, size: 18.0),
                Text(
                  "Suggested Routes:",
                  style: TextStyle(
                    color: UI_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  )
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('assets/casteloTN.jpg', 'Castelo de Torres Novas'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/museuFerrov.jpg', 'Museu Ferroviário'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/casteloAlmourol.jpg', 'Castelo de Almoroul'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/praiaConst.jpg', 'Praia de Constância')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('assets/termasSPS.jpg', 'Termas de São Pedro do Sul'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/igrejaVouz.jpg', 'Igreja de Vouzela'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/minasBejanca.jpg', 'Minas da Bejanca'),
                Container(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                buildCard('assets/cavaViriato.jpg', 'Cava de Viriato')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.chevronRight, color: UI_COLOR, size: 18.0),
                Text(
                  "Museums:",
                  style: TextStyle(
                    color: UI_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  )
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('assets/museuArte.jpg', 'Museu da Arte Antiga'),
                buildCard('assets/museuTraje.jpg', 'Museu do Traje'),
                buildCard('assets/museuTeatro.jpg', 'Museu do Teatro'),
                buildCard('assets/museuMus.jpg', 'Museu da Música')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.chevronRight, color: UI_COLOR, size: 18.0),
                Text(
                  "Hidden Spots:",
                  style: TextStyle(
                    color: UI_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  )
                )
              ]
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildCard('assets/tervim.jpg', 'Baloiço Tervim'),
                buildCard('assets/praiaCarvoeiro.jpg', 'Praia de Carvoeiro'),
                buildCard('assets/miradouroVarandas.jpg', 'Miradouro - Varandas de Avô'),
                buildCard('assets/alqueva.jpg', 'Miradouro do Alqueva')
              ],
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ) 
    );
  }
}