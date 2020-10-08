import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drawer_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<Widget> drawerOptions = [];
  int _selectedDrawerIndex = 0;

// Tambahkan List Menu item disini, NavigationEvent untuk mamanggil Si Event
  final drawerItems = [
    DrawerItem("Page 1", Icons.home, NavigationEvent.pageA),
    DrawerItem("Page 2", Icons.person_outline, NavigationEvent.pageB),
    DrawerItem("Page 3", Icons.airline_seat_flat, NavigationEvent.pageC),
  ];

// Tambahkan kondisi Page, fugnsi ini untuk mengubah selected di ListTIle
  _selectiedDrawerIndex(NavigationState state) {
    setState(() {
      if (state is StateA) {
        _selectedDrawerIndex = 0;
      }
      if (state is StateB) {
        _selectedDrawerIndex = 1;
      }
      if (state is StateC) {
        _selectedDrawerIndex = 2;
      }
    });
  }

  _getListItem() {
    return List.generate(
        drawerItems.length,
        (i) => ListTile(
            leading: Icon(drawerItems[i].icon),
            title: Text(drawerItems[i].title),
            selected: i == _selectedDrawerIndex,
            onTap: () {
              Navigator.pop(context);
              context.bloc<NavigationBloc>().add(drawerItems[i].event);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (BuildContext context, NavigationState state) {
        // Hendle error setState()
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _selectiedDrawerIndex(state);
        });
        // Custom UI Drawer Disini gaes
        return Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Michel Clerk"),
                accountEmail: Text("Michel@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              Column(children: _getListItem()),
            ],
          ),
        );
      },
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  NavigationEvent event;
  DrawerItem(this.title, this.icon, this.event);
}
