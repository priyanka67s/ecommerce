import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/bloc/view_product_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/widgets/product_widget.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/widgets/products_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

import '../../../../../../data/model/manageproduct_model.dart';

class ViewAllProductPage extends StatefulWidget {
  const ViewAllProductPage({super.key});

  @override
  State<ViewAllProductPage> createState() => _ViewAllProductPageState();
}

class _ViewAllProductPageState extends State<ViewAllProductPage> {
  final formKey = GlobalKey<FormState>();
  ManageProductModel manageProductModel = ManageProductModel();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<Products> _allProducts = [];
  List<Products> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<Products> get _filteredProducts {
    List<Products> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allProducts;
    } else {
      filtered = _allProducts
          .where((product) =>
              product.name?.toLowerCase().contains(_searchText) ?? false)
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
    getAllProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewProductBloc, ViewProductState>(
      listener: (context, state) {
        if (state is ViewProductLoaded) {
          if (state.manageProductModel.status == "true") {
            manageProductModel = state.manageProductModel;
            _allProducts = state.manageProductModel.products ?? [];
            _currentPage = 1;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorResource.colorF3F4F8,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomAppBar(
                  titleText: "Manage Products",
                  onBackButtonPressed: () {
                    debugPrint("Back button pressed");
                    getAllProduct(context);
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
                      padding: const EdgeInsets.all(20.0),
                      child: (state is ViewProductLoaded &&
                                  state.manageProductModel.products == null ||
                              state is ViewProductLoaded &&
                                  state.manageProductModel.products?.isEmpty ==
                                      true)
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/no_product.png',
                                    height: 200,
                                    width: 200,
                                  ),
                                  Text(
                                    "Get started by adding a new product",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.simpleProductStep1,
                                          arguments: {
                                            'fromScreen':
                                                StringResources.addProduct,
                                            'toScreen':
                                                StringResources.simpleProduct,
                                            'productType': true
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        height: 40,
                                        width: AppUtils.vs(300, context),
                                        child: const Center(
                                          child: Text(
                                            "Add New Product",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "All Products",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 35,
                                        child: TextField(
                                          maxLines: 1,
                                          minLines: 1,
                                          scrollPadding: EdgeInsets.all(0),
                                          controller: _searchController,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              _searchText = value.toLowerCase();
                                              _currentPage =
                                                  1; // Reset page on new search
                                            });
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
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                _paginatedItems.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Image",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: MouseRegion(
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      _toggleNameSorting(),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      StringResources.name,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Type",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "Action",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0,
                                  ),
                                  child: const Divider(
                                    thickness: .5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: state is ViewProductLoading
                                        ? shimmerProducts()
                                        : manageProductModel.products != null &&
                                                _paginatedItems.isNotEmpty
                                            ? products(manageProductModel,
                                                _paginatedItems)
                                            : _searchText.isNotEmpty
                                                ? noDataWidget()
                                                : Container(),
                                  ),
                                ),
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
          ),
        );
      },
    );
  }

  

  Widget noDataWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_product.png',
            height: 200,
            width: 200,
          ),
          Text(
            "Get started by adding a new product",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  Routes.simpleProductStep1,
                  arguments: {
                    'fromScreen': StringResources.addProduct,
                    'toScreen': StringResources.simpleProduct,
                    'productType': true
                  },
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorResource.color0D5EF8,
                    borderRadius: BorderRadius.all(Radius.circular(3.0))),
                height: 40,
                width: AppUtils.vs(300, context),
                child: const Center(
                  child: Text(
                    "Add New Product",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void getAllProduct(BuildContext context) {
  context.read<ViewProductBloc>().add(GetAllProductEvent());
}


Container paginationBorderWidget({required Widget child}) {
  return Container(
      height: 25,
      width: 25,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child);
}
