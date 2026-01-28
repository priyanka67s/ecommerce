import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/controller/vendor_report_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';


class LowStockVendorProductPage extends StatefulWidget {
  const LowStockVendorProductPage({super.key});

  @override
  State<LowStockVendorProductPage> createState() =>
      _LowStockVendorProductPageState();
}

class _LowStockVendorProductPageState extends State<LowStockVendorProductPage> {
  DateTime selectedDate = DateTime.now();

  VendorReportController controller = Get.put(VendorReportController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorReportController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomAppBar(
                      titleText: 'Low Stock Product',
                      onBackButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          color: ColorResource.colorFFFFFF,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Column(
                                  children: [                                    
                                    Row(
                                      children: [
                                        Text(
                                          "Low Stock Product Report",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: ColorResource.colorFFFFFF,
                                        // border: Border.all(
                                        //   color: Color(0xffe3e3e5),
                                        // ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "S.NO",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 7,
                                                child: Text(
                                                  "Name",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Quantity",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Threshold",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Action",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

//!shimmer layer
  ListView shimmerLayer() {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: 15,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Row(
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
              flex: 3,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 20,
                    width: 70,
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
                    width: 70,
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
                    width: 40,
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
                    width: 40,
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
                    width: 40,
                    child: StartShimmer(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//! Data Layer
  ListView dataLayer(VendorReportController controller) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: controller.lowStockVendorProductData.productData?.length ?? 0,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Row(
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
              flex: 7,
              child: Text(
                controller.lowStockVendorProductData.productData?[i].name ?? '',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 3,
              child: Text(
                controller.lowStockVendorProductData.productData?[i].quantity
                        .toString() ??
                    "",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                controller
                        .lowStockVendorProductData.productData?[i].lowStockLimit
                        .toString() ??
                    "",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                controller.lowStockVendorProductData.productData?[i].status
                        .toString() ??
                    "",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 160,
                    ),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
