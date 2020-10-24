import 'package:flutter/material.dart';

class CustomRouteUtil<T> extends MaterialPageRoute<T> {
  CustomRouteUtil({WidgetBuilder builder, RouteSettings settings})
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