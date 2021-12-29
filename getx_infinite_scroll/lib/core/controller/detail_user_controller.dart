import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_infinite_scroll/core/data/dio_exceptions.dart';
import 'package:getx_infinite_scroll/core/model/user_model.dart';
import 'package:getx_infinite_scroll/core/repository/user_repository.dart';

import 'home_controller.dart';

class DetailUserController extends GetxController {
  DetailUserController(this._userRepository);

  static DetailUserController get to => Get.find();
  final UserRepository _userRepository;
  final _user = UserModel().obs;
  final _idUser = 0.obs;
  final _isLoading = false.obs;
  final _isLoadingDel = false.obs;
  final _isLoadingEd = false.obs;
  final _isLoadingAdd = false.obs;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Rx<UserModel> get user => _user;
  int get idUser => _idUser.value;
  bool get isLoading => _isLoading.value;
  bool get isLoadingDel => _isLoadingDel.value;
  bool get isLoadingEd => _isLoadingEd.value;
  bool get isLoadingAdd => _isLoadingAdd.value;

  void updateIdUser(int id) => _idUser(id);

  void clearTextEditController() {
    usernameController.clear();
    nameController.clear();
  }

  Future<void> getById() async {
    _isLoading(true);
    final userData = await _userRepository.getByIdUser(_idUser.value);
    user(userData);
    _isLoading(false);
  }

  Future<void> deleteUser() async {
    _isLoadingDel(true);
    try {
      await _userRepository.deleteUser(idUser);
      HomeController.to.pagingController.value.refresh();
      Get.back(result: true);
    } catch (e) {
      final message = DioExceptions.fromDioError(e);
      Get.defaultDialog(middleText: message.toString());
    } finally {
      _isLoadingDel(false);
    }   
  }

  Future<void> edituser() async {
    UserModel user =
        UserModel(name: nameController.text, username: usernameController.text);
    _isLoadingEd(true);
    try {
      await _userRepository.updateUser(idUser, user);
      DetailUserController.to.getById();
      HomeController.to.pagingController.value.refresh();
      Get.back();
    } catch (e) {
      final message = DioExceptions.fromDioError(e);
      Get.defaultDialog(middleText: message.toString());
    } finally {
      _isLoadingEd(false);
    }
  }

  Future<void> createUser() async {
    UserModel user =
        UserModel(name: nameController.text, username: usernameController.text);
    _isLoadingAdd(true);
    try {
      await _userRepository.createUser(user);
      HomeController.to.pagingController.value.refresh();

      Get.back();
    } catch (e) {
      final message = DioExceptions.fromDioError(e);
      Get.defaultDialog(middleText: message.toString());
    } finally {
      _isLoadingAdd(false);
    }
  }

  @override
  void onInit() {
    ever(_idUser, (_) => getById());
    super.onInit();
  }
}
