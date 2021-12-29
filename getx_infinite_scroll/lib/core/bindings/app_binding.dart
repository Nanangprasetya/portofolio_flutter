import 'package:get/get.dart';
import 'package:getx_infinite_scroll/core/data/dio_client.dart';
import 'package:getx_infinite_scroll/core/data/dio_exceptions.dart';

class AppBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DioClient());
  }
}
