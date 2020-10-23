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
      body: Center(
        child: Text("HOME PAGE"),
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
}
