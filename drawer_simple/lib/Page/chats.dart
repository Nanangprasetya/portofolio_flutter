import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  ChatsPage({Key key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Center(
        child: Text("CHATS PAGE"),
      ),
    );
  }
}
