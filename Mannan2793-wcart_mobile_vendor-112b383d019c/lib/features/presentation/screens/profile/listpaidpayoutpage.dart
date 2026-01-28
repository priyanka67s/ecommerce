import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/viewpayouts_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class ListPaidPayoutsPage extends StatefulWidget {
  const ListPaidPayoutsPage({super.key});

  @override
  State<ListPaidPayoutsPage> createState() => _ListPaidPayoutsPageState();
}

class _ListPaidPayoutsPageState extends State<ListPaidPayoutsPage> {
  ViewPayoutsController controller = Get.put(ViewPayoutsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewPayoutsController>(builder: (controller) {
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
                    titleText: "Manage users",
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
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "View List Of Paid Payouts",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Vendor ID",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          StringResources.name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Total Orders",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "TotalEarning",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Type",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Paid Date",
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
                                        ))
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: controller
                                          .viewPayoutsData.result?.length,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(controller
                                                          .viewPayoutsData
                                                          .result?[i]
                                                          .vendorid
                                                          .toString() ??
                                                      '')),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller.viewPayoutsData
                                                            .result?[i].name ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller
                                                            .viewPayoutsData
                                                            .result?[i]
                                                            .totalOrder
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller
                                                            .viewPayoutsData
                                                            .result?[i]
                                                            .totalEarning
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller
                                                            .viewPayoutsData
                                                            .result?[i]
                                                            .processId
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    controller
                                                            .viewPayoutsData
                                                            .result?[i]
                                                            .processed
                                                            .toString() ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                flex: 3,
                                                child: MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,

                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                        Routes.viewPayoutsPage,
                                                        // arguments: {
                                                        //   'ProcessId': controller
                                                        //       .viewProcessingPayoutData
                                                        //       .result![i]
                                                        //       .processId
                                                        // }
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          color: ColorResource
                                                              .color0D5EF8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0))),
                                                      height: AppUtils.vs(
                                                          55, context),
                                                      width: AppUtils.vs(
                                                          100, context),
                                                      child: const Center(
                                                        child: Text(
                                                          'Edit VendorView Orders',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
