import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  Map _data = await getJson();

  List properties = _data['features'];
  for (int i = 0; i < properties.length; i++) {
    print(properties[i]['properties']['mag']);
  }
  runApp(new MaterialApp(
      title: "the APP title",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("hello app"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.menu  ), onPressed:  _handleOnMenuCLicked)
          ],
        ),
        body:new Stack( // stack like Relative layout hen
          children: <Widget>[
            Center(
              child: Image.asset("images/bg.jpeg",fit: BoxFit.fill,height: 1800,),
            ),
            new Container(
            alignment: Alignment.topRight, // MAKE ICON CENTER 
              margin: const EdgeInsets.fromLTRB(0, 10, 20, 00), // CAI NAY CANH TOA DO CUA CAI TEXT
              child: new Text("add text to app", style: cityStyle()),
            ),

            new Container(
              alignment: Alignment.center,
              child: new Image.asset("images/light_rain.png"),
            ),
            
            new Container(
              margin: const EdgeInsets.fromLTRB(0.0, 290.0, 50.0, 0.0), // CAI NAY CANH TOA DO CUA CAI TEXT
              alignment: Alignment.center,
              child: new Text("22.12", style: weatherTextStyle(),),
            ),
          ],
        ),
      )));
}

Future<Map> getJson() async {
  String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response res = await http.get(apiUrl);
  return json.decode(res.body);
}

void _handleOnMenuCLicked(){
  print("clicked hen");
}

void _showOntapMessage(BuildContext context, String msg) {
  var alert = new AlertDialog(
    title: Text("MY app"),
    content: Text(msg),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

TextStyle cityStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 23,
    fontStyle: FontStyle.italic
  );
}

TextStyle weatherTextStyle(){
  return new TextStyle(
      color: Colors.white,
      fontSize: 63,
      fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w900
  );
}
