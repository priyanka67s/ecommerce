import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/bloc/store_product_list_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import '../../widgets/toast/app_toast.dart';
import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ListStoreProductListPage extends StatefulWidget {
  const ListStoreProductListPage({super.key});

  @override
  State<ListStoreProductListPage> createState() =>
      _ListStoreProductListPageState();
}

class FilterModel {
  String value;
  String title;

  FilterModel(this.value, this.title);
}

class _ListStoreProductListPageState extends State<ListStoreProductListPage> {
  StoreBasedProductModel viewStoreInventoryData = StoreBasedProductModel();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<AllInventories> _allStoreProducts = [];
  List<AllInventories> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<AllInventories> get _filteredProducts {
    List<AllInventories> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allStoreProducts;
    } else {
      filtered = _allStoreProducts
          .where((storeProducts) =>
              storeProducts.name?.toLowerCase().contains(_searchText) ?? false)
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

  @override
  void initState() {
    viewStoreProductListData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreProductListBloc, StoreProductListState>(
      listener: (context, state) {
        if (state is StoreProductListLoaded) {
          viewStoreInventoryData = state.storeBasedProductModel;
          _allStoreProducts = state.storeBasedProductModel.allInventories ?? [];
          _currentPage = 1; // Reset to first page when data is loaded
        } else if (state is StoreProductListFailure) {
          showInfoSnackBar(state.message);
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
                        titleText: "Store Settings",
                        onBackButtonPressed: () {
                          viewStoreProductListData(context);
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Store Product List",
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
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(5.0),
                                //     child: Row(
                                //       children: [
                                //         const SizedBox(
                                //           width: 5,
                                //         ),
                                //         SizedBox(
                                //           width: 150,
                                //           height: 40,
                                //           child: CustomDropdownButton(
                                //             hint: 'Filter',
                                //             dropdownWidth: MediaQuery.of(context)
                                //                     .size
                                //                     .width /
                                //                 9,
                                //             offset: const Offset(0, -10),
                                //             value:
                                //                 controller.selectedFilterCategory ==
                                //                             null ||
                                //                         controller
                                //                             .selectedFilterCategory
                                //                             .value
                                //                             .isEmpty
                                //                     ? null
                                //                     : controller
                                //                         .selectedFilterCategory
                                //                         .value,
                                //             dropdownItems: [
                                //               'Availability',
                                //               'Product Type',
                                //             ],
                                //             onChanged: (selectedCategory, key) {
                                //               if (selectedCategory != null) {
                                //                 controller.selectedFilterCategory
                                //                     .value = selectedCategory;
                                //                 // Select appropriate filter options
                                //                 List<FilterModel> filterOptions;
                                //                 switch (selectedCategory) {
                                //                   case 'Availability':
                                //                     filterOptions =
                                //                         availableFilter;
                                //                     break;
                                //                   case 'Product Type':
                                //                     filterOptions =
                                //                         productTypeFilterBy;
                                //                     break;
                                //                   default:
                                //                     filterOptions = [];
                                //                 }

                                //                 // Show a dialog with a second dropdown inside
                                //                 showDialog(
                                //                   context: context,
                                //                   builder: (context) {
                                //                     return AlertDialog(
                                //                       backgroundColor:
                                //                           Colors.white,
                                //                       title: Text(
                                //                           'Filter by $selectedCategory'),
                                //                       content: SizedBox(
                                //                         height: 40,
                                //                         width: 400,
                                //                         child:
                                //                             CustomDropdownButton(
                                //                           hint: 'Select Filter',
                                //                           value: null,
                                //                           dropdownItems:
                                //                               filterOptions
                                //                                   .map((f) =>
                                //                                       f.title)
                                //                                   .toList(),
                                //                           onChanged:
                                //                               (selectedFilter,
                                //                                   key) async {
                                //                             final filter = filterOptions
                                //                                 .firstWhere((f) =>
                                //                                     f.title ==
                                //                                     selectedFilter);
                                //                             await controller
                                //                                 .viewStoreProductInventory(
                                //                               filter: filter.value
                                //                                   .split(',')[0],
                                //                               filterby: filter
                                //                                   .value
                                //                                   .split(',')[1],
                                //                             );
                                //                             Navigator.pop(
                                //                                 context); // Close dialog
                                //                           },
                                //                         ),
                                //                       ),
                                //                     );
                                //                   },
                                //                 );
                                //               }
                                //             },
                                //           ),
                                //         ),
                                //         const SizedBox(
                                //           width: 5,
                                //         ),
                                //         SizedBox(
                                //           width: 150,
                                //           height: 40,
                                //           child: CustomDropdownButton(
                                //             hint: 'Sort',
                                //             dropdownWidth: MediaQuery.of(context)
                                //                     .size
                                //                     .width /
                                //                 9,
                                //             offset: const Offset(0, -10),
                                //             value: controller.selectedSortCategory
                                //                     .value.isEmpty
                                //                 ? null
                                //                 : controller
                                //                     .selectedSortCategory.value,
                                //             dropdownItems: [
                                //               'Product Title',
                                //               'Product SKU',
                                //               'Availability',
                                //             ],
                                //             onChanged:
                                //                 (selectedSortCategory, key) {
                                //               if (selectedSortCategory != null) {
                                //                 controller.selectedSortCategory
                                //                     .value = selectedSortCategory;

                                //                 // Choose filter list based on selection
                                //                 List<FilterModel> sortOptions;
                                //                 switch (selectedSortCategory) {
                                //                   case 'Product Title':
                                //                     sortOptions =
                                //                         productTitleFilterBy;
                                //                     break;
                                //                   case 'Product SKU':
                                //                     sortOptions =
                                //                         productSkuFilterBy;
                                //                     break;
                                //                   case 'Availability':
                                //                     sortOptions =
                                //                         availabilityFilterBy;
                                //                     break;
                                //                   default:
                                //                     sortOptions = [];
                                //                 }
                                //                 // Show second dropdown in dialog
                                //                 showDialog(
                                //                   context: context,
                                //                   builder: (context) {
                                //                     return AlertDialog(
                                //                       backgroundColor:
                                //                           Colors.white,
                                //                       title: Text(
                                //                           'Sort by $selectedSortCategory'),
                                //                       content: SizedBox(
                                //                         height: 40,
                                //                         width: 400,
                                //                         child:
                                //                             CustomDropdownButton(
                                //                           hint: 'Select Option',
                                //                           value: null,
                                //                           dropdownItems:
                                //                               sortOptions
                                //                                   .map((f) =>
                                //                                       f.title)
                                //                                   .toList(),
                                //                           onChanged:
                                //                               (selectedSortOption,
                                //                                   key) async {
                                //                             final selected =
                                //                                 sortOptions
                                //                                     .firstWhere(
                                //                               (f) =>
                                //                                   f.title ==
                                //                                   selectedSortOption,
                                //                             );
                                //                             final values =
                                //                                 selected.value
                                //                                     .split(',');
                                //                             await controller
                                //                                 .viewStoreProductInventory(
                                //                               order: values[0],
                                //                               orderby: values[1],
                                //                             );
                                //                             Navigator.pop(
                                //                                 context);
                                //                           },
                                //                         ),
                                //                       ),
                                //                     );
                                //                   },
                                //                 );
                                //               }
                                //             },
                                //           ),
                                //         ),
                                //         const SizedBox(
                                //           width: 20,
                                //         ),
                                //         SizedBox(
                                //           width: 150,
                                //           height: 40,
                                //           child: CustomDropdownButton(
                                //             hint: 'All Locations',
                                //             dropdownHeight: 200,
                                //             dropdownWidth: MediaQuery.of(context)
                                //                     .size
                                //                     .width /
                                //                 9,
                                //             offset: const Offset(0, -10),
                                //             value: controller
                                //                         .activeStoreData.status !=
                                //                     null
                                //                 ? controller.activeStoreData
                                //                         .activeStoreLocations!
                                //                         .any((item) =>
                                //                             item.locationTitle ==
                                //                             controller
                                //                                 .storeLocationDropDownValue)
                                //                     ? controller
                                //                         .storeLocationDropDownValue
                                //                     : null
                                //                 : null, // Ensure value exists in the list
                                //             dropdownItems: controller
                                //                         .activeStoreData
                                //                         .activeStoreLocations !=
                                //                     null
                                //                 ? controller.activeStoreData
                                //                     .activeStoreLocations!
                                //                     .map((item) => item
                                //                         .locationTitle
                                //                         .toString())
                                //                     .toSet() // Remove duplicates
                                //                     .toList()
                                //                 : [],
                                //             onChanged: (newVal, key) {
                                //               if (newVal != null) {
                                //                 setState(() {
                                //                   controller
                                //                           .storeLocationDropDownValue =
                                //                       newVal;
                                //                   debugPrint('newVal $newVal');
                                //                   controller
                                //                       .viewStoreProductInventory();
                                //                 });
                                //               }
                                //             },
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "S.No",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Product Name",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Price",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Incoming',
                                                style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              ),
                                            ],
                                        ),
                                      ), 
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Committed',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Available",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Actions",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
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
                                    child: state is StoreProductListLoading
                                        ? shimmerLayer()
                                        : viewStoreInventoryData
                                                        .allInventories !=
                                                    null &&
                                              _paginatedItems.isNotEmpty
                                          ? dataLayer(_paginatedItems)
                                          : Container(),
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

//!shimmer layer
  ListView shimmerLayer() {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.5,
            color: ColorResource.colorDDDDDD,
          );
        },
        itemCount: 15,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 80,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
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
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 60,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 40,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 40,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 40,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 20,
                            width: 40,
                            child: StartShimmer(),
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

//! data Layer
  ListView dataLayer(List<AllInventories> paginatedItems) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.5,
            color: ColorResource.colorDDDDDD,
          );
        },
        itemCount: paginatedItems.length,
        itemBuilder: (context, i) {
          final storeProduct = paginatedItems[i];
          
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 4,
                    child: Text(
                    storeProduct.name ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        storeProduct.price ??
                              '0',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        storeProduct.incomingQuantity
                              .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          storeProduct.committedQuantity
                              .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          storeProduct.availableStock
                              .toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.viewStoreProductList,
                                      arguments: {
                                        'store_id':
                                            storeProduct.storeInventoryId,
                                        'skuCode': storeProduct.skuCode
                                      });
                                },
                                child: const Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Colors.grey,
                                )),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }

  void viewStoreProductListData(
    BuildContext context, {
    String? filter,
    String? filterBy,
    String? order,
    String? orderby,
    int? storeLocationId,
  }) async {
    context.read<StoreProductListBloc>().add(ViewStoreProductDataEvent(
        filter: filter,
        filterBy: filterBy,
        order: order,
        orderby: orderby,
        storeLocationId: storeLocationId));
  }
}
