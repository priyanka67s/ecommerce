import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/bloc/view_product_inventory_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ListWarehouseProductListPage extends StatefulWidget {
  const ListWarehouseProductListPage({super.key});

  @override
  State<ListWarehouseProductListPage> createState() =>
      _ListWarehouseProductListPageState();
}

class FilterModel {
  String value;
  String title;

  FilterModel(this.value, this.title);
}

class _ListWarehouseProductListPageState
    extends State<ListWarehouseProductListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<AllInventories> _allInventory = [];
  List<AllInventories> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<AllInventories> get _filteredProducts {
    List<AllInventories> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allInventory;
    } else {
      filtered = _allInventory
          .where((inventory) =>
              inventory.name?.toLowerCase().contains(_searchText) ?? false)
          .toList();
    }

    // Apply sorting if enabled
    if (_isNameSortingEnabled) {
      filtered.sort((a, b) {
        String nameA = a.name?.toLowerCase() ?? '';
        String nameB = b.name?.toLowerCase() ?? '';
        if (_isNameSortedAscending) {
          return nameA.compareTo(nameB);
        } else {
          return nameB.compareTo(nameA);
        }
      });
    }

    return filtered;
  }

  void _toggleNameSorting() {
    setState(() {
      if (_isNameSortingEnabled) {
        _isNameSortedAscending = !_isNameSortedAscending;
      } else {
        _isNameSortingEnabled = true;
        _isNameSortedAscending = true;
      }
      _currentPage = 1; // Reset to first page when sorting
    });
  }

  int get _totalPages => (_filteredProducts.length / _itemsPerPage).ceil();
  ViewInventoryModel viewInventoryData = ViewInventoryModel();
  @override
  void initState() {
    getInventoryProductData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewProductInventoryBloc, ViewProductInventoryState>(
      listener: (context, state) {
        if (state is ViewProductInventoryLoaded) {
          viewInventoryData = state.viewInventoryModel;
          _allInventory = state.viewInventoryModel.allInventories ?? [];
          _currentPage = 1; // Reset to first page when data is loaded
        } else if (state is ViewProductInventoryFailure) {
          showInfoSnackBar(state.failureMessage);
        }
      },
      builder: (context, state) {
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
                        titleText: "Inventory",
                        onBackButtonPressed: () {
                          getInventoryProductData(context);
                        },
                        showAction: true,
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Product List",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 35,
                                          child: TextField(
                                            controller: _searchController,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  _searchText =
                                                      value.toLowerCase();
                                                  _currentPage =
                                                      1; // Reset page on new search
                                                },
                                              );
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              hintStyle: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffffbbbbbb),
                                              ),
                                              hintText: "Search",
                                              // suffixIcon: IconButton(
                                              //   onPressed: () {},
                                              //   icon: Icon(
                                              //     Icons.search,
                                              //   ),
                                              // ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const Divider(
                                //   thickness: 0.5,
                                //   color: ColorResource.colorDDDDDD,
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.all(5.0),
                                //   child: Container(
                                //     color: const Color.fromARGB(0, 176, 197, 208),
                                //     child: Padding(
                                //       padding: const EdgeInsets.fromLTRB(
                                //         0,
                                //         10,
                                //         30,
                                //         20,
                                //       ),
                                //       child: Row(
                                //         children: [
                                //           const SizedBox(
                                //             width: 5,
                                //           ),
                                //           SizedBox(
                                //             width: 150,
                                //             height: 40,
                                //             child: CustomDropdownButton(
                                //               hint: 'Filter',
                                //               dropdownWidth:
                                //                   MediaQuery.of(context)
                                //                           .size
                                //                           .width /
                                //                       9,
                                //               offset: const Offset(0, -10),
                                //               value: controller
                                //                       .selectedFilterCategory
                                //                       .value
                                //                       .isEmpty
                                //                   ? null
                                //                   : controller
                                //                       .selectedFilterCategory
                                //                       .value,
                                //               dropdownItems: [
                                //                 'Availability',
                                //                 'Product Type',
                                //               ],
                                //               onChanged: (selectedCategory, key) {
                                //                 if (selectedCategory != null) {
                                //                   controller
                                //                       .selectedFilterCategory
                                //                       .value = selectedCategory;

                                //                   // Determine the filter options based on selection
                                //                   List<FilterModel> filterOptions;
                                //                   switch (selectedCategory) {
                                //                     case 'Availability':
                                //                       filterOptions =
                                //                           availableFilter;
                                //                       break;
                                //                     case 'Product Type':
                                //                       filterOptions =
                                //                           productTypeFilterBy;
                                //                       break;
                                //                     default:
                                //                       filterOptions = [];
                                //                   }

                                //                   // Show another dropdown for filtering options
                                //                   showDialog(
                                //                     context: context,
                                //                     builder: (context) {
                                //                       return AlertDialog(
                                //                         backgroundColor:
                                //                             Colors.white,
                                //                         title: Text(
                                //                             'Filter by $selectedCategory'),
                                //                         content: SizedBox(
                                //                           height: 40,
                                //                           width: 400,
                                //                           child:
                                //                               CustomDropdownButton(
                                //                             hint: 'Select Filter',
                                //                             value: null,
                                //                             dropdownItems:
                                //                                 filterOptions
                                //                                     .map((f) =>
                                //                                         f.title)
                                //                                     .toList(),
                                //                             onChanged:
                                //                                 (selectedFilter,
                                //                                     key) async {
                                //                               final filter = filterOptions
                                //                                   .firstWhere((f) =>
                                //                                       f.title ==
                                //                                       selectedFilter);
                                //                               await controller
                                //                                   .viewInventory(
                                //                                 filter: filter
                                //                                     .value
                                //                                     .split(
                                //                                         ',')[0],
                                //                                 filterby: filter
                                //                                     .value
                                //                                     .split(
                                //                                         ',')[1],
                                //                               );
                                //                               Navigator.pop(
                                //                                   context); // Close the dialog after selection
                                //                             },
                                //                           ),
                                //                         ),
                                //                       );
                                //                     },
                                //                   );
                                //                 }
                                //               },
                                //             ),
                                //           ),
                                //           const SizedBox(
                                //             width: 5,
                                //           ),
                                //           SizedBox(
                                //             width: 150,
                                //             height: 40,
                                //             child: CustomDropdownButton(
                                //               hint: 'Sort',
                                //               dropdownWidth:
                                //                   MediaQuery.of(context)
                                //                           .size
                                //                           .width /
                                //                       9,
                                //               offset: const Offset(0, -10),
                                //               value: controller
                                //                       .selectedSortCategory
                                //                       .value
                                //                       .isEmpty
                                //                   ? null
                                //                   : controller
                                //                       .selectedSortCategory.value,
                                //               dropdownItems: [
                                //                 'Product Title',
                                //                 'Product SKU',
                                //                 'Availability'
                                //               ],
                                //               onChanged: (selectedCategory, key) {
                                //                 if (selectedCategory != null) {
                                //                   controller.selectedSortCategory
                                //                       .value = selectedCategory;

                                //                   // Map selected category to corresponding filters
                                //                   List<FilterModel> filterOptions;
                                //                   switch (selectedCategory) {
                                //                     case 'Product Title':
                                //                       filterOptions =
                                //                           productTitleFilterBy;
                                //                       break;
                                //                     case 'Product SKU':
                                //                       filterOptions =
                                //                           productSkuFilterBy;
                                //                       break;
                                //                     case 'Availability':
                                //                       filterOptions =
                                //                           availabilityFilterBy;
                                //                       break;
                                //                     default:
                                //                       filterOptions = [];
                                //                   }

                                //                   // Show another dropdown for sorting options
                                //                   showDialog(
                                //                     context: context,
                                //                     builder: (context) {
                                //                       return AlertDialog(
                                //                         backgroundColor:
                                //                             Colors.white,
                                //                         title: Text(
                                //                             'Sort by $selectedCategory'),
                                //                         content: SizedBox(
                                //                           height: 40,
                                //                           width: 400,
                                //                           child:
                                //                               CustomDropdownButton(
                                //                             hint: 'Select Order',
                                //                             value: null,
                                //                             dropdownItems:
                                //                                 filterOptions
                                //                                     .map((f) =>
                                //                                         f.title)
                                //                                     .toList(),
                                //                             onChanged:
                                //                                 (selectedFilter,
                                //                                     key) async {
                                //                               final filter = filterOptions
                                //                                   .firstWhere((f) =>
                                //                                       f.title ==
                                //                                       selectedFilter);
                                //                               await controller.viewInventory(
                                //                                   order: filter
                                //                                       .value
                                //                                       .split(
                                //                                           ',')[0],
                                //                                   orderby: filter
                                //                                       .value
                                //                                       .split(
                                //                                           ',')[1]);
                                //                               Navigator.pop(
                                //                                   context); // Close the dialog after selection
                                //                             },
                                //                           ),
                                //                         ),
                                //                       );
                                //                     },
                                //                   );
                                //                 }
                                //               },
                                //             ),
                                //           ),
                                //           const SizedBox(
                                //             width: 5,
                                //           ),
                                //           const SizedBox(
                                //             width: 5,
                                //           ),
                                //           SizedBox(
                                //             width: 150,
                                //             height: 40,
                                //             child: CustomDropdownButton(
                                //               hint: 'All Locations',
                                //               dropdownHeight: 200,
                                //               dropdownWidth:
                                //                   MediaQuery.of(context)
                                //                           .size
                                //                           .width /
                                //                       9,
                                //               offset: const Offset(0, -10),
                                //               value: controller.storeDropDownValue
                                //                       .value.isEmpty
                                //                   ? null
                                //                   : (controller.activeStoreData
                                //                           .activeStoreLocations!
                                //                           .map((item) => item
                                //                               .locationTitle
                                //                               .toString())
                                //                           .contains(controller
                                //                               .storeDropDownValue
                                //                               .value)
                                //                       ? controller
                                //                           .storeDropDownValue
                                //                           .value
                                //                       : null), // Ensure value exists in the list
                                //               dropdownItems: controller
                                //                   .activeStoreData
                                //                   .activeStoreLocations!
                                //                   .map((item) => item
                                //                       .locationTitle
                                //                       .toString())
                                //                   .toSet() // Remove duplicates
                                //                   .toList(),
                                //               onChanged: (newVal, key) {
                                //                 if (newVal != null) {
                                //                   controller
                                //                       .updateStoreDropDownValue(
                                //                           newVal);
                                //                 }
                                //               },
                                //             ),
                                //           ),
                                //           const SizedBox(
                                //             width: 5,
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'S.No',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "SKU",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          "Product Name",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Price",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Incoming',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Committed',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Available",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      // Expanded(
                                      //     flex: 2,
                                      //     child: Text(
                                      //       "Actions",
                                      //     textAlign: TextAlign.center,
                                      //       style: TextStyle(
                                      //           fontSize: 14,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      // )
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
                                    itemCount: _paginatedItems.length == 0
                                        ? 10
                                        : _paginatedItems.length,
                                    itemBuilder: (context, i) {                                      
                                      return state
                                              is ViewProductInventoryLoading
                                          ? shimmerWidgets()
                                          : viewInventoryData.allInventories !=
                                                      null &&
                                                  _paginatedItems.isNotEmpty
                                              ? dataWidgets(i)
                                              : Container();
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Wrap(
                                        spacing: 5,
                                        children: [
                                          paginationBorderWidget(
                                            child: IconButton(
                                              icon: Icon(Icons.first_page),
                                              onPressed: _currentPage > 1
                                                  ? () => setState(
                                                      () => _currentPage = 1)
                                                  : null,
                                              padding: EdgeInsets.all(0),
                                              iconSize: 18,
                                            ),
                                          ),
                                          paginationBorderWidget(
                                            child: IconButton(
                                              icon: Icon(Icons.chevron_left),
                                              onPressed: _currentPage > 1
                                                  ? () => setState(
                                                      () => _currentPage--)
                                                  : null,
                                              padding: EdgeInsets.all(0),
                                              iconSize: 18,
                                            ),
                                          ),
                                          ...List.generate(_totalPages,
                                              (index) {
                                            final pageNumber = index + 1;
                                            return GestureDetector(
                                              onTap: () => setState(() =>
                                                  _currentPage = pageNumber),
                                              child: paginationBorderWidget(
                                                  child: Center(
                                                child: Text(
                                                  "$pageNumber",
                                                  style: TextStyle(
                                                    color: _currentPage ==
                                                            pageNumber
                                                        ? Colors.blue
                                                        : Colors.black,
                                                  ),
                                                ),
                                              )
                                                  // TextButton(
                                                  //   onPressed: () => setState(() =>
                                                  //       _currentPage = pageNumber),
                                                  //   style: TextButton.styleFrom(
                                                  //     backgroundColor:
                                                  //         _currentPage == pageNumber
                                                  //             ? Colors.blue
                                                  //             : Colors.transparent,
                                                  //   ),
                                                  //   child: Text(
                                                  //     "$pageNumber",
                                                  //     style: TextStyle(
                                                  //       color:
                                                  //           _currentPage == pageNumber
                                                  //               ? Colors.white
                                                  //               : Colors.black,
                                                  //     ),
                                                  //   ),

                                                  // ),
                                                  ),
                                            );
                                          }),
                                          paginationBorderWidget(
                                            child: IconButton(
                                              icon: Icon(Icons.chevron_right),
                                              onPressed:
                                                  _currentPage < _totalPages
                                                      ? () => setState(
                                                          () => _currentPage++)
                                                      : null,
                                              padding: EdgeInsets.all(0),
                                              iconSize: 18,
                                            ),
                                          ),
                                          paginationBorderWidget(
                                            child: IconButton(
                                              icon: Icon(Icons.last_page),
                                              onPressed:
                                                  _currentPage < _totalPages
                                                      ? () => setState(() =>
                                                          _currentPage =
                                                              _totalPages)
                                                      : null,
                                              padding: EdgeInsets.all(0),
                                              iconSize: 18,
                                            ),
                                          ),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }

//! shimmer Layer
  Padding shimmerWidgets() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 20,
                width: 100,
                child: StartShimmer(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 20,
                width: 100,
                child: StartShimmer(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 20,
                width: 60,
                child: StartShimmer(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 20,
                width: 60,
                child: StartShimmer(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 20,
                width: 60,
                child: StartShimmer(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 20,
                width: 60,
                child: StartShimmer(),
              ),
            ),
          ),
          // Expanded(
          //     flex: 1,
          //     child: Align(
          //       alignment: Alignment.center,
          //       child: SizedBox(
          //         height: 20,
          //         width: 40,
          //         child: StartShimmer(),
          //       ),
          //     ))
        ],
      ),
    );
  }

//! data layer
  Widget dataWidgets(int index) {
    final inventory = _filteredProducts[index];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              inventory.sku != null && inventory.sku != ""
                  ? inventory.sku.toString()
                  : "undefined",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                inventory.name ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )),
          Expanded(
              flex: 1,
              child: Text(
                inventory.price.toString() != "null"
                    ? inventory.price.toString()
                    : "0",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )),
          Expanded(
              flex: 1,
              child: Text(
                inventory.incomingQuantity
                    .toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )),
          Expanded(
              flex: 1,
              child: Text(
                inventory.committedQuantity
                    .toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )),
          Expanded(
              flex: 1,
              child: Text(
              inventory.availableStock.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: GestureDetector(
          //     onTap: () {
          //       Get.toNamed(Routes.addInventoryDetails, arguments: {
          //         'store_id': controller
          //             .viewInventoryData.allInventories![i].productInventoryId,
          //         'skuCode':
          //             controller.viewInventoryData.allInventories![i].skuCode
          //       });
          //     },
          //     child: const Icon(
          //       Icons.remove_red_eye_rounded,
          //       color: Colors.grey,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

void getInventoryProductData(
  BuildContext context, {
  String? filter,
  String? filterBy,
  String? order,
  String? orderby,
  int? storeLocationId,
}) async {
  context.read<ViewProductInventoryBloc>().add(
        ViewProductInventoryDataEvent(
          filter: filter,
          filterBy: filterBy,
          order: order,
          orderby: orderby,
          storeLocationId: storeLocationId,
        ),
      );
}
