import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:drawer_simple/Page/chats.dart';
import 'package:drawer_simple/Widget/AppDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(0),
      appBar: AppBar(
        title: Text("Home"),
      ),
      // Handle back 2x click for back app or close app
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text("Tap back again to leave"),
        ),
        child: buildCountent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatsPage()));
        },
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget buildCountent() {
    return Center(
      child: Text("HOME PAGE"),
    );
  }
}
