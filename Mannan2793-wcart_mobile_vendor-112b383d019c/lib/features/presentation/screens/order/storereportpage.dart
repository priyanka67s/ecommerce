import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/order/controller/vieworder_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

class StoreReportPage extends StatefulWidget {
  const StoreReportPage({super.key});

  @override
  State<StoreReportPage> createState() => _StoreReportPageState();
}

class _StoreReportPageState extends State<StoreReportPage> {
  ViewOrderController controller = Get.put(ViewOrderController());

  // int _currentPage = 1;
  // final int _itemsPerPage = 10;
  // List<OrderCount> _allOrders = [];
  // List<OrderCount> get _paginatedItems {
  //   final filtered = _filteredProducts;
  //   final start = (_currentPage - 1) * _itemsPerPage;
  //   final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
  //   return filtered.sublist(start, end);
  // }

  // List<OrderCount> get _filteredProducts {
  //   List<OrderCount> filtered = [];
  //   filtered = _allOrders;
  //   return filtered;
  // }

  // int get _totalPages => (_filteredProducts.length / _itemsPerPage).ceil();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewOrderController>(builder: (controller) {
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
                      titleText: "Manage Orders",
                      onBackButtonPressed: () {
                        // viewOrder
                      },
                      showAction: true,
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5.0,
                            ),
                          ),
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
                                    "Store Orders",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Obx(
                                    () => SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width /
                                          3.20,
                                      child: CustomDropdownButton(
                                        dropdownWidth:
                                            MediaQuery.of(context).size.width /
                                                3.20,
                                        offset: const Offset(0, -10),
                                        dropdownItems: controller
                                                .activeStoreData
                                                .activeStoreLocations
                                                ?.map((item) =>
                                                    item.locationTitle ?? "")
                                                .toSet()
                                                .toList() ??
                                            [],
                                        hint: 'Select Store',
                                        value: controller.storeDropDownValue
                                                .value.isEmpty
                                            ? null
                                            : controller.activeStoreData
                                                .activeStoreLocations
                                                ?.firstWhere(
                                                  (item) =>
                                                      item.storeLocationId
                                                          .toString() ==
                                                      controller
                                                          .storeDropDownValue
                                                          .value,
                                                )
                                                .locationTitle,
                                        onChanged: (val, key) {
                                          final selected = controller
                                              .activeStoreData
                                              .activeStoreLocations
                                              ?.firstWhere((item) =>
                                                  item.locationTitle == val);
                                          if (selected != null) {
                                            controller.updateStoreDropDownValue(
                                                selected.storeLocationId
                                                    .toString());
                                          }
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
                                    // Expanded(
                                    //     flex: 3,
                                    //     child: Center(
                                    //         child: Text(
                                    //       "Action",
                                    //       style: TextStyle(
                                    //           fontSize: 14,
                                    //           fontWeight: FontWeight.bold),
                                    //     )))
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              Expanded(
                                child: controller.status.isLoading ||
                                        controller
                                                .storeReportData.value.orders ==
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

//! shimmerLayer
  ListView shimmerLayer() {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: .5,
          );
        },
        itemCount: 15,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "$sNo",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Align(
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
                      child: SizedBox(
                        height: 20,
                        width: 40,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                ),
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
        });
  }

//! data layer
  ListView dataLayer(ViewOrderController controller) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: .5,
          );
        },
        itemCount: controller.storeReportData.value.orders?.length ?? 0,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                .storeReportData.value.orders?[i].orderid
                                .toString() ??
                            ""))),
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      controller.storeReportData.value.orders?[i].ordermapid ??
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
                              .storeReportData.value.orders?[i].createdtime) ??
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
                      controller.storeReportData.value.orders?[i].name ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ))),
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      controller.storeReportData.value.orders?[i].amount
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
                      controller.storeReportData.value.orders?[i].paymentmethod
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
                      controller.storeReportData.value.orders?[i].orderstatus
                              .toString() ??
                          '',
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
        });
  }
}
