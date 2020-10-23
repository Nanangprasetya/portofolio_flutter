import 'package:button_tamplate/Widget/button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Tamplate"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              buildRaisedButton(),
              buildOutlineButton(),
              buildFlatButton(),
              buildLoadingButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildRowButton(TypeButton.outline, null),
                  buildRowButton(TypeButton.raised, Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonWidget buildRaisedButton() {
    return ButtonWidget(
        type: TypeButton.raised, text: "Raised Button", onTab: () {});
  }

  ButtonWidget buildOutlineButton() {
    return ButtonWidget(
        type: TypeButton.outline, text: "Outline Button", onTab: () {});
  }

  ButtonWidget buildFlatButton() {
    return ButtonWidget(
        type: TypeButton.flat, text: "Flat Button", onTab: () {});
  }

  ButtonWidget buildLoadingButton() {
    return ButtonWidget(loading: true, text: "Loading Button", onTab: () {});
  }

  ButtonWidget buildRowButton(TypeButton typeButton, Icon icon) {
    return ButtonWidget(
        expanded: false,
        icon: icon,
        type: typeButton,
        text: "Row Button",
        onTab: () {});
  }
}
