import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {

  String _data = await getJson();
  print("HUUHOANG: "+_data);
  runApp(new MaterialApp(
      title: "the APP title",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("hello app"),
        ),
        body: new Center(
            child: new Text(_data)
        ),
      )
  ));
}

Future<String> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts/1";
  http.Response res = await http.get(apiUrl);
  return json.decode(res.body).toString();
}