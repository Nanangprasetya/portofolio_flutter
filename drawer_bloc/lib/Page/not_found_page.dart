import 'package:drawer_bloc/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

// Handle Error jika page tidak ditemukan 
class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Page Tidak dapat dituju")),
    );
  }
}
