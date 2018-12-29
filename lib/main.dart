import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {

  List _data = await getJson();
  print(" ${_data[99]['title']} ${_data.length}");
  for(int i =0; i< _data.length; i++){
    print("id: ${_data[i]['id']} \t title: ${_data[i]['title']}");
  }
  runApp(new MaterialApp(
      title: "the APP title",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("hello app"),
        ),
        body: new Center(
            child: new Text("${_data[0]['body']}")
        ),
      )
  ));
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response res = await http.get(apiUrl);
  return json.decode(res.body);
}