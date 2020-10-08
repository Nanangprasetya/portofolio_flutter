import 'package:drawer_bloc/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Pertama"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Ini Page Pertama/Home")),
    );
  }
}
