import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_roles/controller/viewroles_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class ViewRolesPage extends StatefulWidget {
  const ViewRolesPage({super.key});

  @override
  State<ViewRolesPage> createState() => _ViewRolesPageState();
}

class _ViewRolesPageState extends State<ViewRolesPage> {
  ViewRolesController controller = Get.put(ViewRolesController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewRolesController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');      
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomAppBar(
                      titleText: "Roles & Permissions",
                      onBackButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ColorResource.colorFFFFFF,
                          // border: Border.all(
                          //   color: Color(0xffe3e3e5),
                          // ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Manage Roles",
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
                                            "Add Role",
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
                                height: 20,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "S.NO",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 5,
                                        child: Text(
                                          "Role Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Action",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              // Expanded(
                              //     child: ListView.builder(
                              //         itemCount: controller
                              //             .viewRolesData.roles?.length,
                              //         itemBuilder: (context, i) {
                              //           int sNo = i + 1;
                              //           return Padding(
                              //             padding: EdgeInsets.all(5.0),
                              //             child: Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.spaceEvenly,
                              //               children: [
                              //                 Expanded(
                              //                     flex: 2,
                              //                     child: Text(
                              //                       "$sNo",
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     )),
                              //                 Expanded(
                              //                     flex: 5,
                              //                     child: Text(controller
                              //                             .viewRolesData
                              //                             .roles?[i]
                              //                             .roleName ??
                              //                         '')),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Row(
                              //                       children: [
                              //                         GestureDetector(
                              //                           onTap: () {
                              //                             Get.toNamed(
                              //                                 Routes
                              //                                     .updateRolesPage,
                              //                                 arguments: {
                              //                                   'StaffRoleId':
                              //                                       controller
                              //                                           .viewRolesData
                              //                                           .roles?[
                              //                                               i]
                              //                                           .staffRoleId
                              //                                 });
                              //                           },
                              //                           child: const SvgIcon(
                              //                             'assets/icon/svg/edit.svg',
                              //                             height: 40,
                              //                           ),
                              //                         ),
                              //                         GestureDetector(
                              //                           onTap: (() {
                              //                             // controller.Removewarehouse(
                              //                             //     controller
                              //                             //         .warehouseData
                              //                             //         .warehouseAddress![i]
                              //                             //         .warehouseId!,
                              //                             //     i);
                              //                           }),
                              //                           child: const SvgIcon(
                              //                             'assets/icon/svg/remove.svg',
                              //                             height: 40,
                              //                           ),
                              //                         )
                              //                       ],
                              //                     )),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: const Text(''))),
                              //               ],
                              //             ),
                              //           );
                              //         })),
                              Expanded(
                                child: (controller.status.isLoading ||
                                        controller.viewRolesData.status ==
                                            null ||
                                        controller.viewRolesData.status ==
                                            false)
                                    ? shimmerLayer()
                                    : dataLayer(controller),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

//! shimmerLayer
  ListView shimmerLayer() {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: 0.5,
          );
        },
        itemCount: 15,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {},
                            child: const SvgIcon(
                              'assets/icon/svg/edit.svg',
                              height: 40,
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (() {}),
                            child: const SvgIcon(
                              'assets/icon/svg/remove.svg',
                              height: 40,
                            ),
                          ),
                        )
                      ],
                    )),
                const Expanded(flex: 3, child: Center(child: Text(''))),
              ],
            ),
          );
        });
  }

//! dataLayer
  ListView dataLayer(ViewRolesController controller) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: 0.5,
          );
        },
        itemCount: controller.viewRolesData.roles?.length ?? 0,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 2,
                    child: Text(
                      "$sNo",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Text(
                        controller.viewRolesData.roles?[i].roleName ?? '')),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.updateRolesPage, arguments: {
                                'StaffRoleId': controller
                                    .viewRolesData.roles?[i].staffRoleId,
                                'RoleName':
                                    controller.viewRolesData.roles?[i].roleName
                              });
                            },
                            child: const SvgIcon(
                              'assets/icon/svg/edit.svg',
                              height: 40,
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (() {
                              controller.removeStaffRole(
                                  controller
                                      .viewRolesData.roles![i].staffRoleId!,
                                  i);
                            }),
                            child: const SvgIcon(
                              'assets/icon/svg/remove.svg',
                              height: 40,
                            ),
                          ),
                        )
                      ],
                    )),
                const Expanded(flex: 3, child: Center(child: Text(''))),
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
                            "Role Name", controller.RoleNameController)),
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
                  onPressed: () {
                    controller.addStaffRole();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
