import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/vendorprocessing_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class VendorEarningsPage extends StatefulWidget {
  const VendorEarningsPage({super.key});

  @override
  State<VendorEarningsPage> createState() => _VendorEarningsPageState();
}

class _VendorEarningsPageState extends State<VendorEarningsPage> {
  VendorProcessingController controller = Get.put(VendorProcessingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorProcessingController>(builder: (controller) {
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
                      titleText: "Vendor Earnings",
                      onBackButtonPressed: () {},
                    ),
                    SizedBox(
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
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Vendor Earnings",
                                    style: TextStyle(fontSize: 18),
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
                                          fontWeight: FontWeight.bold,
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
                                child: controller.status.isLoading ||
                                        controller.vendorEarningData.status ==
                                            false ||
                                        controller.vendorEarningData.result ==
                                            null
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
      itemCount: 1,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: StartShimmer(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
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
            ],
          ),
        );
      },
    );
  }

//! data Layer
  ListView dataLayer(VendorProcessingController controller) {
    return ListView.builder(
        itemCount: controller.vendorEarningData.result?.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(controller.vendorEarningData.result?[i].vendorid
                            .toString() ??
                        '')),
                Expanded(
                    flex: 3,
                    child: Text(
                      controller.vendorEarningData.result?[i].name ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      controller.vendorEarningData.result?[i].totalOrder
                              .toString() ??
                          '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      controller.vendorEarningData.result?[i].totalEarning
                              .toString() ??
                          '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
