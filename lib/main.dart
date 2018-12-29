import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson();
  print(" ${_data[99]['title']} ${_data.length}");
  for (int i = 0; i < _data.length; i++) {
    print("id: ${_data[i]['id']} \t title: ${_data[i]['title']}");
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
                    "${_data[position]['title']}",
                    style:
                        new TextStyle(fontSize: 22.00, color: Colors.redAccent),
                  ),
                  subtitle: new Text(
                    "${_data[position]['body']}",
                    style: new TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  trailing: new CircleAvatar(
                    child: Text("${_data[position]['body'][0]}"),
                  ),
                  onTap:()=>_showOntapMessage(context,_data[position]['title']),
                )
              ],
            );
          },
        )),
      )));
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
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
