import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_http_req/Api/apiPost.dart';
import 'package:provider_http_req/Ui/uiProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<PostApi>.value(value: PostApi())],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: UiProvider(),
        ));
  }
}