import 'package:get/get.dart';
import 'package:getx_infinite_scroll/core/controller/detail_user_controller.dart';
import 'package:getx_infinite_scroll/core/controller/home_controller.dart';
import 'package:getx_infinite_scroll/core/data/dio_exceptions.dart';
import 'package:getx_infinite_scroll/core/repository/user_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => DetailUserController(Get.find()));
  }
}
