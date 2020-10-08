import 'package:drawer_bloc/Widgets/Drawer/drawer_widget.dart';
import 'package:drawer_bloc/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text("Page ke Dua"),
      ),
      drawer: AppDrawer(),
      body: Center(child: Text("Ini Page ke Dua")),
    );
  }
}
