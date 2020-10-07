import 'package:drawer_bloc/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dev"),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
