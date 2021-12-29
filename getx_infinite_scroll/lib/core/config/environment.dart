import 'package:flutter/material.dart';
import 'package:getx_infinite_scroll/main.dart';

abstract class Environment {
  static Environment value;
  String baseApi;
  int delay;
  bool debug;
  bool printResponse;
  String appVersion;

  Environment() {
    value = this;
    runApp(MyApp());
  }

	String get name => runtimeType.toString();

  @override
  String toString() {
		return '$name {appVersion: $appVersion, apiUrl: $baseApi, delay: $delay, debug: $debug}';
  }
}