import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/model/viewrolepermission_model.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_roles/controller/updateroles_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class UpdateRolesPage extends StatefulWidget {
  const UpdateRolesPage({super.key});

  @override
  State<UpdateRolesPage> createState() => _UpdateRolesPageState();
}

List<ViewRolePermission> viewValue = [];

class _UpdateRolesPageState extends State<UpdateRolesPage> {
  String getSelectedValues(List<ViewRolePermission> viewRole) {
    String selectedValues = '';
    for (int i = 0; i < (viewRole).length; i++) {
      if (viewRole[i].isSelected ?? false) {
        selectedValues +=
            '${selectedValues.isEmpty ? '' : ','}${viewRole[i].perView ?? 0}';
      }
    }
    return selectedValues;
  }

  UpdateRolesController controller = Get.put(UpdateRolesController());

  @override
  void initState() {
    print(Get.arguments['RoleName']);
    Get.arguments['RoleName'] = controller.roleNameController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateRolesController>(builder: (controller) {
      print('muthuvel');
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomAppBar(
                    titleText: "Roles & Permissions",
                    onBackButtonPressed: () {},
                  ),                  
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 7),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorResource.colorFFFFFF,
                          // border: Border.all(
                          //   color: Color(0xffe3e3e5),
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Update Role",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        addRole();
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        height: AppUtils.vs(65, context),
                                        width: AppUtils.vs(200, context),
                                        child: const Center(
                                          child: Text(
                                            "Add New Role",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Role Name",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 400,
                                        child: CustomTextField("Role Name",
                                            Get.arguments['RoleName']),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Permission",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Center(
                                            child: Text(
                                          "View",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                    Expanded(
                                        flex: 2,
                                        child: Center(
                                            child: Text(
                                          'Create',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                    Expanded(
                                        flex: 2,
                                        child: Center(
                                            child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                    Expanded(
                                        flex: 2,
                                        child: Center(
                                            child: Text(
                                          "Delete",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        )))
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  // shrinkWrap: true,
                                  itemCount: controller
                                      .viewRolesData.viewRolePermission?.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              controller
                                                      .viewRolesData
                                                      .viewRolePermission?[i]
                                                      .permissionName ??
                                                  "",
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Checkbox(
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                                value: controller
                                                        .viewRolesData
                                                        .viewRolePermission?[i]
                                                        .perView ==
                                                    1,
                                                activeColor: Colors.blue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    controller
                                                        .viewRolesData
                                                        .viewRolePermission?[i]
                                                        .perView = value! ? 1 : 0;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Checkbox(
                                              side: const BorderSide(
                                                  color: Colors.grey),
                                              value: controller
                                                      .viewRolesData
                                                      .viewRolePermission?[i]
                                                      .perCreate ==
                                                  1,
                                              activeColor: Colors.blue,
                                              onChanged: (value) {
                                                setState(() {
                                                  controller
                                                          .viewRolesData
                                                          .viewRolePermission?[i]
                                                          .perCreate =
                                                      value! ? 1 : 0;
                                                });
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Checkbox(
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                                value: controller
                                                        .viewRolesData
                                                        .viewRolePermission?[i]
                                                        .perEdit ==
                                                    1,
                                                activeColor: Colors.blue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    controller
                                                        .viewRolesData
                                                        .viewRolePermission?[i]
                                                        .perEdit = value! ? 1 : 0;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(
                                              child: Checkbox(
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                                value: controller
                                                        .viewRolesData
                                                        .viewRolePermission?[i]
                                                        .perDelete ==
                                                    1,
                                                activeColor: Colors.blue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    controller
                                                            .viewRolesData
                                                            .viewRolePermission?[i]
                                                            .perDelete =
                                                        value! ? 1 : 0;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        print('----');
                                        viewValue = controller
                                            .viewRolesData.viewRolePermission!;
                                        print(viewValue);

                                        // if (controller.viewRolesData
                                        //             .viewRolePermission !=
                                        //         null &&
                                        //     controller.viewRolesData
                                        //         .viewRolePermission!.isNotEmpty) {
                                        //   viewValue = getSelectedValues(controller
                                        //       .viewRolesData.viewRolePermission);
                                        // }

                                        controller.updateStaffRole();
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        height: AppUtils.vs(65, context),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Submit Permissions',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<void> addRole() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text('Add Role'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Role Name",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorResource.color252525,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: CustomTextField(
                            "Role Name", controller.addNewRoleNameController)),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
