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
        ),
        body: new Center(
            child: new ListView.builder(
          padding: const EdgeInsets.all(14.5),
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return new Column(
              children: <Widget>[
                new Divider(
                  height: 5.5,
                ),
                new ListTile(
                  title: new Text(
                    "${properties[position]['properties']['place']}",
                    style:
                        new TextStyle(fontSize: 22.00, color: Colors.redAccent),
                  ),
                  subtitle: new Text(
                    "${properties[position]['properties']['title']}",
                    style: new TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  leading: new CircleAvatar(
                    child: Text("${properties[position]['properties']['title'][0]}"),
                  ),
                  onTap: () =>
                      _showOntapMessage(context, properties[position]['properties']['title']),
                )
              ],
            );
          },
        )),
      )));
}

Future<Map> getJson() async {
  String apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response res = await http.get(apiUrl);
  return json.decode(res.body);
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
