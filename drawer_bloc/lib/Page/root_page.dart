import 'package:drawer_bloc/Page/default_page.dart';
import 'package:drawer_bloc/Widget/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'first_page.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

_getDrawerItemWidget(NavigationState state) {
  if (state is StateA) {
    return HomeFragment();
  }
  if (state is StateB) {
    return AboutusFragment();
  } else {
    return DefaultFragment();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (BuildContext context, NavigationState state) {
        return Scaffold(
          body: _getDrawerItemWidget(state),
        );
      },
    );
  }
}
