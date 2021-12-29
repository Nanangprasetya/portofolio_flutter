import 'package:getx_infinite_scroll/core/config/environment.dart';

void main() => Production();

class Production extends Environment {
  final String appVersion = '0.0.1';
  final String baseApi = 'https://6186ca2fcd8530001765abb8.mockapi.io/api2/';
  final bool debug = true;
  final int delay = 0;
  final bool printResponse = false;
}
