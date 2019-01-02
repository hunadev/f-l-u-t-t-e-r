import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "APP",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var editext = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("First my screen"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: editext,
              decoration: new InputDecoration(labelText: " ENTER NAME HINT"),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
                child: Text("Send to next screen"),
                onPressed: () {

                  var router =  MaterialPageRoute(builder: (context) => NextScreen());
                  Navigator.push(context, router);
                }),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Second title"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      )
    );
  }
}
