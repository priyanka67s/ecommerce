import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/bloc/view_store_location_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';

import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ViewStoreLocationPage extends StatefulWidget {
  const ViewStoreLocationPage({super.key});

  @override
  State<ViewStoreLocationPage> createState() => _ViewStoreLocationPageState();
}

class _ViewStoreLocationPageState extends State<ViewStoreLocationPage> {
  ViewStoreLocationModel viewStoreLocationData = ViewStoreLocationModel();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<ManageStoreLocations> _allStores = [];
  List<ManageStoreLocations> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<ManageStoreLocations> get _filteredProducts {
    List<ManageStoreLocations> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allStores;
    } else {
      filtered = _allStores
          .where((store) =>
              store.locationTitle?.toLowerCase().contains(_searchText) ?? false)
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
    viewStoreLocationModel(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewStoreLocationBloc, ViewStoreLocationState>(
      listener: (context, state) {
        if (state is ViewStoreLocationLoaded) {
          viewStoreLocationData = state.viewStoreLocationModel;
          _allStores = state.viewStoreLocationModel.manageStoreLocations ?? [];
          _currentPage = 1;
        } else if (state is ViewStoreLocationFailure) {
          showInfoSnackBar(state.errorMessage);
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
                        titleText: "Manage Location",
                        onBackButtonPressed: () {
                          viewStoreLocationModel(context);
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
                                      Expanded(
                                        flex: 2,
                                        child: const Text(
                                          "Manage Location",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
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
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 10),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          Color(0xffffbbbbbb),
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
                                                          BorderRadius.circular(
                                                              5.0),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.toNamed(
                                                          Routes
                                                              .addStoreLocation,
                                                          arguments: {
                                                        'fromScreen':
                                                            StringResources
                                                                .addStoreLocation
                                                      })!
                                                      .then((value) {
                                                    viewStoreLocationModel(
                                                        context);
                                                  });
                                                },
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: ColorResource
                                                              .color0D5EF8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          3.0))),
                                                  height:
                                                      AppUtils.vs(65, context),
                                                  width:
                                                      AppUtils.vs(220, context),
                                                  child: const Center(
                                                    child: Text(
                                                      "Add Location",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
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
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "S.NO",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Location Title",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "Contact Person Name",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Action",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.5,
                                  color: ColorResource.colorDDDDDD,
                                ),
                                Expanded(
                                  child: state is ViewStoreLocationLoading?
                                      ? shimmerLayer()
                                      : viewStoreLocationData
                                                      .manageStoreLocations !=
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

//! shimmer layer
  ListView shimmerLayer() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: .5,
        );
      },
      itemCount:
          15,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 20,
                      width: 120,
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
                      width: 120,
                      child: StartShimmer(),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      spacing: 20,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: StartShimmer(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: StartShimmer(),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

//! ListView dataLayer
  ListView dataLayer(List<ManageStoreLocations> paginatedItems) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorResource.colorDDDDDD,
            thickness: .5,
          );
        },
        itemCount:
            paginatedItems.length,
        itemBuilder: (context, i) {
        final store = paginatedItems[i];
          int sNo = i + 1;
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "$sNo",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                      store.locationTitle ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                      store.conatctPersonName ??
                            "",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.addStoreLocation,
                                    arguments: {
                                      'fromScreen':
                                          StringResources.editStoreLocation,
                                'storelocation_id':
                                    store.storeLocationId
                                          .toString()
                                    });
                              },
                              child: const SvgIcon(
                                'assets/icon/svg/edit.svg',
                                height: 40,
                              ),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: (() {}),
                          //   child: const SvgIcon(
                          //     'assets/icon/svg/remove.svg',
                          //     height: 40,
                          //   ),
                          // )
                        ],
                      ))
                ],
              ),
            ),
          );
      },
    );
  }

  void viewStoreLocationModel(BuildContext context) async {
    context.read<ViewStoreLocationBloc>().add(
          ViewStoreLocationDataEvent(),
        );
  }
}
