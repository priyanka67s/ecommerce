import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/controller/viewstoreproduct_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class ViewStoreProductListPage extends StatefulWidget {
  const ViewStoreProductListPage({super.key});

  @override
  State<ViewStoreProductListPage> createState() =>
      _ViewStoreProductListPageState();
}

class _ViewStoreProductListPageState extends State<ViewStoreProductListPage> {
  ViewStoreProductListController controller =
      Get.put(ViewStoreProductListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewStoreProductListController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              children: [
                CustomAppBar(
                  titleText: 'Store Settings',
                  onBackButtonPressed: () {},
                ),
                const SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(                                            
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                child: Text(
                                  '${'Product Name : '}${controller.viewStoreInventoryData.viewInventory?.name ?? ""}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: ColorResource.color000000,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PopupMenuButton<String>(
                                    elevation: 0,
                                    offset: Offset(0, 45),                                    
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorResource.color0D5EF8,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        height: 40,
                                        width: 170,
                                        child: const Center(
                                          child: Text(
                                            'Update Quantity',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    ColorResource.colorFEFFFF),
                                          ),
                                        )),
                                        
                                    onSelected: (String value) {
                                      print('Selected: $value');
                                    },
                                    
                                    itemBuilder: (BuildContext context) {
                                      return <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: 'option 1',
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,

                                            child: GestureDetector(
                                                onTap: () {
                                                  addQty();
                                                },
                                                child: SizedBox(
                                                    width: 100,
                                                    child: const Text(
                                                        'Increase'))),
                                          ),
                                        ),
                                        PopupMenuItem<String>(
                                          value: 'option 2',
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,

                                            child: GestureDetector(
                                                onTap: () {
                                                  decQty();
                                                },
                                                child: SizedBox(
                                                    width: 100,
                                                    child: const Text(
                                                        'Decrease'))),
                                          ),
                                        ),
                                      ];
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,

                                      child: GestureDetector(
                                        onTap: () {
                                          productHistory(context);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: ColorResource.color0D5EF8,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            width: 140,
                                            child: const Center(
                                              child: Text(
                                                'History',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorResource
                                                        .colorFEFFFF),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: .5,
                            color: ColorResource.colorDDDDDD,
                          ),                          
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Table(
                                          border: TableBorder.all(),
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            // HEADER ROW (visually merged two cells)
                                            TableRow(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300]),
                                              children: [
                                                TableCell(
                                                  // This cell spans both columns by using a Container with double width
                                                  // But still fills only the first column
                                                  child: Container(
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(8),
                                                    // Use MediaQuery or fixed width if needed, but here just center across
                                                    child: Text(
                                                      'Inventory Details',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Table(
                                          border: TableBorder.all(),
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: [
                                            // DATA ROWS (2 columns)
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text('Product SKU',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                              .viewStoreInventoryData
                                                              .viewInventory
                                                              ?.sku ??
                                                          "",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text(
                                                          'Product Name',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Text(
                                                  controller
                                                          .viewStoreInventoryData
                                                          .viewInventory
                                                          ?.name ??
                                                      "",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text(
                                                          'Warehouse Location',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Text(
                                                  controller
                                                          .viewStoreInventoryData
                                                          .viewInventory
                                                          ?.locationTitle ??
                                                      "",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text('Incoming',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                              .viewStoreInventoryData
                                                              .viewInventory
                                                              ?.incomingQuantity
                                                              .toString() ??
                                                          "",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text('Committed',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Text(
                                                  controller
                                                          .viewStoreInventoryData
                                                          .viewInventory
                                                          ?.committedQuantity
                                                          .toString() ??
                                                      "",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              TableCell(
                                                child: SizedBox(
                                                  height: 40,
                                                  child: Center(
                                                      child: Text('Available',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                              TableCell(
                                                child: Text(
                                                  controller
                                                          .viewStoreInventoryData
                                                          .viewInventory
                                                          ?.availableStock
                                                          .toString() ??
                                                      "",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    )),
                                    Expanded(child: SizedBox())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
                    print('muthuvel');
                    controller.increaseStoreInventory(
                      controller.viewStoreInventoryData.viewInventory?.sku ??
                          '',
                      controller.viewStoreInventoryData.viewInventory!
                          .storeInventoryId
                          .toString(),                      
                    )
                        .then((onValue) {
                      if (onValue) {
                        Navigator.of(context).pop();
                      }
                    });
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
                    controller
                        .decreaseStoreInventory(
                      controller.viewStoreInventoryData.viewInventory?.sku ??
                          '',
                      controller.viewStoreInventoryData.viewInventory!
                          .storeInventoryId
                          .toString(),
                    )
                        .then(
                      (onValue) {
                        if (onValue) {
                          Navigator.of(context).pop();
                        }
                      },
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

  // Future<void> productHistory() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white, // Set background color to white
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
  //                 color: Colors.grey,
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
  //                             size: 20.0, color: Colors.grey),
  //                         contentPadding: const EdgeInsets.symmetric(
  //                             vertical: 7.0, horizontal: 20),
  //                         hintText: 'Search',
  //                         hintStyle: const TextStyle(
  //                             fontSize: 14.0, color: Colors.grey),
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
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //                     ),
  //                     child: SingleChildScrollView(
  //                       child: Column(
  //                         children: [
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           const Padding(
  //                             padding: EdgeInsets.all(5.0),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 Expanded(
  //                                     flex: 1,
  //                                     child: Center(
  //                                         child: Text(
  //                                       "Date",
  //                                       style: TextStyle(
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     ))),
  //                                 Expanded(
  //                                     flex: 3,
  //                                     child: Center(
  //                                         child: Text(
  //                                       "Activity",
  //                                       style: TextStyle(
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     ))),
  //                                 Expanded(
  //                                     flex: 4,
  //                                     child: Center(
  //                                         child: Text(
  //                                       "Activity Description",
  //                                       style: TextStyle(
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     ))),
  //                                 Expanded(
  //                                     flex: 4,
  //                                     child: Center(
  //                                         child: Text(
  //                                       'Activity Quntity',
  //                                       style: TextStyle(
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     ))),
  //                                 Expanded(
  //                                     flex: 3,
  //                                     child: Center(
  //                                         child: Text(
  //                                       'Available',
  //                                       style: TextStyle(
  //                                           fontSize: 16,
  //                                           fontWeight: FontWeight.bold),
  //                                     ))),
  //                               ],
  //                             ),
  //                           ),
  //                           const Divider(
  //                             thickness: 0.5,
  //                             color: Colors.grey,
  //                           ),
  //                           const SizedBox(
  //                             height: 20,
  //                           ),
  //                           Flexible(
  //                             child: SizedBox(
  //                               child: ListView.separated(
  //                                   shrinkWrap: true,
  //                                   physics:
  //                                       const NeverScrollableScrollPhysics(),
  //                                   separatorBuilder: (context, index) {
  //                                     return const Divider();
  //                                   },
  //                                   itemCount: controller.viewStoreInventoryData
  //                                           .inventoryHistory?.length ??
  //                                       0,
  //                                   itemBuilder: (context, i) {
  //                                     return Padding(
  //                                       padding: const EdgeInsets.all(5.0),
  //                                       child: Row(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceEvenly,
  //                                         children: [
  //                                           Expanded(
  //                                               flex: 3,
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 controller
  //                                                         .viewStoreInventoryData
  //                                                         .inventoryHistory?[i]
  //                                                         .storeInventoryHistoryId
  //                                                         .toString() ??
  //                                                     "",
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                 ),
  //                                               ))),
  //                                           Expanded(
  //                                               flex: 3,
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 controller
  //                                                         .viewStoreInventoryData
  //                                                         .inventoryHistory?[i]
  //                                                         .activityType
  //                                                         .toString() ??
  //                                                     "",
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                 ),
  //                                               ))),
  //                                           Expanded(
  //                                               flex: 3,
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 controller
  //                                                         .viewStoreInventoryData
  //                                                         .inventoryHistory?[i]
  //                                                         .activityDescription ??
  //                                                     "".toString(),
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                 ),
  //                                               ))),
  //                                           Expanded(
  //                                               flex: 3,
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 controller
  //                                                         .viewStoreInventoryData
  //                                                         .inventoryHistory?[i]
  //                                                         .activityQuantity
  //                                                         .toString() ??
  //                                                     "",
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                 ),
  //                                               ))),
  //                                           Expanded(
  //                                               flex: 3,
  //                                               child: Center(
  //                                                   child: Text(
  //                                                 controller
  //                                                         .viewStoreInventoryData
  //                                                         .inventoryHistory?[i]
  //                                                         .availableQuantity
  //                                                         .toString() ??
  //                                                     "",
  //                                                 style: const TextStyle(
  //                                                   fontSize: 14,
  //                                                 ),
  //                                               ))),
  //                                         ],
  //                                       ),
  //                                     );
  //                                   }),
  //                             ),
  //                           )
  //                         ],
  //                       ),
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
