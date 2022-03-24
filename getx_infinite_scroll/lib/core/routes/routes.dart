import 'package:get/get.dart';
import 'package:getx_infinite_scroll/core/bindings/home_binding.dart';
import 'package:getx_infinite_scroll/view/home/detail_user_screen.dart';
import 'package:getx_infinite_scroll/view/home/home_screen.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/',
    page: () => HomeScreen(),
    binding: HomeBindings(),
  ),
  GetPage(
      name: '/detailUser',
      page: () => DetailUserScreen(),
      binding: HomeBindings())
];
