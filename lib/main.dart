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

  Future gotoNextScreen(BuildContext context) async{
      Map result = await Navigator.of(context)
          .push(MaterialPageRoute(
        builder: (BuildContext context){
          return NextScreen(name: editext.text);
        }
      ));
  }

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
                onPressed:()=> gotoNextScreen(context)),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var backEditext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Second title"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  controller: backEditext,
                ),
              ),
              new FlatButton(onPressed: (){
                Navigator.pop(context,{
                  'info': backEditext.text
                });
              }, child: new Text("${widget.name}"))
            ],
          ),
        ));
  }
}
