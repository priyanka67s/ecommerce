import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_roles/controller/viewroles_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class ListOfPermissionPage extends StatefulWidget {
  const ListOfPermissionPage({super.key});

  @override
  State<ListOfPermissionPage> createState() => _ListOfPermissionPageState();
}

class _ListOfPermissionPageState extends State<ListOfPermissionPage> {
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "List of Permissions",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          "Permission Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 5,
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
                              Expanded(
                                child: (controller.status.isLoading ||
                                        controller.viewPermissionData.status ==
                                            false ||
                                        controller.viewPermissionData.status ==
                                            null)
                                    ? shimmerLayer()
                                    : dataLayer(controller),
                              ),
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

//! shimmer Layer
  ListView shimmerLayer() {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: const EdgeInsets.all(10.0),
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
                const Expanded(flex: 5, child: Center(child: Text(''))),
              ],
            ),
          );
        });
  }

//! data Layer
  ListView dataLayer(ViewRolesController controller) {
    return ListView.builder(
        itemCount: controller.viewPermissionData.permissions?.length,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: const EdgeInsets.all(10.0),
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
                    child: Text(controller.viewPermissionData.permissions?[i]
                            .permissionName ??
                        '')),
                const Expanded(flex: 5, child: Center(child: Text(''))),
              ],
            ),
          );
        });
  }
}
