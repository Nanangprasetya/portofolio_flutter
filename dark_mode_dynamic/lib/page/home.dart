import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dark_mode_dynamic/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _valueMenus = 0;
  double _valueSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(0),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[buildPopupMenuButton(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            buildTextFormField(),
            buildButton(),
            buildRaisedIcon(),
            buildFlatButton(),
            buildMaterialButton(),
            buildOutlineButton(context),
            buildSlider(context),
            Center(child: buildSwitch(context)),
            buildRadioButton(context),
            buildCheckbox(context)
          ],
        ),
      ),
    );
  }

  Checkbox buildCheckbox(BuildContext context) {
    return Checkbox(
        value: !AdaptiveTheme.of(context).isDefault,
        onChanged: (i) {
          AdaptiveTheme.of(context).toggleThemeMode();
        });
  }

  OutlineButton buildOutlineButton(BuildContext context) {
    return OutlineButton(
        child: Text("Outline Button"),
        highlightedBorderColor: Theme.of(context).highlightColor,
        onPressed: () {});
  }

  MaterialButton buildMaterialButton() =>
      MaterialButton(child: Text("Matrial Button"), onPressed: () {});

  FlatButton buildFlatButton() =>
      FlatButton(child: Text("Flat Button"), onPressed: () {});

  RaisedButton buildRaisedIcon() {
    return RaisedButton.icon(
        onPressed: () {}, icon: Icon(Icons.add), label: Text("Hello"));
  }

  ButtonTheme buildButton() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 40,
      child: RaisedButton(
          textColor: Theme.of(context).selectedRowColor,
          child: Text("Button Custom"),
          onPressed: () {}),
    );
  }

  Widget buildRadioButton(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        ListTile(
          leading: Radio(
              value: 0,
              groupValue: _valueMenus,
              onChanged: (i) {
                AdaptiveTheme.of(context).setLight();
                setState(() {
                  _valueMenus = i;
                });
              }),
          title: Text("Light Mode"),
        ),
        ListTile(
          leading: Radio(
              value: 1,
              groupValue: _valueMenus,
              onChanged: (i) {
                AdaptiveTheme.of(context).setDark();
                setState(() {
                  _valueMenus = i;
                });
              }),
          title: Text("Dark Mode"),
        ),
      ],
    );
  }

  PopupMenuButton<int> buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Change Theme',
      initialValue: _valueMenus,
      onSelected: (i) {
        setState(() {
          switch (i) {
            case 0:
              AdaptiveTheme.of(context).setLight();
              break;
            case 1:
              AdaptiveTheme.of(context).setDark();
              break;
          }
          _valueMenus = i;
        });
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(value: 0, child: Text("Light Mode")),
          PopupMenuItem(value: 1, child: Text("Dark Mode")),
        ];
      },
    );
  }

  Slider buildSlider(BuildContext context) {
    return Slider(
      min: 0,
      max: 100,
      value: _valueSlider,
      onChanged: (value) {
        print(value.toString());
        setState(() {
          _valueSlider = value;
        });
        if (value <= 50) {
          AdaptiveTheme.of(context).setLight();
        } else if (value >= 60) {
          AdaptiveTheme.of(context).setDark();
        }
      },
    );
  }

  Switch buildSwitch(BuildContext context) {
    return Switch(
        value: !AdaptiveTheme.of(context).isDefault,
        onChanged: (i) {
          AdaptiveTheme.of(context).toggleThemeMode();
        });
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      autofocus: false,
      autocorrect: false,
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        filled: true,
        labelText: "Text Field",
      ),
    );
  }
}
