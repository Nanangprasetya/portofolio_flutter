import 'package:drawer_bloc/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(title: Text("Page ke Dua"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Ini Page ke Dua")),
    );
  }

}