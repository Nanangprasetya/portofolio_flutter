import 'package:drawer_simple/Page/city.dart';
import 'package:drawer_simple/Page/country.dart';
import 'package:drawer_simple/Page/home.dart';
import 'package:drawer_simple/Page/not_found.dart';
import 'package:drawer_simple/util/custom_route_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Simple Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return CustomRouteUtil(
              builder: (context) => HomePage(),
            );
          case '/country':
            return CustomRouteUtil(
              builder: (context) => CountryPage(),

            );
          case '/city':
            return CustomRouteUtil(
              builder: (context) => CityPage(),

            );
          default:
            return CustomRouteUtil(
              builder: (context) => NotFound(),

            );
        }
      },
    );
  }
}
