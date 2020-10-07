import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 8.0),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.group),
                  title: Text("Page 1"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/page1');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.group),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.blue),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "Navigation Drawer",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
