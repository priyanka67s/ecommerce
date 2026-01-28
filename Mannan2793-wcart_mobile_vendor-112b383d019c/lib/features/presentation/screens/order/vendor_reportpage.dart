import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/order/controller/vieworder_controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

class WarehouseReportPage extends StatefulWidget {
  const WarehouseReportPage({super.key});

  @override
  State<WarehouseReportPage> createState() => _WarehouseReportPageState();
}

class _WarehouseReportPageState extends State<WarehouseReportPage> {
  ViewOrderController controller = Get.put(ViewOrderController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewOrderController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return Center(child: const CircularProgressIndicator());
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Warehouse Orders",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  // SizedBox(
                                  //   height: 52,
                                  //   child: DropdownButtonFormField(
                                  //     decoration: const InputDecoration(
                                  //       border: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: ColorResource.color1c1d22),
                                  //         borderRadius: BorderRadius.all(
                                  //           Radius.circular(3.0),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     hint: const Text('select Warehouse'),
                                  //     items: controller
                                  //         .activeWareHouseData.warehouseAddress
                                  //         ?.map((item) {
                                  //       return DropdownMenuItem(
                                  //         value: item.locationTitle.toString(),
                                  //         child: Text(
                                  //             item.locationTitle.toString()),
                                  //       );
                                  //     }).toList(),
                                  //     onChanged: (newVal) {
                                  //       setState(() {
                                  //         controller.warehouseDropDownValue =
                                  //             newVal;
                                  //       });
                                  //     },
                                  //     value: controller.warehouseDropDownValue,
                                  //     validator: (value) {
                                  //       if (value == null) {
                                  //         return 'Please select a value';
                                  //       }
                                  //       return null; // return null if validation passes
                                  //     },
                                  //   ),

                                  //   // CustomDropdownButton(
                                  //   //   hint: '',
                                  //   //   value: warehouseItemValue,
                                  //   //   dropdownItems: warehouseDropdownList,
                                  //   //   onChanged: (val, key) {
                                  //   //     setState(() {
                                  //   //       warehouseItemValue = val;
                                  //   //     });
                                  //   //   },
                                  //   // ),
                                  // )
                                  SizedBox(
                                    height: 50,
                                    width: 200,
                                    child: Obx(
                                      () => DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    ColorResource.color1c1d22),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0)),
                                          ),
                                        ),
                                        hint: const Text('Select Warehouse'),
                                        items: controller.activeWareHouseData
                                            .warehouseAddress
                                            ?.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item.warehouseId.toString(),
                                            child:
                                                Text(item.locationTitle ?? ""),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          if (newVal != null) {
                                            controller
                                                .updateWarehouseDropDownValue(
                                                    newVal);
                                          }
                                        },
                                        value: controller.warehouseDropDownValue
                                                .value.isEmpty
                                            ? null
                                            : controller
                                                .warehouseDropDownValue.value,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select a value';
                                          }
                                          return null; // return null if validation passes
                                        },
                                      ),
                                    ),
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
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Order ID",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Order Map ID",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Order Date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Buyer Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Total Amount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Payment Mode",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Order Status",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                            child: Text(
                                          "Action",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )))
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
                              //             .viewOrderData.orders?.length,
                              //         itemBuilder: (context, i) {
                              //           int sNo = i + 1;
                              //           return Padding(
                              //             padding: const EdgeInsets.all(5.0),
                              //             child: Row(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.spaceEvenly,
                              //               children: [
                              //                 Expanded(
                              //                     flex: 1,
                              //                     child: Center(
                              //                         child: Text(
                              //                       "$sNo",
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(controller
                              //                                 .viewOrderData
                              //                                 .orders?[i]
                              //                                 .orderid
                              //                                 .toString() ??
                              //                             ""))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller
                              //                               .viewOrderData
                              //                               .orders?[i]
                              //                               .ordermapid ??
                              //                           '',
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller.viewOrderData
                              //                               .orders?[i].cartFrom
                              //                               .toString() ??
                              //                           '',
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller.viewOrderData
                              //                               .orders?[i].name ??
                              //                           '',
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller.viewOrderData
                              //                               .orders?[i].amount
                              //                               .toString() ??
                              //                           "",
                              //                       style: const TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller
                              //                               .viewOrderData
                              //                               .orders?[i]
                              //                               .paymentmethod
                              //                               .toString() ??
                              //                           '',
                              //                       style: TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: Center(
                              //                         child: Text(
                              //                       controller
                              //                               .viewOrderData
                              //                               .orders?[i]
                              //                               .orderstatus
                              //                               .toString() ??
                              //                           '',
                              //                       style: TextStyle(
                              //                         fontSize: 14,
                              //                       ),
                              //                     ))),
                              //                 Expanded(
                              //                     flex: 3,
                              //                     child: GestureDetector(
                              //                       onTap: () {
                              //                         Get.toNamed(
                              //                             Routes.orderDetails,
                              //                             arguments: {
                              //                               'ordermapId': controller
                              //                                       .viewOrderData
                              //                                       .orders?[i]
                              //                                       .ordermapid ??
                              //                                   "",
                              //                               'orderstatus': controller
                              //                                       .viewOrderData
                              //                                       .orders?[i]
                              //                                       .orderstatus ??
                              //                                   "",
                              //                             });
                              //                       },
                              //                       child: Icon(
                              //                         Icons.remove_red_eye,
                              //                         color: Colors.grey,
                              //                       ),
                              //                     )),
                              //               ],
                              //             ),
                              //           );
                              //         })),
                              Expanded(
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: ColorResource.colorDDDDDD,
                                          thickness: .5,
                                        );
                                      },
                                      itemCount: controller.warehouseReportData
                                              .value.orders?.length ??
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
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(controller
                                                              .warehouseReportData
                                                              .value
                                                              .orders?[i]
                                                              .orderid
                                                              .toString() ??
                                                          ""))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    controller
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .ordermapid ??
                                                        '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ))),
                                              Expanded(
                                                flex: 3,
                                                child: Center(
                                                  child: Text(
                                                    formatOrderDate(controller
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .createdtime) ??
                                                        '',
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
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .name ??
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
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .amount
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
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .paymentmethod
                                                            .toString() ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    controller
                                                            .warehouseReportData
                                                            .value
                                                            .orders?[i]
                                                            .orderstatus
                                                            .toString() ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            Routes.orderDetails,
                                                            arguments: {
                                                              'ordermapId': controller
                                                                      .viewOrderData
                                                                      .orders?[
                                                                          i]
                                                                      .ordermapid ??
                                                                  "",
                                                              'orderstatus': controller
                                                                      .viewOrderData
                                                                      .orders?[
                                                                          i]
                                                                      .orderstatus ??
                                                                  "",
                                                            });
                                                      },
                                                      child: Icon(
                                                        Icons.remove_red_eye,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  )),
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
    });
  }
}
