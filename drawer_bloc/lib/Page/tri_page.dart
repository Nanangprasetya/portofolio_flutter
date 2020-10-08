import 'package:drawer_bloc/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class TriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Ketiga"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Page 3")),
    );
  }
}
