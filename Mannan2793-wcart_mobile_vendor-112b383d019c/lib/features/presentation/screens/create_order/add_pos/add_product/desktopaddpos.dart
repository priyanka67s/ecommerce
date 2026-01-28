import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/features/data/model/viewcartpos_model.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/widgets/multi_dropdown_widgets.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/add_product/bloc/add_desk_top_pos_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/listwarehouseproduct.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/controller/poscontoller.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

import '../../../../../../model/all_category_list_model.dart';

class DesktopAddPos extends StatefulWidget {
  const DesktopAddPos({super.key});
  static const String routeName = '/desktop_payment';
  @override
  State<DesktopAddPos> createState() => _DesktopAddPosState();
}

class _DesktopAddPosState extends State<DesktopAddPos> {
  //! model classes
  SearchCustomersModel customerList = SearchCustomersModel();
  ActiveWareHouseModel activeWareHouseData = ActiveWareHouseModel();
  AllStoreProductInventoryModel storeProductInventoryData =
      AllStoreProductInventoryModel();
  List<AllInventories> viewProductList = [];
  AllCategoryListModel allCategoryData = AllCategoryListModel();
  ViewCartPosModel viewCartData = ViewCartPosModel();
  // List<String> selectedItems = [];

  //! dropdown controller
  MultiSelectController<String> warehouseController =
      MultiSelectController<String>();
  MultiSelectController<String> customerController =
      MultiSelectController<String>();
  MultiSelectController<String> categoryController =
      MultiSelectController<String>();

  TextEditingController warehouseTextEditingController =
      TextEditingController();
  ViewOrderPosController controller = Get.put(ViewOrderPosController());

  int counter = 1;
  String warehouseItemValue = 'Warehouse1';
  final _formKey = GlobalKey<FormState>();
  String? _barcode;
  late bool visible;

  TextEditingController searchText = TextEditingController();

  @override
  void initState() {
    initApiCall(context, searchQuery: '', controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDeskTopPosBloc, AddDeskTopPosState>(
      listener: (context, state) {
        if (state is FetchCustomerDataLoaded) {
          if (state.searchCustomersModel.status == "true") {
            customerList = state.searchCustomersModel;
            customerList.customers?.removeWhere((value) => value.phone == '');
          } else {
            showInfoSnackBar(state.searchCustomersModel.message!);
          }
        } else if (state is FetchCustomerDataFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is FetchActiveWarehouseLoaded) {
          if (state.activeWareHouseModel.status == "true") {
            activeWareHouseData = state.activeWareHouseModel;
            getInventoryProduct(
              context,
              warehouseId: activeWareHouseData.warehouseAddress![0].warehouseId
                  .toString(),
              categoryId: '',
            );
          } else {
            showInfoSnackBar(state.activeWareHouseModel.message!);
          }
        } else if (state is FetchActiveWarehouseFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is FetchStoreProductInventoryLoaded) {
          if (state.allStoreProductInventoryModel.status == "true") {
            storeProductInventoryData = state.allStoreProductInventoryModel;
            viewProductList =
                storeProductInventoryData.allInventories?.toSet().toList() ??
                    [];
          } else {
            showInfoSnackBar(state.allStoreProductInventoryModel.message!);
          }
        } else if (state is FetchStoreProductInventoryFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is FetchInventoryCategoryLoaded) {
          if (state.inventoryCategoryModel.status == "true") {
            allCategoryData = state.inventoryCategoryModel;
          } else {
            showInfoSnackBar(state.inventoryCategoryModel.message!);
          }
        } else if (state is FetchInventoryCategoryFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is SearchListener) {
          if (state.searchQuery.isEmpty) {
            storeProductInventoryData.allInventories = viewProductList;
          } else {
            var results =
                storeProductInventoryData.allInventories?.where((element) {
              return element.name!
                  .toLowerCase()
                  .contains(state.searchQuery.toLowerCase());
            }).toList();
            storeProductInventoryData.allInventories = results;
          }
        } else if (state is ViewCartPosLoaded) {
          if (state.viewCartPosModel.status == "true") {
            viewCartData = state.viewCartPosModel;
          } else {
            viewCartData = state.viewCartPosModel;
          }
        } else if (state is ViewCartPosFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is AddToPOSCartLoaded) {
          if (state.addToPOSCartModel['status'] == "true") {
            viewCart(
                context: context,
                warehouseId: state.addToPOSCartModel['warehouseId'],
                userId: state.addToPOSCartModel['userId']);
          }
        } else if (state is AddToPOSCartFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is RemoveCartPosLoaded) {
          if (state.removePosCartModel['status'] == "true") {
            viewCartData.cartproducts?.removeAt(
              int.parse(
                state.removePosCartModel['index'].toString(),
              ),
            );
            viewCart(
              context: context,
              warehouseId: state.removePosCartModel['warehouseId'],
              userId: state.removePosCartModel['userId'],
            );
          }
        } else if (state is RemoveCartPosFailure) {
          showInfoSnackBar(state.failureMessage);
        } else if (state is UpdateCartPosLoaded) {
          if (state.updatePosCartModel['status'] == "true") {
            viewCart(
              context: context,
              warehouseId: state.updatePosCartModel['warehouseId'],
              userId: state.updatePosCartModel['userId'],
            );
          } else {
            showInfoSnackBar(state.updatePosCartModel['message']);
          }
        } else if (state is UpdateCartPosFailure) {
          showInfoSnackBar(state.failureMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'Wcart POS',
              style: TextStyle(
                color: ColorResource.color252525,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  cartListWidgets(context),
                  SizedBox(
                    width: 20,
                  ),
                  listOfCategories(controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded listOfCategories(ViewOrderPosController controller) {
    return Expanded(
        flex: 4,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    // controller.allCategoryData.categories?.map((item) {
                    //       return DropdownMenuItem(
                    //         value: item.termId.toString(), // Use termId as value
                    //         child: Text(item.termName ?? ''), // Display termName
                    //       );
                    //     }).toList()
                    child: allCategoryData.categories != null
                        ? multiDropDownWidget(
                            items: [
                              DropdownItem(
                                value: '', // empty termId
                                label: 'All', // label All
                                selected: true,
                              ),
                              ...(allCategoryData.categories?.map((item) {
                                    return DropdownItem(
                                      value: item.termId.toString(),
                                      label: item.termName ?? '',
                                    );
                                  }).toList() ??
                                  []),
                            ],
                            controller: categoryController,
                            title: "Category",
                            onSelectionChange: (value) {
                              debugPrint('Selected: $value');
                              getInventoryProduct(
                                context,
                                warehouseId: (warehouseController
                                        .selectedItems.isNotEmpty
                                    ? warehouseController.selectedItems[0].value
                                    : ''),
                                categoryId:
                                    value.isEmpty ? '' : value[0].toString(),
                              );
                            },
                            singleSelect: true,
                          )
                        : multiDropDownWidget(
                            items: [],
                            title: "Category",
                            onSelectionChange: (value) {
                              debugPrint('Selected: $value');
                            },
                            singleSelect: true,
                          ),
                  ),
                  // Center(
                  //   // Add visiblity detector to handle barcode
                  //   // values only when widget is visible
                  //   child: VisibilityDetector(
                  //     onVisibilityChanged: (VisibilityInfo info) {
                  //       visible = info.visibleFraction > 0;
                  //     },
                  //     key: Key('visible-detector-key'),
                  //     child: BarcodeKeyboardListener(
                  //         bufferDuration: Duration(milliseconds: 200),
                  //         onBarcodeScanned: (barcode) {
                  //           if (!visible) return;
                  //           Text('Barcode');
                  //           print(barcode);
                  //           setState(() {
                  //             _barcode = barcode;
                  //             controller.barCodeAddToCart(
                  //                 productId: '',
                  //                 attribute: '',
                  //                 warehouseId: '',
                  //                 skucode: '',
                  //                 storeid: '',
                  //                 barcodeid: barcode);
                  //           });
                  //         },
                  //         child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: <Widget>[
                  //               Text(
                  //                 _barcode == null
                  //                     ? 'SCAN BARCODE'
                  //                     : 'BARCODE: $_barcode',
                  //               ),
                  //             ])),
                  //   ),
                  // )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe3e3e5))),
                height: 280,
                child: storeProductInventoryData.allInventories == null ||
                        storeProductInventoryData.allInventories?.length == 0
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/no_item_found.png',
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount:
                            storeProductInventoryData.allInventories?.length ??
                                0,
                        itemBuilder: (BuildContext ctx, index) {
                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                if (customerController
                                    .selectedItems.isNotEmpty) {
                                  addToCartPOS(
                                      productId: storeProductInventoryData
                                          .allInventories![index].productid
                                          .toString(),
                                      attribute: storeProductInventoryData
                                          .allInventories![index].variation
                                          .toString(),
                                      warehouseId: storeProductInventoryData
                                          .allInventories![index].warehouseId
                                          .toString(),
                                      skucode: storeProductInventoryData
                                          .allInventories![index].sku
                                          .toString(),
                                      storeid: storeProductInventoryData
                                          .allInventories![index]
                                          .storeLocationId
                                          .toString(),
                                      userId: customerController
                                          .selectedItems[0].value
                                          .toString());
                                  // controller.addToCart(
                                  //     productId: storeProductInventoryData
                                  //         .allInventories![index].productid
                                  //         .toString(),
                                  //     attribute: storeProductInventoryData
                                  //         .allInventories![index].variation
                                  //         .toString(),
                                  //     warehouseId: storeProductInventoryData
                                  //         .allInventories![index].warehouseId
                                  //         .toString(),
                                  //     skucode: storeProductInventoryData
                                  //         .allInventories![index].sku
                                  //         .toString(),
                                  //     storeid: storeProductInventoryData
                                  //         .allInventories![index]
                                  //         .storeLocationId
                                  //         .toString(),
                                  //     userId: customerController
                                  //         .selectedItems[0].value
                                  //         .toString());
                                } else {
                                  showWarningSnackBar(
                                    "Please select customer",
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      82,
                                      158,
                                      158,
                                      158,
                                    ),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(70, 227, 227, 229),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [                                    
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        child: CachedNetworkImage(
                                            height: 70.0,
                                            width: 70.0,
                                            imageUrl:
                                                '${storeProductInventoryData.allInventories![index].imageUrl}${storeProductInventoryData.allInventories![index].image}',
                                            errorWidget: (context, url, error) {
                                              return CachedNetworkImage(
                                                imageUrl:
                                                    "https://wcartnode.webnexs.org/assets/default.png",
                                                height: 70.0,
                                                width: 70.0,
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const Icon(
                                                    Icons.error,
                                                    size: 70.0,
                                                  );
                                                },
                                              );
                                            }),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          storeProductInventoryData
                                                  .allInventories![index]
                                                  .name ??
                                              "",
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            height: 2,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            ),
          ],
        ));
  }

  Widget cartListWidgets(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 3,
      child: Container(
        color: Colors.white,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: SizedBox(
                    height: 40,
                    child: activeWareHouseData.warehouseAddress != null
                        ? multiDropDownWidget(
                            items: activeWareHouseData.warehouseAddress
                                    ?.map((item) {
                                  final value =
                                      item.locationTitle?.toLowerCase() ?? '';
                                  debugPrint(item.warehouseId.toString());
                                  return DropdownItem<String>(
                                    value: item.warehouseId.toString(),
                                    label: value,
                                    selected: item.warehouseId.toString() ==
                                            activeWareHouseData
                                                .warehouseAddress![0]
                                                .warehouseId
                                                .toString()
                                        ? true
                                        : false,
                                  );
                                }).toList() ??
                                [],
                            controller: warehouseController,
                            title: "warehouse",
                            onSelectionChange: (value) {
                              getInventoryProduct(
                                context,
                                warehouseId: value[0].toString(),
                                categoryId:
                                    (categoryController.selectedItems.isEmpty
                                        ? ''
                                        : categoryController
                                            .selectedItems[0].value),
                              );
                            },
                            singleSelect: true,
                          )
                        : multiDropDownWidget(
                            items: [],
                            title: "Warehouse",
                            onSelectionChange: (value) {
                              debugPrint('Selected: $value');
                            },
                            singleSelect: true,
                          ),
                  ),
                ),
                // if (controller.customerList.customers != null)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        flex: 10,
                        child: SizedBox(
                          height: 40,
                          //  controller.customerList.customers
                          child: customerList.customers != null
                              ? multiDropDownWidget(
                                  items: customerList.customers
                                          ?.map((item) {
                                            final value = item.name ?? '';
                                            debugPrint(value);
                                            return DropdownItem<String>(
                                              value: item.id.toString(),
                                              label: value.toString() == ''
                                                  ? 'Undefined Customer'
                                                  : value,
                                            );
                                          })
                                          .toSet()
                                          .toList() ??
                                      [],
                                  controller: customerController,
                                  title: "Customer",
                                  onSelectionChange: (value) {
                                    debugPrint('Selected: $value');
                                    viewCart(
                                      context: context,
                                      warehouseId: warehouseController
                                          .selectedItems[0].value,
                                      userId: value[0],
                                    );
                                  },
                                  singleSelect: true,
                                )
                              : multiDropDownWidget(
                                  items: [],
                                  title: "Customer",
                                  onSelectionChange: (value) {
                                    debugPrint('Selected: $value');
                                  },
                                  singleSelect: true,
                                ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(102, 158, 158, 158),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 40,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                addCustomer();
                              },
                              child: const Icon(
                                Icons.person_add,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: searchText,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (term) {},
                      onChanged: (value) {
                        context.read<AddDeskTopPosBloc>().add(
                              SearchListenerEvent(searchQuery: value),
                            );
                      },
                      decoration: InputDecoration(
                        suffixIcon: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              addProduct();
                            },
                            child: const Icon(Icons.add_box_rounded,
                                size: 20.0, color: Colors.black),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 20),
                        hintText: 'Search the product by name',
                        hintStyle: const TextStyle(
                          fontSize: 14.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(102, 158, 158, 158),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 82, 83, 83),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    height: 30,
                    child: const Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Center(
                              child: Text(
                                "Product",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text("Price",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 4,
                            child: Center(
                                child: Text("Qty",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text("Subtotal",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 16,
                            )))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.33,
              child: viewCartData.cartproducts == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/empty_cart.png",
                            height: size.height * 0.19,
                            width: 200,
                          ),
                          Text(
                            'Empty Cart',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 30,
                                margin: EdgeInsets.only(bottom: 10),
                                color: const Color.fromARGB(255, 253, 251, 251),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          viewCartData
                                                  .cartproducts?[index].name ??
                                              '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          viewCartData
                                              .cartproducts![index].price
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                  color: Color.fromARGB(
                                                      255, 82, 83, 83),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 5.0),
                                                iconSize: 18.0,
                                                color: Colors.black,
                                                onPressed: () {
                                                  if (viewCartData
                                                          .cartproducts![index]
                                                          .quantity >
                                                      1) {
                                                    final quantity =
                                                        viewCartData
                                                                .cartproducts![
                                                                    index]
                                                                .quantity -
                                                            1;
                                                    updateCart(
                                                      context: context,
                                                      cartId: viewCartData
                                                          .cartproducts![index]
                                                          .cartId
                                                          .toString(),
                                                      quantity:
                                                          quantity.toString(),
                                                      warehouseId:
                                                          warehouseController
                                                              .selectedItems[0]
                                                              .value,
                                                      userId: customerController
                                                          .selectedItems[0]
                                                          .value
                                                          .toString(),
                                                    );
                                                  }
                                                }),
                                            Text(
                                              '${viewCartData.cartproducts![index].quantity}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.add,
                                                color: Color.fromARGB(
                                                    255, 82, 83, 83),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 5.0),
                                              iconSize: 18.0,
                                              color: Colors.black,
                                              onPressed: () {
                                                final quantity = viewCartData
                                                        .cartproducts![index]
                                                        .quantity +
                                                    1;
                                                updateCart(
                                                  context: context,
                                                  cartId: viewCartData
                                                      .cartproducts![index]
                                                      .cartId
                                                      .toString(),
                                                  quantity: quantity.toString(),
                                                  warehouseId:
                                                      warehouseController
                                                          .selectedItems[0]
                                                          .value,
                                                  userId: customerController
                                                      .selectedItems[0].value
                                                      .toString(),
                                                );
                                              },
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                            '${viewCartData.cartproducts![index].producttotal}'),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            removeCart(
                                              cartId: viewCartData
                                                  .cartproducts![index].cartId
                                                  .toString(),
                                              index: index,
                                              warehouseId: warehouseController
                                                  .selectedItems[0].value,
                                              userId: customerController
                                                  .selectedItems[0].value
                                                  .toString(),
                                            );
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Center(
                                              child: Icon(
                                                Icons.close,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: viewCartData.cartproducts?.length ?? 0,
                          ),
                        ],
                      ),
                    ),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }

//!Bottom Bar
  Column bottomBar() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Items"),
                  Text(viewCartData.cartCount?.toString() ?? "0",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total"),
                  // if (controller.viewCartData.pricedata !=
                  //     null)
                  Text(
                    viewCartData.pricedata?[0].carttotal ?? "0",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Order Tax"),
                  Text(
                    viewCartData.pricedata?[0].taxvalue ?? "0.00",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount"),
                  Text("0.00", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 108, 108, 108),
                  borderRadius: BorderRadius.circular(3),
                ),
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Payable",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        viewCartData.pricedata?[0].carttotal ?? "0",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (() {
                    // controller.guestId();
                    print(
                      viewCartData.cartCount.toString(),
                    );

                    if (_formKey.currentState!.validate() &&
                        viewCartData.cartCount != null &&
                        viewCartData.cartCount != 0) {
                      Get.toNamed(Routes.paymentPage, arguments: {
                        "userId": customerController.selectedItems[0].value
                            .toString(),
                        'totalAmount': viewCartData.pricedata?[0].carttotal ??
                            "".toString(),
                        'itemCount': viewCartData.cartCount.toString(),
                        'warehouseId':
                            warehouseController.selectedItems[0].value,
                        'customerId': customerController.selectedItems[0].value,
                        'assigned_location_id':
                            viewProductList[0].storeLocationId
                            .toString(),
                      });
                      // Form is valid, proceed with further actions
                    }
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0XFF5cb85c),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text("Order",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      _showMyDialog();
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFd9534f),
                          width: 1.0,
                        ),
                        color: const Color.fromARGB(255, 246, 244, 244),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Center(
                        child: Text("Cancel",
                            style: TextStyle(fontSize: 15, color: Colors.red)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Message'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to remove this items?'),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    controller.clearCart(
                      userId:
                          customerController.selectedItems[0].value.toString(),
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

  Future<void> addProduct() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ADD PRODUCT MANUALLY',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 500, // Adjust the height as needed
            width: 600, // Adjust the width as needed
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Divider(thickness: .5, color: Colors.grey),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 7),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Product Code *'),
                            SizedBox(
                              width: 400,
                              height: 45,
                              child: CustomTextField(
                                "",
                                controller.productCode,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Product Name *'),
                            SizedBox(
                              height: 45,
                              width: 400,
                              child: CustomTextField(
                                "",
                                controller.productName,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Product Tax *'),
                            SizedBox(
                              width: 400,
                              height: 45,
                              child: CustomDropdownButton(
                                dropdownItems: controller.productTaxList,
                                hint: 'select',
                                value: controller.productTaxValueList,
                                onChanged: (val, key) {
                                  setState(() {
                                    controller.productTaxValueList = val;
                                  });
                                  print(val);
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Quantity *'),
                            SizedBox(
                              width: 400,
                              height: 45,
                              child: CustomTextField(
                                "",
                                controller.quantity,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Product Discount *'),
                            SizedBox(
                              height: 45,
                              width: 400,
                              child: CustomTextField(
                                "",
                                controller.productDiscount,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Unit Price *'),
                            SizedBox(
                              height: 45,
                              width: 400,
                              child: CustomTextField(
                                "",
                                controller.unitPrice,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 0.5, color: Colors.grey),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: ColorResource.color0D5EF8,
                  height: 50,
                  width: 100,
                  child: TextButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> addCustomer() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Text(
                'ADD CUSTOMER',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 500, // Adjust the height as needed
            width: 700, // Adjust the width as needed
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 7),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.name,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Phone *",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child:
                                        // TextFormField(
                                        //   controller: controller.mobile,
                                        //   keyboardType: TextInputType.number,
                                        //   decoration: InputDecoration(
                                        //     labelText: 'Phone Number',
                                        //   ),
                                        //   // Validator to check phone number
                                        //   validator: (value) {
                                        //     if (value == null || value.isEmpty) {
                                        //       return 'Please enter your phone number';
                                        //     }
                                        //     // Basic RegExp to check if phone number is valid
                                        //     String pattern = r'^[0-9]{10}$';
                                        //     RegExp regex = RegExp(pattern);
                                        //     if (!regex.hasMatch(value)) {
                                        //       return 'Enter a valid 10-digit phone number';
                                        //     }
                                        //     return null;
                                        //   },
                                        // ),

                                        CustomTextField(
                                      "",
                                      controller.mobile,
                                      validationRules: const ['mobile_number'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Expanded(
                            //   flex: 12,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const Text(
                            //         "Country",
                            //         style: TextStyle(
                            //             color: Colors.black,
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       const SizedBox(
                            //         height: 10,
                            //       ),
                            //       SizedBox(
                            //         height: 45,
                            //         child: CustomTextField(
                            //           "",
                            //           controller.productCode,
                            //           validationRules: const ['required'],
                            //           validatorCallBack: (val) {
                            //             print(val);
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.email,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Country",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.country,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.address,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: CustomTextField(
                                      "",
                                      controller.city,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "VAT Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.vatNumber,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "GST Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: CustomTextField(
                                      "",
                                      controller.gstNumber,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // const SizedBox(height: 10),
                        // const Divider(thickness: 0.5, color: Colors.grey),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: ColorResource.color0D5EF8,
                  height: 50,
                  width: 100,
                  child: TextButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Phone number is valid')),
                        );
                      }
                      controller.addCustomer();
                      // Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void viewCart({
    required BuildContext context,
    required String warehouseId,
    required String userId,
  }) {
    context.read<AddDeskTopPosBloc>().add(
          ViewCartEvent(
            warehouseId: warehouseId,
            userId: userId,
          ),
        );
  }

  addToCartPOS(
      {required String productId,
      required String attribute,
      required String warehouseId,
      required String skucode,
      required String storeid,
      required String userId}) async {
    context.read<AddDeskTopPosBloc>().add(
          AddToCartPOSEvent(
            productId: productId,
            attribute: attribute,
            warehouseId: warehouseId,
            skucode: skucode,
            storeid: storeid,
            userId: userId,
          ),
        );
  }

  void removeCart({
    required String cartId,
    required int index,
    required String warehouseId,
    required String userId,
  }) {
    context.read<AddDeskTopPosBloc>().add(
          RemoveCartEvent(
            cartId: cartId,
            index: index,
            warehouseId: warehouseId,
            userId: userId,
          ),
        );
  }

  void updateCart({
    required BuildContext context,
    required String cartId,
    required String quantity,
    required String warehouseId,
    required String userId,
  }) {
    context.read<AddDeskTopPosBloc>().add(UpdateCartEvent(
        quantity: quantity,
        cartId: cartId,
        warehouseId: warehouseId,
        userId: userId));
  }
}

void getInventoryProduct(BuildContext context,
    {required String warehouseId, required String categoryId}) {
  debugPrint('Selected: $warehouseId');
  context.read<AddDeskTopPosBloc>().add(
        FetchStoreProductInventoryEvent(
          warehouseId: warehouseId,
          categoryId: categoryId,
        ),
      );
}

void initApiCall(
  BuildContext context,
  ViewOrderPosController controller, {
  required String searchQuery,
}) {
  context.read<AddDeskTopPosBloc>().add(
        FetchCustomerDataEvent(
          searchQuery: searchQuery,
        ),
      );
  context.read<AddDeskTopPosBloc>().add(
        FetchActiveWarehouseEvent(),
      );
  context.read<AddDeskTopPosBloc>().add(
        FetchInventoryCategoryEvent(),
      );
}
