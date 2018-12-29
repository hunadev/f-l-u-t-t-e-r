import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson();
  for (int i = 0; i < _data.length; i++) {
    print("id: ${_data[i]['address']}");
    print("street: ${_data[i]['address']['street']}");
    print("zipcode: ${_data[i]['address']['zipcode']}");
  }
  runApp(new MaterialApp(
      title: "the APP title",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("hello app"),
        ),
        body: new Center(
            child: Text("HHH")),
      )));
}

Future<List> getJson() async {
  String apiUrl = "http://jsonplaceholder.typicode.com/users/";
  http.Response res = await http.get(apiUrl);
  return json.decode(res.body);
}

void _showOntapMessage(BuildContext context, String msg){
  var alert = new AlertDialog(
    title: Text("MY app"),
    content: Text(msg),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),onPressed: (){
          Navigator.pop(context);
      },
      )
    ],
  );
  showDialog(context: context,builder:(context)=>alert );
}
