import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dark_mode_dynamic/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(3),
      appBar: AppBar(
        title: Text("Dialog"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.colorize),
              onPressed: () async {
                AdaptiveTheme.of(context).toggleThemeMode();
              })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              buildRaisedButton(
                  context,
                  "Show Dialog",
                  () => buildShowDialog(
                      context,
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."))),
              buildRaisedButton(
                  context,
                  "Show Snackbar",
                  () =>
                      _scaffoldKey.currentState.showSnackBar(buildSnackBar())),
              buildRaisedButton(
                context,
                "Show Date Picker",
                () => selectDate(context),
              ),
              buildRaisedButton(
                context,
                "Show Modal Bottom",
                () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return buildModalBottomSheet();
                    },
                  );
                },
              ),
              buildRaisedButton(
                context,
                "Show Progress Indicator",
                () => buildShowDialog(
                    context,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        LinearProgressIndicator()
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildModalBottomSheet() {
    return Container(
        height: 240,
        child: Column(
          children: List.generate(
              4,
              (i) => ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text("List Tile ${(i + 1).toString()}"),
                  )),
        ));
  }

  SnackBar buildSnackBar() {
    return SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
  }

  RaisedButton buildRaisedButton(
      BuildContext context, String text, Function onPress) {
    return RaisedButton(child: Text(text), onPressed: onPress);
  }

  Future buildShowDialog(BuildContext context, Widget content) {
    return showDialog(
      context: context,
      child: AlertDialog(
        content: content,
        actions: <Widget>[
          FlatButton(
            textColor: Theme.of(context).disabledColor,
              child: Text("CANCEL"), onPressed: () => Navigator.pop(context)),
          FlatButton(
              child: Text("OK"),
              textColor: Theme.of(context).errorColor,
              onPressed: () => Navigator.pop(context))
        ],
      ),
    );
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
