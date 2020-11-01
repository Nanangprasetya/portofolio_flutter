import 'package:drawer_simple/Widget/Drawer_Widget.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  CityPage({Key key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(2),
      appBar: AppBar(
        title: Text("City"),
      ),
      body: Center(
        child: Text("CITY PAGE"),
      ),
    );
  }
}
