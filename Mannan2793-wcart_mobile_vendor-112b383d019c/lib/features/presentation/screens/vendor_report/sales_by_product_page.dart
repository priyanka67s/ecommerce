import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/controller/vendor_report_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

class VendorSalesByProductPage extends StatefulWidget {
  const VendorSalesByProductPage({super.key});
  @override
  State<VendorSalesByProductPage> createState() =>
      _VendorSalesByProductPageState();
}

class _VendorSalesByProductPageState extends State<VendorSalesByProductPage> {
  VendorReportController controller = Get.put(VendorReportController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorReportController>(
      builder: (controller) {
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
                        titleText: 'Sale by product',
                        onBackButtonPressed: () {
                          controller.lowStockQty();
                          
                          controller.salesByCategoryReport();
                          controller.viewPerformanceReport();
                        },
                        showAction: true,
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
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            "Range",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 400,
                                            child: CustomDropdownButton(
                                              dropdownWidth:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.20,
                                              offset: const Offset(0, -10),
                                              dropdownItems: controller
                                                  .selectedPeriodCount,
                                              hint: 'select',
                                              value: controller.countList,
                                              onChanged: (val, key) {
                                                controller.countRecordListValue(
                                                    value: val,
                                                    context:
                                                        context); // Pass context here
                                              },
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            "Sales By Product",
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
                                                  flex: 2,
                                                  child: Text(
                                                    "S.NO",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Order Date",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Order Count",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "Sales",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                // Expanded(
                                                //     flex: 1,
                                                //     child: Text(
                                                //       "Action",
                                                //       style: TextStyle(
                                                //           fontSize: 14,
                                                //           fontWeight:
                                                //               FontWeight.bold),
                                                //     ))
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: ColorResource.colorDDDDDD,
                                            ),
                                            Expanded(
                                              child: controller.status.isLoading
                                                        ? shimmerLayer()
                                                        : Container()
                                                //! need to implement api for sales by product
                                                // : dataLayer(controller),
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
      },
    );
  }

  // ListView dataLayer(VendorReportController controller) {
  //   return ListView.separated(
  //     shrinkWrap: true,
  //     separatorBuilder: (context, index) {
  //       return const Divider(
  //         color: ColorResource.colorDDDDDD,
  //         thickness: 0.5,
  //       );
  //     },
  //     itemCount: controller.orderCountReportData.ordercount?.length ?? 0,
  //     itemBuilder: (context, i) {
  //       int sNo = i + 1;
  //       return Row(
  //         children: [
  //           Expanded(
  //               flex: 2,
  //               child: Text(
  //                 "$sNo",
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                 ),
  //               )),
  //           Expanded(
  //               flex: 3,
  //               child: Text(
  //                 formatOrderDate(controller
  //                         .orderCountReportData.ordercount?[i].orderDate) ??
  //                     '',
  //               )),
  //           Expanded(
  //               flex: 3,
  //               child: Text(
  //                 controller.orderCountReportData.ordercount?[i].totalOrders
  //                         ?.toString() ??
  //                     '',
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                 ),
  //               )),
  //           Expanded(
  //               flex: 1,
  //               child: Text(
  //                 controller.orderCountReportData.ordercount?[i].totalSales
  //                         ?.toString() ??
  //                     '',
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                 ),
  //               )),
  //           // Expanded(
  //           //   flex: 1,
  //           //   child: MouseRegion(
  //           //     cursor: SystemMouseCursors.click,
  //           //     child: GestureDetector(
  //           //       onTap: () {},
  //           //       child: const Padding(
  //           //         padding: EdgeInsets.only(right: 170),
  //           //         child: Icon(
  //           //           Icons.remove_red_eye,
  //           //           color: Colors.grey,
  //           //         ),
  //           //       ),
  //           //     ),
  //           //   ),
  //           // ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
                    width: 80,
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
                    width: 50,
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
}
