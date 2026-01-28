import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/controller/vendor_report_controller.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sale_by_date/bloc/sales_by_date_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sales_by_category/bloc/sales_category_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

import '../../../../../model/vendorsales_category_model.dart';
import '../../../widgets/toast/app_toast.dart';
import '../../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class SalesByCategoryPage extends StatefulWidget {
  const SalesByCategoryPage({super.key});

  @override
  State<SalesByCategoryPage> createState() => _SalesByCategoryPageState();
}

class _SalesByCategoryPageState extends State<SalesByCategoryPage> {
  //properties
  List<String> selectedPeriodCount = [
    "today",
    'yesterday',
    'thisweek',
    'lastweek',
    'thismonth',
    'lastmonth',
  ];
  String countList = 'today';
  VendorSalesByCategoryModel vendorSalesCategoryData =
      VendorSalesByCategoryModel();

  int _currentPage = 1;
  final int _itemsPerPage = 10;
  List<Ordercount> _allOrders = [];
  List<Ordercount> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<Ordercount> get _filteredProducts {
    List<Ordercount> filtered = [];
    filtered = _allOrders;
    return filtered;
  }

  int get _totalPages => (_filteredProducts.length / _itemsPerPage).ceil();
  initState() {
    getCategoryData(
      context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesCategoryBloc, SalesCategoryState>(
      listener: (context, state) {
        if (state is SalesCategoryLoaded) {
          if (state.vendorSalesCategoryData.status == "true") {
            vendorSalesCategoryData = state.vendorSalesCategoryData;
            _allOrders = state.vendorSalesCategoryData.ordercount ?? [];
            _currentPage = 1; // Reset to first page when data is loaded
          } else {
            showInfoSnackBar(state.vendorSalesCategoryData.message!);
          }
        } else if (state is SalesByDateFailure) {
          showInfoSnackBar(state.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorResource.colorF3F4F8,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomAppBar(
                        titleText: 'Sales by category',
                        onBackButtonPressed: () {
                          getCategoryData(
                            context,
                          );
                        },
                        showAction: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            color: ColorResource.colorFFFFFF,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Column(children: [
                                    const Row(
                                      children: [
                                        Text(
                                          "Range",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.20,
                                          child: CustomDropdownButton(
                                              dropdownWidth:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.20,
                                              offset: const Offset(0, -10),
                                              dropdownItems:
                                                  selectedPeriodCount,
                                              hint: 'select',
                                              value: countList,
                                              onChanged: (val, key) async {
                                                setState(() {
                                                  countList = val;
                                                });

                                                // if (val == "custom") {
                                                //   DateTimeRange? dateRange = await showDateRangePicker(
                                                //     context: context,
                                                //     firstDate: DateTime(2000),
                                                //     lastDate: DateTime(2101),
                                                //   );
                                              }),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Sales By Product Category",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ]),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: ColorResource.colorFFFFFF,
                                          // border: Border.all(
                                          //   color: Color(0xffe3e3e5),
                                          // ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "S.NO",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Category Name",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Order Quantity",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "Sales",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                // Expanded(
                                                //     flex: 1,
                                                //     child: Text(
                                                //       "Action",
                                                //       style: TextStyle(
                                                //           fontSize: 14,
                                                //           fontWeight:
                                                //               FontWeight.bold),
                                                //     ))
                                              ],
                                            ),
                                            const Divider(
                                              thickness: 0.5,
                                              color: ColorResource.colorDDDDDD,
                                            ),
                                            Expanded(
                                              child: state
                                                      is SalesCategoryLoading
                                                  ? shimmerLayer()
                                                  : (vendorSalesCategoryData
                                                                  .ordercount !=
                                                              null &&
                                                          _paginatedItems
                                                              .isNotEmpty
                                                      ? dataLayer(
                                                          _paginatedItems)
                                                      : Container()),
                                            ),
                                            SizedBox(height: 10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Wrap(
                                                    spacing: 5,
                                                    children: [
                                                      paginationBorderWidget(
                                                        child: IconButton(
                                                          icon: Icon(
                                                            Icons.first_page,
                                                          ),
                                                          onPressed: _currentPage >
                                                                  1
                                                              ? () => setState(() =>
                                                                  _currentPage =
                                                                      1)
                                                              : null,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          iconSize: 18,
                                                        ),
                                                      ),
                                                      paginationBorderWidget(
                                                        child: IconButton(
                                                          icon: Icon(Icons
                                                              .chevron_left),
                                                          onPressed: _currentPage >
                                                                  1
                                                              ? () => setState(() =>
                                                                  _currentPage--)
                                                              : null,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          iconSize: 18,
                                                        ),
                                                      ),
                                                      ...List.generate(
                                                          _totalPages, (index) {
                                                        final pageNumber =
                                                            index + 1;
                                                        return GestureDetector(
                                                          onTap: () => setState(
                                                              () => _currentPage =
                                                                  pageNumber),
                                                          child: paginationBorderWidget(
                                                              child: Center(
                                                            child: Text(
                                                              "$pageNumber",
                                                              style: TextStyle(
                                                                color: _currentPage ==
                                                                        pageNumber
                                                                    ? Colors
                                                                        .blue
                                                                    : Colors
                                                                        .black,
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
                                                          icon: Icon(Icons
                                                              .chevron_right),
                                                          onPressed: _currentPage <
                                                                  _totalPages
                                                              ? () => setState(() =>
                                                                  _currentPage++)
                                                              : null,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          iconSize: 18,
                                                        ),
                                                      ),
                                                      paginationBorderWidget(
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.last_page),
                                                          onPressed: _currentPage <
                                                                  _totalPages
                                                              ? () => setState(() =>
                                                                  _currentPage =
                                                                      _totalPages)
                                                              : null,
                                                          padding:
                                                              EdgeInsets.all(0),
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: 15,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Row(
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
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
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
                  alignment: Alignment.centerLeft,
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
                  alignment: Alignment.centerLeft,
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
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 20,
                    width: 40,
                    child: StartShimmer(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

//! data layer
  ListView dataLayer(List<Ordercount> paginatedItems) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: paginatedItems.length,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        final salesCategory = paginatedItems[i]; 
        return Row(
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
                  salesCategory?.termName ??
                      '',
                )),
            Expanded(
                flex: 3,
                child: Text(
                  salesCategory?.quantitysold
                          .toString() ??
                      '',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Text(
                salesCategory?.productsale
                          ?.toString() ??
                      '',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: MouseRegion(
            //     cursor: SystemMouseCursors.click,
            //     child: GestureDetector(
            //       onTap: () {
            //         addCategory();
            //       },
            //       child: const Padding(
            //         padding: EdgeInsets.only(right: 160),
            //         child: Icon(
            //           Icons.remove_red_eye,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Future<void> addCategory() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text('Add Role'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Role Name",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorResource.color252525,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.cancel), // Cancel icon
                  onPressed: () {
                    print('Cancel button pressed');
                  },
                ),
                TextButton(
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: ColorResource.color0D5EF8,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void getCategoryData(BuildContext context,
      {String? selectedPeriodCount, String? startDate, String? endDate}) async {
    context.read<SalesCategoryBloc>().add(
          FetchSalesCategoryEvent(
            selectedPeriodCount: selectedPeriodCount,
            startDate: startDate,
            endDate: endDate,
          ),
        );
  }
}
