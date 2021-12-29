import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_infinite_scroll/core/bindings/app_binding.dart';
import 'package:getx_infinite_scroll/core/config/production.dart';
import 'package:getx_infinite_scroll/core/routes/routes.dart';

void main() {
  Production();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Getx Infinite Scroll',
        initialBinding: AppBinding(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: routes);
  }
}
