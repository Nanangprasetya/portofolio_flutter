import 'package:drawer_simple/Page/city.dart';
import 'package:drawer_simple/Page/country.dart';
import 'package:drawer_simple/Page/home.dart';
import 'package:drawer_simple/Page/not_found.dart';
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
            return _MyCustomRoute(
              builder: (context) => HomePage(),
            );
          case '/country':
            return _MyCustomRoute(
              builder: (context) => CountryPage(),

            );
          case '/city':
            return _MyCustomRoute(
              builder: (context) => CityPage(),

            );
          default:
            return _MyCustomRoute(
              builder: (context) => NotFound(),

            );
        }
      },
    );
  }
}

class _MyCustomRoute<T> extends MaterialPageRoute<T> {
  _MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {

    // Settings.name digunakan jika tidak menginginkan Transition
    if (settings.name != null)
    return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
