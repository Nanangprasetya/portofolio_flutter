import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_infinite_scroll/core/controller/detail_user_controller.dart';
import 'package:getx_infinite_scroll/utils/app_util.dart';

class DetailUserScreen extends GetView<DetailUserController> {
  @override
  Widget build(BuildContext context) {
    void _onDelete() => DetailUserController.to.deleteUser();
    void _onEdit() => DetailUserController.to.edituser();

    return Scaffold(
        appBar: AppBar(
          title: Text("Detail User"),
          actions: [
            IconButton(
                onPressed: () => _editModalButton(context, _onEdit).then(
                    (value) => controller.updateIdUser(controller.idUser)),
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () =>
                    _deleteModalButtom(context, _onDelete).then((value) {
                      if (value??false) Get.back();
                    }),
                icon: Icon(Icons.delete))
          ],
        ),
        body: Obx(
          () => Center(
            child: controller.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundImage:
                            AppUtil.imageProvider(controller.user.value.avatar),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Name : ${controller.user.value.name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Username : ${controller.user.value.username}",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
          ),
        ));
  }

  Future<dynamic> _editModalButton(BuildContext context, void _onEdit()) {
    DetailUserController.to.nameController.text = controller.user.value.name;
    DetailUserController.to.usernameController.text =
        controller.user.value.username;

    return Get.bottomSheet(
        Wrap(
          children: [
            Form(
              key: controller.keyForm,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        width: double.infinity,
                        child: Text(
                          "Edit User",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      TextFormField(
                        controller: DetailUserController.to.nameController,
                        validator: (i) {
                          if (i.isEmpty) {
                            return "Form must be filled";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: DetailUserController.to.usernameController,
                        validator: (i) {
                          if (i.isEmpty) {
                            return "Form must be filled";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                      ),
                      SizedBox(height: 36),
                      Obx(
                        () => ButtonTheme(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: OutlinedButton(
                            onPressed: () {
                              if ((!controller.isLoadingAdd) &&
                                  controller.keyForm.currentState.validate()) {
                                controller.keyForm.currentState.save();
                                _onEdit();
                              }
                            },
                            child: controller.isLoadingEd
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2.5))
                                : Text("Save Data"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white);
  }

  Future<dynamic> _deleteModalButtom(BuildContext context, void _onDelete()) {
    return Get.bottomSheet(
        Wrap(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    width: double.infinity,
                    child: Text(
                      "Delete User",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Are you sure Delete this user?"),
                  ),
                  Obx(
                    () => ButtonTheme(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: OutlinedButton(
                        onPressed: () {
                          if (!controller.isLoadingDel) _onDelete();
                        },
                        child: controller.isLoadingDel
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2.5))
                            : Text("Delete"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white);
  }
}
