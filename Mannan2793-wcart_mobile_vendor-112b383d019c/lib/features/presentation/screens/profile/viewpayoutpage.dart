import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/viewpayouts_controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class ViewPayoutPage extends StatefulWidget {
  const ViewPayoutPage({super.key});

  @override
  State<ViewPayoutPage> createState() => _ViewPayoutPageState();
}

class _ViewPayoutPageState extends State<ViewPayoutPage> {
  ViewPayoutsController controller = Get.put(ViewPayoutsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewPayoutsController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return Center(child: CircularProgressIndicator());
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
                    titleText: "Vendor Earnings",
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
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Processing Payouts By Id ${Get.arguments['ProcessId'].toString()}',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
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
                                        child: Center(
                                            child: Text(
                                          "Vendor ID",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          StringResources.name,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Total Orders",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "TotalEarning",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Process Id",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Processed",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )))
                                  ],
                                ),
                              ),
                              Divider(
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
                                                  child: Center(
                                                      child: Text(controller
                                                              .viewPayoutsData
                                                              .result?[i]
                                                              .vendorid
                                                              .toString() ??
                                                          ''))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    controller.viewPayoutsData
                                                            .result?[i].name ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
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
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
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
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
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
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
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
                                                  ))),
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
