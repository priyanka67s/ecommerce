import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/controller/lowstock_contoller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class LowStockProductPage extends StatefulWidget {
  const LowStockProductPage({super.key});

  @override
  State<LowStockProductPage> createState() => _LowStockProductPageState();
}

class _LowStockProductPageState extends State<LowStockProductPage> {
  LowStockController controller = Get.put(LowStockController());
  @override
  Widget build(BuildContext context) {
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
                  titleText: "Manage Orders",
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product Stock",
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
                                      flex: 1,
                                      child: Center(
                                          child: Text(
                                        "S.NO",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 4,
                                      child: Center(
                                          child: Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                          child: Text(
                                        "Quantity",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                          child: Text(
                                        "Low stock Limit",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                          child: Text(
                                        "Product Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                          child: Text(
                                        "Sku Code",
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
                                child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: ColorResource.colorDDDDDD,
                                        thickness: .5,
                                      );
                                    },
                                    itemCount: controller.lowStockProductData
                                            .productData?.length ??
                                        0,
                                    itemBuilder: (context, i) {
                                      int sNo = i + 1;
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Center(
                                                    child: Text(
                                                  "$sNo",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ))),
                                            Expanded(
                                                flex: 4,
                                                child: Center(
                                                  child: Text(controller
                                                          .lowStockProductData
                                                          .productData?[i]
                                                          .name
                                                          .toString() ??
                                                      ""),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Center(
                                                    child: Text(
                                                  controller
                                                          .lowStockProductData
                                                          .productData?[i]
                                                          .quantity
                                                          .toString() ??
                                                      "",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ))),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                child: Text(
                                                  controller
                                                          .lowStockProductData
                                                          .productData?[i]
                                                          .lowStockLimit
                                                          .toString() ??
                                                      "",
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
                                                  controller
                                                          .lowStockProductData
                                                          .productData?[i]
                                                          .producttype
                                                          .toString() ??
                                                      "",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ))),
                                            Expanded(
                                                flex: 3,
                                                child: Center(
                                                    child: Text(
                                                  controller.lowStockProductData
                                                          .productData?[i].sku
                                                          .toString() ??
                                                      "",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ))),

                                            // Expanded(
                                            //     flex: 3,
                                            //     child: GestureDetector(
                                            //       onTap: () {
                                            //         Get.toNamed(
                                            //             Routes.orderDetails,
                                            //             arguments: {
                                            //               'ordermapId': controller
                                            //                       .viewOrderData
                                            //                       .orders?[i]
                                            //                       .ordermapid ??
                                            //                   "",
                                            //               'orderstatus': controller
                                            //                       .viewOrderData
                                            //                       .orders?[i]
                                            //                       .orderstatus ??
                                            //                   "",
                                            //             });
                                            //       },
                                            //       child: Icon(
                                            //         Icons.remove_red_eye,
                                            //         color: Colors.grey,
                                            //       ),
                                            //     )),
                                          ],
                                        ),
                                      );
                                    }))
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
  }
}
