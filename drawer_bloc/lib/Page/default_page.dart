import 'package:drawer_bloc/Widget/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class DefaultFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Page Tidak dapat dituju")),
    );
  }
}
