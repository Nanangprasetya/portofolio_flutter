import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final int _selectedIndex;

  DrawerWidget(this._selectedIndex);

  void _onMenuTap(BuildContext context, int index) {
    Navigator.pop(context);
    if (index == _selectedIndex) return;

    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 1) {
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/theme');
      } else {
        Navigator.pushReplacementNamed(context, '/theme');
      }
    } else if (index == 2) {
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/city');
      } else {
        Navigator.pushReplacementNamed(context, '/city');
      }
    } else if (index == 3) {
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/dialog');
      } else {
        Navigator.pushReplacementNamed(context, '/dialog');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildUserAccountsDrawerHeader(context),
          buildListTile(
            context,
            selectedIndex: 0,
            title: "Home",
            lending: Icon(Icons.home),
          ),
          buildListTile(
            context,
            selectedIndex: 1,
            title: "Theme Colors",
            lending: Icon(Icons.business),
          ),
          buildListTile(
            context,
            selectedIndex: 2,
            title: "City",
            lending: Icon(Icons.location_city),
          ),
          buildListTile(
            context,
            selectedIndex: 3,
            title: "Dialog",
            lending: Icon(Icons.school),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
    BuildContext context, {
    @required int selectedIndex,
    @required Widget lending,
    @required String title,
  }) {
    return Container(
      color: _selectedIndex == selectedIndex
          ? Theme.of(context).accentColor.withOpacity(0.15)
          : null,
      child: ListTile(
        selected: _selectedIndex == selectedIndex,
        leading: lending,
        title: Text(title),
        onTap: () => _onMenuTap(context, selectedIndex),
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text("UIUX.Biscuit"),
      accountEmail: Text("biscuit.uiux@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
            ? Theme.of(context).primaryColor
            : Colors.white,
        child: Text("M", style: TextStyle(fontSize: 40.0)),
      ),
    );
  }
}
