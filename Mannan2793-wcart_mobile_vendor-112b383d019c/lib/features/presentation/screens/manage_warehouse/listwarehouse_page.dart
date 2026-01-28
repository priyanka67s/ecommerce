import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/bloc/view_warehouse_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';

import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ListWarehousePage extends StatefulWidget {
  const ListWarehousePage({super.key});

  @override
  State<ListWarehousePage> createState() => _ListWarehousePageState();
}

class _ListWarehousePageState extends State<ListWarehousePage> {
  
  ViewWarehouseModel viewWarehouseModel = ViewWarehouseModel();

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<WarehouseAddress> _allWarehouse = [];
  List<WarehouseAddress> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<WarehouseAddress> get _filteredProducts {
    List<WarehouseAddress> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allWarehouse;
    } else {
      filtered = _allWarehouse
          .where((warehouse) =>
              warehouse.locationTitle?.toLowerCase().contains(_searchText) ??
              false)
          .toList();
    }

    // Apply sorting if enabled
    if (_isNameSortingEnabled) {
      filtered.sort((a, b) {
        String nameA = a.locationTitle?.toLowerCase() ?? '';
        String nameB = b.locationTitle?.toLowerCase() ?? '';
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
    getWarehouse(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewWarehouseBloc, ViewWarehouseState>(
      listener: (context, state) {
        if (state is ViewWarehouseFailure) {
        } else if (state is ViewWarehouseLoaded) {          
          viewWarehouseModel = state.viewWarehouseModel;
          _allWarehouse = state.viewWarehouseModel.warehouseAddress ?? [];
          _currentPage = 1; // Reset to first page when data is loaded
        }
        else if (state is RemoveWarehouseLoaded) {
          if (state.viewWarehouseModel["status"] == "true") {
            final index = state.viewWarehouseModel["index"];
            if (index != null) {
              viewWarehouseModel.warehouseAddress?.removeAt(index);
            }
          } else {
            showInfoSnackBar(state.viewWarehouseModel["message"]);
          }
        } else if (state is RemoveWarehouseFailure) {
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
                          getWarehouse(context);
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
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Product List",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.addWarehouse,
                                                    arguments: {
                                                  'fromScreen': StringResources
                                                      .addWareHouse
                                                })!
                                                .then((value) {
                                              getWarehouse(context);
                                            });
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.0))),
                                            height: 40,
                                            width: AppUtils.vs(300, context),
                                            child: const Center(
                                              child: Text(
                                                "Add New Warehouse",
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
                                          child: Text(
                                            "S.NO",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Name",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Location",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            'Mobile',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 4,
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 2,
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
                                Expanded(
                                  child: state is ViewWarehouseLoading
                                      ? shimmerLayer()
                                      : viewWarehouseModel.warehouseAddress !=
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
                                                        () => _currentPage = 1,
                                                      )
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

//! shimmer layer
  Widget shimmerLayer() {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: .5,
          );
        },
        itemCount: 10,
        itemBuilder: (context, i) {
          int sNo = i + 1;
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "$sNo",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 20,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 20,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 20,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 20,
                        child: StartShimmer(),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: StartShimmer(),
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: StartShimmer(),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }

//! Data Layer
  ListView dataLayer(List<WarehouseAddress> paginatedItems) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: .5,
          );
        },
        itemCount: paginatedItems.length,
        itemBuilder: (context, i) {
          int sNo = i + 1;          
          final warehouse = paginatedItems[i];
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        "$sNo",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        warehouse.conatctPersonName ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        warehouse.addressline1 ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        warehouse.phoneNo ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Text(
                        warehouse.emailId ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.addWarehouse,
                                        arguments: {
                                          'fromScreen':
                                              StringResources.editWareHouse,
                                          'warehouse_id': warehouse.warehouseId

                                          //   .then((value) {
                                          // if (value ??
                                          //     false) {
                                          //   controller
                                          //       .viewwarehouse();
                                        });
                                  },
                                  child: const SvgIcon(
                                    'assets/icon/svg/edit.svg',
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: (() {
                                  // controller.removeWarehouse(
                                  //   data.warehouseAddress![i].warehouseId!,
                                  //   i,
                                  // );
                                  removeWarehouse(
                                    warehouse.warehouseId!,
                                    i,
                                    context,
                                  );
                                }),
                                child: const SvgIcon(
                                  'assets/icon/svg/remove.svg',
                                  height: 40,
                                ),
                              ),
                            ))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
  
  void removeWarehouse(int warehouseId, int index, BuildContext context) {
    context.read<ViewWarehouseBloc>().add(
          RemoveWarehouseEvent(
            warehouseId: (warehouseId).toString(),
            index: index,
          ),
        );
  }
  

}

void getWarehouse(BuildContext context) {
  context.read<ViewWarehouseBloc>().add(ViewWarehouseDataEvent());
}
