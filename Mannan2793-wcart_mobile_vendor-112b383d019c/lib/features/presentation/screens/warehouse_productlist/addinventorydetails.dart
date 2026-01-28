import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/controller/viewinventorydetails_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddInventoryDetailsPage extends StatefulWidget {
  const AddInventoryDetailsPage({super.key});

  @override
  State<AddInventoryDetailsPage> createState() =>
      _AddInventoryDetailsPageState();
}

class _AddInventoryDetailsPageState extends State<AddInventoryDetailsPage> {
  ViewInventoryDetailsController controller =
      Get.put(ViewInventoryDetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewInventoryDetailsController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomAppBar(
                    titleText: 'Store Settings',
                    onBackButtonPressed: () {},
                    isLoading: controller.status.isLoading,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 7),
                        height: AppUtils.vs(2000, context),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: Text(
                                    'Product Name: Boat Watch',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorResource.color000000,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: .5,
                              color: ColorResource.colorDDDDDD,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        child: Text(
                                          'Inventory Details',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            PopupMenuButton<String>(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: ColorResource
                                                        .color0D5EF8,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  height: 40,
                                                  width: 140,
                                                  child: const Center(
                                                    child: Text(
                                                      'Update Quantity',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorResource
                                                              .colorFEFFFF),
                                                    ),
                                                  )),
                                              onSelected: (String value) {
                                                print('Selected: $value');
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return <PopupMenuEntry<String>>[
                                                  PopupMenuItem<String>(
                                                    value: 'option 1',
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            addQty();
                                                          },
                                                          child: const Text(
                                                              'Increase')),
                                                    ),
                                                  ),
                                                  PopupMenuItem<String>(
                                                    value: 'option 2',
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            decQty();
                                                          },
                                                          child: const Text(
                                                              'Decrease')),
                                                    ),
                                                  ),
                                                ];
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    productHistory(context);
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        color: ColorResource
                                                            .color0D5EF8,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      height: 40,
                                                      width: 140,
                                                      child: const Center(
                                                        child: Text(
                                                          'History',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ColorResource
                                                                  .colorFEFFFF),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 20, 10, 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Product SKU',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 300),
                                          child: Text(
                                            'boat-watch',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Product Name',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 290),
                                          child: Text(
                                            controller.viewStoreInventoryData
                                                    .viewInventory?.sku ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Warehouse Location',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 250),
                                          child: Text(
                                            controller
                                                    .viewStoreInventoryData
                                                    .viewInventory
                                                    ?.locationTitle ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Incoming',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 330),
                                          child: Text(
                                            controller
                                                    .viewStoreInventoryData
                                                    .viewInventory
                                                    ?.incomingQuantity
                                                    .toString() ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Committed',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 318),
                                          child: Text(
                                            controller
                                                    .viewStoreInventoryData
                                                    .viewInventory
                                                    ?.committedQuantity
                                                    .toString() ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Available',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color000000,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 330),
                                          child: Text(
                                            controller
                                                    .viewStoreInventoryData
                                                    .viewInventory
                                                    ?.availableStock
                                                    .toString() ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: ColorResource.color000000,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                ],
                              ),
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
      );
    }
    );
  }

  Future<void> addQty() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text(
            'Product Quantity Increase',
            style: TextStyle(
              fontSize: 18,
              color: ColorResource.color000000,
              fontWeight: FontWeight.w400,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "Qty",
                      controller.increaseQtyController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Description ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "Description",
                      controller.increaseDescriptionController,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {
                    controller.increaseInventory(
                      controller.viewStoreInventoryData.viewInventory?.sku ??
                          '',
                      controller.viewStoreInventoryData.viewInventory!.productid
                          .toString(),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> decQty() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text(
            'Product Quantity Decrease',
            style: TextStyle(
              fontSize: 18,
              color: ColorResource.color000000,
              fontWeight: FontWeight.w400,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "Qty",
                      controller.decreaseQtyController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Description ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "Description",
                      controller.decreaseDescriptionController,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {
                    controller.viewStoreInventoryData.viewInventory?.sku ?? "";

                    controller
                            .viewStoreInventoryData.viewInventory?.productid ??
                        "";
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Future<void> productHistory() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         surfaceTintColor: Colors.transparent,
  //         backgroundColor: ColorResource.colorFFFFFF,
  //         title: const Text('Product History'),
  //         content: SizedBox(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               const Divider(
  //                 thickness: .5,
  //                 color: ColorResource.colorDDDDDD,
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   SizedBox(
  //                     height: 35,
  //                     width: 160,
  //                     child: TextFormField(
  //                       keyboardType: TextInputType.text,
  //                       textInputAction: TextInputAction.search,
  //                       onFieldSubmitted: (term) {},
  //                       onChanged: (value) {},
  //                       decoration: InputDecoration(
  //                         suffixIcon: const Icon(Icons.search,
  //                             size: 20.0, color: ColorResource.colorC4CACD),
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 7.0, horizontal: 20),
  //                         hintText: 'Search',
  //                         hintStyle: const TextStyle(
  //                             fontSize: 14.0, color: ColorResource.colorC4CACD),
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(3.0),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   margin: const EdgeInsets.only(left: 15, right: 7),
  //                   child: Container(
  //                     decoration: const BoxDecoration(
  //                       color: ColorResource.colorFFFFFF,
  //                       // border: Border.all(
  //                       //   color: Color(0xffe3e3e5),
  //                       // ),
  //                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //                     ),
  //                     child: const Column(
  //                       children: [
  //                         SizedBox(
  //                           height: 10,
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsets.all(5.0),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               Expanded(
  //                                   flex: 1,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "Date",
  //                                     style: TextStyle(
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 3,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "Activity",
  //                                     style: TextStyle(
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 4,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "Activity Description",
  //                                     style: TextStyle(
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 4,
  //                                   child: Center(
  //                                       child: Text(
  //                                     'Activity Quntity',
  //                                     style: TextStyle(
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 3,
  //                                   child: Center(
  //                                       child: Text(
  //                                     'Available',
  //                                     style: TextStyle(
  //                                         fontSize: 16,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                             ],
  //                           ),
  //                         ),
  //                         Divider(
  //                           thickness: 0.5,
  //                           color: ColorResource.colorDDDDDD,
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         Padding(
  //                           padding: EdgeInsets.all(5.0),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               Expanded(
  //                                   flex: 1,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "02-Mar",
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                     ),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 3,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "Other",
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                     ),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 4,
  //                                   child: Center(
  //                                       child: Text(
  //                                     "initited",
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                     ),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 4,
  //                                   child: Center(
  //                                       child: Text(
  //                                     '0',
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                     ),
  //                                   ))),
  //                               Expanded(
  //                                   flex: 3,
  //                                   child: Center(
  //                                       child: Text(
  //                                     '0',
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                     ),
  //                                   ))),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               TextButton(
  //                 child: const Text(
  //                   'Close',
  //                   style: TextStyle(
  //                     color: ColorResource.color0D5EF8,
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> productHistory(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Product History'),
          content: SizedBox(
            height: 700,
            width: 700,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15),
                const Divider(thickness: 0.5, color: Colors.grey),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 160,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: (term) {
                          // Handle search submission
                        },
                        onChanged: (value) {
                          // Handle search input changes
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search,
                              size: 20.0, color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 20),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Date",
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
                                    "Activity",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    "Activity Description",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    'Activity Quantity',
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
                                    'Available',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 0.5, color: Colors.grey),
                        SizedBox(height: 20),
                        // Example of an item in the history
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "02-Mar",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Other",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    "Initiated",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text(
                    'Close',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // Future<void> productHistory(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Text('Product History'),
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const SizedBox(height: 20),
  //             const Divider(
  //               thickness: 0.5,
  //               color: Colors.grey,
  //             ),
  //             const SizedBox(height: 20),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 SizedBox(
  //                   height: 35,
  //                   width: 160,
  //                   child: TextFormField(
  //                     keyboardType: TextInputType.text,
  //                     textInputAction: TextInputAction.search,
  //                     onFieldSubmitted: (term) {},
  //                     onChanged: (value) {},
  //                     decoration: InputDecoration(
  //                       suffixIcon: const Icon(Icons.search,
  //                           size: 20.0, color: Colors.grey),
  //                       contentPadding: const EdgeInsets.symmetric(
  //                           vertical: 7.0, horizontal: 20),
  //                       hintText: 'Search',
  //                       hintStyle:
  //                           const TextStyle(fontSize: 14.0, color: Colors.grey),
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(3.0),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 20),
  //             Expanded(
  //                 child: Container(
  //               margin: const EdgeInsets.only(left: 15, right: 7),
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //               ),
  //               child: const Column(
  //                 children: [
  //                   SizedBox(height: 10),
  //                   Padding(
  //                     padding: EdgeInsets.all(5.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Expanded(
  //                           flex: 1,
  //                           child: Center(
  //                             child: Text(
  //                               "Date",
  //                               style: TextStyle(
  //                                   fontSize: 16, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 3,
  //                           child: Center(
  //                             child: Text(
  //                               "Activity",
  //                               style: TextStyle(
  //                                   fontSize: 16, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 4,
  //                           child: Center(
  //                             child: Text(
  //                               "Activity Description",
  //                               style: TextStyle(
  //                                   fontSize: 16, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 4,
  //                           child: Center(
  //                             child: Text(
  //                               'Activity Quantity',
  //                               style: TextStyle(
  //                                   fontSize: 16, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 3,
  //                           child: Center(
  //                             child: Text(
  //                               'Available',
  //                               style: TextStyle(
  //                                   fontSize: 16, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Divider(
  //                     thickness: 0.5,
  //                     color: Colors.grey,
  //                   ),
  //                   SizedBox(height: 20),
  //                   Padding(
  //                     padding: EdgeInsets.all(5.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Expanded(
  //                           flex: 1,
  //                           child: Center(
  //                             child: Text(
  //                               "02-Mar",
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 3,
  //                           child: Center(
  //                             child: Text(
  //                               "Other",
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 4,
  //                           child: Center(
  //                             child: Text(
  //                               "initiated",
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 4,
  //                           child: Center(
  //                             child: Text(
  //                               '0',
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                         Expanded(
  //                           flex: 3,
  //                           child: Center(
  //                             child: Text(
  //                               '0',
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )),
  //           ],
  //         ),
  //         actions: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               TextButton(
  //                 child: const Text(
  //                   'Close',
  //                   style: TextStyle(
  //                     color: Colors.blue,
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
