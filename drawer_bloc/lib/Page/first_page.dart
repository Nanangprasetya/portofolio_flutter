import 'package:drawer_bloc/Widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class AboutusFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Ini About Us")),
    );
  }
}
