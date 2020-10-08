import 'package:drawer_bloc/Widgets/Drawer/drawer_widget.dart';
import 'package:drawer_bloc/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text("Page Pertama"),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text("Ini Page Pertama/Home")),
    );
  }
}
