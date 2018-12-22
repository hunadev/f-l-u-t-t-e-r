import 'package:flutter/material.dart';

class MakeitRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeitRain> {
  int _money = 0;

  void _rainMoney() {
    setState(() {
      debugPrint("clicked $_money");
      _money += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor getColorBasedOnMoney(int howMany) {
      if(howMany > 10){
        return Colors.red;
      }
      
      return Colors.grey;
      
    }

    return new Scaffold(
        appBar: new AppBar(
          title: Text("make it rain"),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              new Center(
                  child: new Text(
                "GET RICH",
                style: new TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 56.9),
              )),
              new Expanded(
                  child: new Center(
                      child: new Text(
                _money.toString(),
                style: new TextStyle(
//                    color: getColorBasedOnMoney(_money),
                    color: _money >10 ? Colors.grey : Colors.lightGreenAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 50),
              ))),
              new Expanded(
                  child: new Center(
                      child: new FlatButton(
                onPressed: _rainMoney,
                child: new Text(
                  "button click",
                  style: new TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ))),
            ],
          ),
        ));
  }
}
