import 'package:drawer_bloc/Widgets/Drawer/drawer_widget.dart';
import 'package:drawer_bloc/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class TriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text("Page Ketiga"),),
      drawer: AppDrawer(),
      body: Center(child: Text("Page 3")),
    );
  }
}
