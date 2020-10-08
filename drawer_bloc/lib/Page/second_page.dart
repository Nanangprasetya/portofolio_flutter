import 'package:drawer_bloc/Widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(title: Text("Home Page"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Home Page")),
    );
  }

}