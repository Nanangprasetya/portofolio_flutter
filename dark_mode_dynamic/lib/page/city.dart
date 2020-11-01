import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dark_mode_dynamic/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  CityPage({Key key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<int> _selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(2),
        appBar: AppBar(
          title: Text("City"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.colorize),
                onPressed: () async {
                  AdaptiveTheme.of(context).toggleThemeMode();
                })
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListData(context),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
        floatingActionButton: buildFloatingActionButton(),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text("FAB 1"),
      icon: Icon(Icons.add),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text("City"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text("School"),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (i) {
        setState(() {
          _selectedIndex = i;
        });
      },
    );
  }

  Widget buildListData(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          color: _themeColor(_selectedItems.contains(index)),
          child: ListTile(
            leading: CircleAvatar(child: Text(index.toString())),
            title: Text(
              "Hello ${index.toString()}",
            ),
            subtitle: Text("Subtitle ${(index % 2).toString()}"),
            onTap: () {
              if (_selectedItems.contains(index)) {
                setState(() {
                  _selectedItems.removeWhere((val) => val == index);
                });
              }
            },
            onLongPress: () {
              if (!_selectedItems.contains(index)) {
                setState(() {
                  _selectedItems.add(index);
                });
              }
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Color _themeColor(bool contains) {
    if (contains) {
      if (Theme.of(context).brightness == Brightness.light) {
        return Theme.of(context).primaryColor.withOpacity(0.15);
      } else {
        return Theme.of(context).accentColor.withOpacity(0.15);
      }
    } else {
      return null;
    }
  }
}
