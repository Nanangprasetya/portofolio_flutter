import 'package:flutter/material.dart';
import 'package:provider_http_req/Model/errorData.dart';

class DialogUtil {
  DialogUtil._();

  static void showErrorDialog(BuildContext context, ErrorData e) async {
    showDialog<void>(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Error"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(e.error.toString())],
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
