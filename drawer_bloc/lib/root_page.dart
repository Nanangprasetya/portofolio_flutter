import 'package:drawer_bloc/Page/not_found_page.dart';
import 'package:drawer_bloc/Page/tri_page.dart';
import 'package:drawer_bloc/drawer/bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Page/first_page.dart';
import 'Page/second_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);

// Tambahkan Kondisi Page baru anda disini, Juga Page baru yang dituju
  _getDrawerItemWidget(NavigationState state) {
    if (state is StateA) {
      return FirstPage();
    }
    if (state is StateB) {
      return SecondPage();
    }
    if (state is StateC) {
      return TriPage();
    } else {
      return PageNotFound();
    }
  }

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
