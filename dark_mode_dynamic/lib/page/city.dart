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
              Tab(icon: Icon(Icons.format_list_numbered)),
              Tab(icon: Icon(Icons.text_format)),
              Tab(icon: Icon(Icons.not_interested)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListTile(context),
            buildListTypo(context),
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

  Widget buildListTile(BuildContext context) {
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
        return Divider(height: 0.0);
      },
    );
  }

  Color _themeColor(bool contains) {
    if (contains) {
      if (Theme.of(context).brightness == Brightness.light) {
        return Theme.of(context).primaryColor.withOpacity(0.15);
      } else {
        return Theme.of(context).splashColor;
      }
    } else {
      return null;
    }
  }

  Widget buildListTypo(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<ThemeMatrial> listTextStyle = <ThemeMatrial>[
      ThemeMatrial(
        "bodyText1",
        textTheme.bodyText1,
      ),
      ThemeMatrial(
        "bodyText2",
        textTheme.bodyText2,
      ),
      ThemeMatrial(
        "button",
        textTheme.button,
      ),
      ThemeMatrial(
        "caption",
        textTheme.caption,
      ),
      ThemeMatrial(
        "overline",
        textTheme.overline,
      ),
      ThemeMatrial(
        "subtitle1",
        textTheme.subtitle1,
      ),
      ThemeMatrial(
        "subtitle2",
        textTheme.subtitle2,
      ),
      ThemeMatrial(
        "headline6",
        textTheme.headline6,
      ),
      ThemeMatrial(
        "headline5",
        textTheme.headline5,
      ),
      ThemeMatrial(
        "headline4",
        textTheme.headline4,
      ),
      ThemeMatrial(
        "headline3",
        textTheme.headline3,
      ),
      ThemeMatrial(
        "headline2",
        textTheme.headline2,
      ),
      ThemeMatrial(
        "headline1",
        textTheme.headline1,
      ),
    ];

    return ListView.builder(
      itemCount: listTextStyle.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            child: Text(
                listTextStyle[index].name +
                    " (" +
                    listTextStyle[index].style.fontSize.toString() +
                    ", " +
                    listTextStyle[index].style.fontWeight.toString() +
                    ")",
                style: listTextStyle[index].style),
          ),
        );
      },
    );
  }
}

class ThemeMatrial {
  final String name;
  final TextStyle style;

  ThemeMatrial(this.name, this.style);
}
