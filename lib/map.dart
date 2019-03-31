import 'dart:async';
import 'package:detour_project/card_info.dart';
import 'package:detour_project/configuration/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;
  static const LatLng _center = const LatLng(39.461252, -8.473061);
  LatLng _lastMapPosition = _center;

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId(LatLng(39.4801733,-8.5431673).toString()),
      position: LatLng(39.4801733,-8.5431673),
      infoWindow: InfoWindow(
        title: "Castelo de Torres Novas",
        snippet: "Muito conhecido pelas feiras medievais.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(39.4641359,-8.4748187).toString()),
      position: LatLng(39.4641359,-8.4748187),
      infoWindow: InfoWindow(
        title: "Museu Nacional Ferroviário",
        snippet: "Um reviver da história ferroviária portuguesa.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(39.4618274,-8.3867227).toString()),
      position: LatLng(39.4618274,-8.3867227),
      infoWindow: InfoWindow(
        title: "Castelo de Almourol",
        snippet: "Ruínas do castelo medieval da Ordem dos Templários.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(39.4760532,-8.3381877).toString()),
      position: LatLng(39.4760532,-8.3381877),
      infoWindow: InfoWindow(
        title: "Praia de Constância",
        snippet: "Praia Fluvial.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(40.7397157,-8.0924106).toString()),
      position: LatLng(40.7397157,-8.0924106),
      infoWindow: InfoWindow(
        title: "Termas de São Pedro do Sul",
        snippet: "Uma das mais históricas e maiores termas nacionais.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(40.72168, -8.10923).toString()),
      position: LatLng(40.72168, -8.10923),
      infoWindow: InfoWindow(
        title: "Igreja Matriz de Vouzela",
        snippet: "Monumento Nacional, edificado no séc.XII.",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(40.709000, -8.039540).toString()),
      position: LatLng(40.709000, -8.039540),
      infoWindow: InfoWindow(
        title: "Minas da Bejanca",
        snippet: "Antigas minas de volfrâmio",
        onTap: () {}
      )
    ),
    Marker(
      markerId: MarkerId(LatLng(40.6652641,-7.9140329).toString()),
      position: LatLng(40.6652641,-7.9140329),
      infoWindow: InfoWindow(
        title: "Cava de Viriato",
        snippet: "Fortaleza da resistência lusitana aos romanos.",
        onTap: () {}
      )
    ),
  };

  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
     _markers.add(Marker(
       markerId: MarkerId(_lastMapPosition.toString()),
       position: _lastMapPosition,
       infoWindow: InfoWindow(
         title: 'Really cool place',
         snippet: '5 Star Rating'
       ),
       icon: BitmapDescriptor.defaultMarker
     )); 
    });
  }

  void _onCameraMove(CameraPosition pos) {
    _lastMapPosition = pos.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map w/ Points of Interest"),
        backgroundColor: UI_COLOR,
      ),
      body: new Stack(
        children: <Widget>[
          GoogleMap(
            compassEnabled: true,
            markers: _markers,
            mapType: _currentMapType,
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 6.75
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: UI_COLOR,
                    child: Icon(Icons.map, size: 36.0),
                  ),
                  SizedBox(height: 16.0),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: _onAddMarkerButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: UI_COLOR,
                    child: Icon(Icons.add_location, size: 36.0),
                  ),
                ],
              )
            ),
          )
        ],
      )
    );
  }
}