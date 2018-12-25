import 'make_it_rain.dart';

import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _edtUser = new TextEditingController();
  final TextEditingController _edtPassword = new TextEditingController();
  String welcomeString = "1";

  void _clear(){
    setState(() {
      _edtPassword.clear();
      _edtUser.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(_edtPassword.text == "admin" && _edtUser.text == "admin"){
        welcomeString = _edtUser.text;
      }
      else{
        welcomeString = "wrong password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor getColorBasedOnMoney(int howMany) {
      if (howMany > 10) {
        return Colors.red;
      }

      return Colors.grey;
    }

    return new Scaffold(
      backgroundColor: Colors.red,
      appBar: new AppBar(
        title: Text("make it rain"),
        backgroundColor: Colors.grey,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            // image profile
            new Image.asset(
              "images/face.png",
              color: Colors.lightGreenAccent,
            ),
            new Container(
              height: 180,
              width: 380,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _edtUser,
                    decoration: new InputDecoration(
                        hintText: " input user", icon: new Icon(Icons.people)),
                  ),
                  new TextField(
                    controller: _edtPassword,
                    decoration: new InputDecoration(
                        hintText: " input user", icon: new Icon(Icons.people)),
                  ),
                  new Padding(padding: EdgeInsets.all(10)),
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin:const EdgeInsets.only(left: 20),
                          child: new RaisedButton(
                        onPressed: _showWelcome,
                        color: Colors.redAccent,
                        child: new Text(
                          "LOGIN",
                          style: new TextStyle(color: Colors.white),
                        ),
                      )),
                      new Container(
                          margin:const EdgeInsets.only(left: 20),

                          child: new RaisedButton(
                        onPressed:  _clear,
                        color: Colors.redAccent,
                        child: new Text(
                          "clear",
                          style: new TextStyle(color: Colors.white),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("welcome, $welcomeString !!", style: new TextStyle(
                  fontSize: 32,
                  color: Colors.white
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
