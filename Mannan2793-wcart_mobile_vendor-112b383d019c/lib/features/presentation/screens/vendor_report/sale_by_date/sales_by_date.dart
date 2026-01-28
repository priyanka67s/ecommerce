import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:wcart_vendor/features/presentation/screens/vendor_report/controller/vendor_report_controller.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sale_by_date/bloc/sales_by_date_bloc.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

import '../../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class SalesByDatePage extends StatefulWidget {
  const SalesByDatePage({super.key});

  @override
  State<SalesByDatePage> createState() => _SalesByDatePageState();
}

class _SalesByDatePageState extends State<SalesByDatePage> {
  String countList = 'today';
  List<String> selectedPeriodCount = [
    "today",
    'yesterday',
    'thisweek',
    'lastweek',
    'thismonth',
    'lastmonth',
  ];
  OrderCountReportModel orderCountReportData = OrderCountReportModel();

  
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  List<OrderCount> _allOrders = [];
  List<OrderCount> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<OrderCount> get _filteredProducts {
    List<OrderCount> filtered = [];
    filtered = _allOrders;
    return filtered;
  }

  int get _totalPages => (_filteredProducts.length / _itemsPerPage).ceil();

  @override
  void initState() {
    getSalesByDate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesByDateBloc, SalesByDateState>(
      listener: (context, state) {
        
        if (state is SalesByDateLoaded) {  
          if (state.orderCountReportModel.status == "true") {
            orderCountReportData = state.orderCountReportModel;
            _allOrders = state.orderCountReportModel.ordercount ?? [];
            _currentPage = 1; // Reset to first page when data is loaded
          } else {
            showInfoSnackBar(state.orderCountReportModel.message!);
          }
        } else if (state is SalesByDateFailure) {
          showInfoSnackBar(state.message);
        } else if (state is SelectFilterState) {
          countList = state.selectedFilter;
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
                        titleText: 'Sales by Date',
                        onBackButtonPressed: () {
                          getSalesByDate(context);
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
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 40,
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
                                            dropdownItems: selectedPeriodCount,
                                            hint: 'select',
                                            value: countList,
                                            onChanged: (val, key) {
                                              countRecordListValue(
                                                  value: val,
                                                  context:
                                                      context); // Pass context here
                                            },
                                          ),
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
                                          "Sales By Date",
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
                                                      "Order Date",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Order Count",
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
                                                              FontWeight.bold),
                                                    )),
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
                                              child: state is SalesByDateLoading
                                                  ? shimmerLayer()
                                                  : orderCountReportData
                                                                  .ordercount !=
                                                              null &&
                                                          _paginatedItems
                                                              .isNotEmpty
                                                      ? dataLayer(
                                                          _paginatedItems)
                                                      : Container(),
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
                                                              Icons.first_page),
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

//!shimmer layer
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 20,
                    width: 70,
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
                    width: 70,
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
                    width: 70,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 20,
                    width: 30,
                    child: StartShimmer(),
                  ),
                ),
              ),
            ],
          );
        });
  }

//!data layer
  ListView dataLayer(List<OrderCount> paginatedItems) {
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
          final saleItem = paginatedItems[i];
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
                    formatOrderDate(
                            saleItem.orderDate) ??
                        '',
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    saleItem.totalOrders
                            ?.toString() ??
                        '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    saleItem.totalSales
                            ?.toString() ??
                        '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              // Expanded(
              //   flex: 1,
              //   child: MouseRegion(
              //     cursor: SystemMouseCursors.click,
              //     child: GestureDetector(
              //       onTap: () {
              //         debugPrint("Tapped");
              //         salesByDate();
              //       },
              //       child: Icon(
              //         Icons.remove_red_eye,
              //         color: Colors.grey,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        });
  }

  Future<void> salesByDate() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // To position the close button
            children: [
              const Text(
                'Order Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
          content: const SingleChildScrollView(
            child: SizedBox(
              height: 500,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Text(
                          "Order ID",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "View",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void getSalesByDate(
  BuildContext context, {
  String? selectedPeriodCount,
  String? startDate,
  String? endDate,
}) {
  context.read<SalesByDateBloc>().add(ViewTotalOrderCountEvent(
      selectedPeriodCount: selectedPeriodCount,
      startDate: startDate,
      endDate: endDate));
}

//! dropdown action
Future<void> countRecordListValue(
    {required String value, required BuildContext context}) async {
  String? startDate;
  String? endDate;

  if (value == "custom") {
    DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (dateRange != null) {
      startDate = dateRange.start.toIso8601String();
      endDate = dateRange.end.toIso8601String();
    }
  }
  context.read<SalesByDateBloc>().add(SelectFilterEvent(value: value));
  getSalesByDate(context,
      selectedPeriodCount: value, startDate: startDate, endDate: endDate);
}
