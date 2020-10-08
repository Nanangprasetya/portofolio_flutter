import 'package:drawer_bloc/Page/root_page.dart';
import 'package:drawer_bloc/Widget/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<NavigationBloc>(
      create: (BuildContext context) => NavigationBloc(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer with Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
