import 'package:flutter/material.dart';

class UiHome extends StatefulWidget {
  UiHome({Key key}) : super(key: key);

  @override
  _UiHomeState createState() => _UiHomeState();
}

class _UiHomeState extends State<UiHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField")
      ),
      body: Column(children: <Widget>[
        
      ],
    ));
  }
}