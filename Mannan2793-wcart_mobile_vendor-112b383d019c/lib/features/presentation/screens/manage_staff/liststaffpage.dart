import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/controller/liststaff_controller.dart';

import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

import 'package:wcart_vendor/util/svg_icon.dart';

class ListStaffPage extends StatefulWidget {
  const ListStaffPage({super.key});

  @override
  State<ListStaffPage> createState() => _ListStaffPageState();
}

class _ListStaffPageState extends State<ListStaffPage> {
  ListStaffController controller = Get.put(ListStaffController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListStaffController>(
      builder: (controller) {
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
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorResource.colorFFFFFF,
                            // border: Border.all(
                            //   color: Color(0xffe3e3e5),
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Manage Staffs",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.addNewStaffWareHousePage,
                                              arguments: {
                                                'fromScreen':
                                                    StringResources.addProduct
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorResource.color0D5EF8,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                            height: 40,
                                            width: AppUtils.vs(220, context),
                                            child: Center(
                                              child: Text(
                                                "Add New Staff",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "S.NO",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Name",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Role",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Action",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.5,
                                  color: ColorResource.colorDDDDDD,
                                ),
                                Expanded(
                                  child: controller.status.isLoading
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
      },
    );
  }

//! shimmer Layer
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
            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "$sNo",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
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
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 20,
                          width: 120,
                          child: StartShimmer(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 20,
                          width: 100,
                          child: StartShimmer(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const SvgIcon(
                                    'assets/icon/svg/edit.svg',
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (() {}),
                                child: const SvgIcon(
                                  'assets/icon/svg/remove.svg',
                                  height: 40,
                                ),
                              ),
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

//! dataLayer
  ListView dataLayer(ListStaffController controller) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: controller.allStaffData.staffs?.length ?? 0,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      controller.allStaffData.staffs?[i].userName ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      controller.allStaffData.staffs?[i].email ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      controller.allStaffData.staffs?[i].roleName ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  Routes.addNewStaffWareHousePage,
                                  arguments: {
                                    'fromScreen': StringResources.editStaff,
                                    'staffId': controller
                                        .allStaffData.staffs?[i].storeStaffId
                                  },
                                )!
                                    .then(
                                  (value) {
                                    if (value ?? false) {
                                      controller.allStaff();
                                    }
                                  },
                                );
                              },
                              child: const SvgIcon(
                                'assets/icon/svg/edit.svg',
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: (() {
                                controller.deleteStaff(
                                    staffId: controller
                                        .allStaffData.staffs![i].storeStaffId
                                        .toString());
                              }),
                              child: const SvgIcon(
                                'assets/icon/svg/remove.svg',
                                height: 40,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
