import 'package:drawer_simple/Widget/Drawer_Widget.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  CountryPage({Key key}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(1),
      appBar: AppBar(
        title: Text("Country"),
      ),
      body: Center(
        child: Text("COUNTRY PAGE"),
      ),
    );
  }
}
