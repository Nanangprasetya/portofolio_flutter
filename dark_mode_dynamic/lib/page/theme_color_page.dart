import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dark_mode_dynamic/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemePage extends StatefulWidget {
  @override
  _ColorThemePageState createState() => _ColorThemePageState();
}

class _ColorThemePageState extends State<ColorThemePage> {
  Future isDarkMode() async {
    SharedPreferences.getInstance()
      ..then((value) => value.remove(AdaptiveTheme.prefKey));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<ColorStyleMatrial> _list = [
      ColorStyleMatrial(color: theme.accentColor, name: "accentColor"),
      ColorStyleMatrial(color: theme.backgroundColor, name: "backgroundColor"),
      ColorStyleMatrial(
          color: theme.bottomAppBarColor, name: "bottomAppBarColor"),
      ColorStyleMatrial(color: theme.buttonColor, name: "buttonColor"),
      ColorStyleMatrial(color: theme.canvasColor, name: "canvasColor"),
      ColorStyleMatrial(color: theme.cardColor, name: "cardColor"),
      ColorStyleMatrial(color: theme.cursorColor, name: "cursorColor"),
      ColorStyleMatrial(color: theme.disabledColor, name: "disabledColor"),
      ColorStyleMatrial(color: theme.dividerColor, name: "dividerColor"),
      ColorStyleMatrial(color: theme.errorColor, name: "errorColor"),
      ColorStyleMatrial(color: theme.focusColor, name: "focusColor"),
      ColorStyleMatrial(color: theme.highlightColor, name: "highlightColor"),
      ColorStyleMatrial(color: theme.hintColor, name: "hintColor"),
      ColorStyleMatrial(color: theme.hoverColor, name: "hoverColor"),
      ColorStyleMatrial(color: theme.indicatorColor, name: "indicatorColor"),
      ColorStyleMatrial(color: theme.primaryColor, name: "primaryColor"),
      ColorStyleMatrial(
          color: theme.primaryColorDark, name: "primaryColorDark"),
      ColorStyleMatrial(
          color: theme.primaryColorLight, name: "primaryColorLight"),
      ColorStyleMatrial(
          color: theme.scaffoldBackgroundColor,
          name: "scaffoldBackgroundColor"),
      ColorStyleMatrial(
          color: theme.secondaryHeaderColor, name: "secondaryHeaderColor"),
      ColorStyleMatrial(
          color: theme.selectedRowColor, name: "selectedRowColor"),
      ColorStyleMatrial(color: theme.splashColor, name: "splashColor"),
      ColorStyleMatrial(
          color: theme.textSelectionColor, name: "textSelectionColor"),
      ColorStyleMatrial(
          color: theme.textSelectionHandleColor,
          name: "textSelectionHandleColor"),
      ColorStyleMatrial(
          color: theme.unselectedWidgetColor, name: "unselectedWidgetColor"),
    ];
    return Scaffold(
      drawer: DrawerWidget(1),
      appBar: AppBar(
        title: Text("Theme Colors"),
        actions: <Widget>[
          Switch(
              value: !AdaptiveTheme.of(context).isDefault,
              onChanged: (i) {
                AdaptiveTheme.of(context).toggleThemeMode();
              }),
          IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () async {
                isDarkMode();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: _list.length,
          itemBuilder: (context, int index) => Container(
            height: 100,
            width: double.infinity,
            color: _list[index].color,
            child: Center(
                child: Text(
              _list[index].name,
              style: TextStyle(fontSize: 20.0),
            )),
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10.0,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AdaptiveTheme.of(context).toggleThemeMode();
        },
        tooltip: 'Increment',
        child: Icon(Icons.cached),
      ),
    );
  }
}

class ColorStyleMatrial {
  final Color color;
  final String name;

  ColorStyleMatrial({this.color, this.name});
}
