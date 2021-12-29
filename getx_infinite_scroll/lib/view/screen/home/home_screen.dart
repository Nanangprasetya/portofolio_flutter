import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_infinite_scroll/core/controller/detail_user_controller.dart';
import 'package:getx_infinite_scroll/core/controller/home_controller.dart';
import 'package:getx_infinite_scroll/utils/app_util.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'detail_user_screen.dart';

class HomeScreen extends GetView<HomeController> {
  void _createUser() => DetailUserController.to.createUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text("GetX Infinite Scroll")),
          floatingActionButton: GetBuilder(
            init: DetailUserController.to,
            builder: (value) {
              return FloatingActionButton(
                onPressed: () => _createModalButton(context, value),
                child: Icon(Icons.add),
              );
            },
          ),
          body: GetBuilder<HomeController>(
              init: HomeController.to,
              builder: (HomeController value) {
                return RefreshIndicator(
                  onRefresh: () =>
                      Future.sync(() => value.pagingController.value.refresh()),
                  child: PagedListView.separated(
                    pagingController: value.pagingController.value,
                    builderDelegate: PagedChildBuilderDelegate(
                        animateTransitions: true,
                        itemBuilder: (context, item, index) {
                          return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AppUtil.imageProvider(item.avatar),
                              ),
                              title: Text(item.name),
                              subtitle: Text(item.username),
                              trailing: Text(item.id),
                              onTap: () {
                                DetailUserController.to
                                    .updateIdUser(int.parse(item.id));
                                Get.toNamed('/detailUser');
                              });
                        }),
                    separatorBuilder: (context, index) => Divider(height: 0),
                  ),
                );
              })),
    );
  }

  Future<dynamic> _createModalButton(
      BuildContext context, DetailUserController detailUserController) {
    detailUserController.clearTextEditController();

    return Get.bottomSheet(
        Wrap(
          children: [
            Form(
              key: detailUserController.keyForm,
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
                          "Create User",
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
                              if ((!detailUserController.isLoadingAdd) &&
                                  detailUserController.keyForm.currentState
                                      .validate()) {
                                detailUserController.keyForm.currentState
                                    .save();
                                _createUser();
                              }
                            },
                            child: detailUserController.isLoadingAdd
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
}
