import 'package:getx_infinite_scroll/core/config/environment.dart';

void main() => Development();


class Development extends Environment {
  final String appVersion = '0.0.1';
  final String baseApi = 'https://5f7cba02834b5c0016b058aa.mockapi.io/api/';
  final bool debug = false;
  final int delay = 30000;
  final bool printResponse = true;
}
