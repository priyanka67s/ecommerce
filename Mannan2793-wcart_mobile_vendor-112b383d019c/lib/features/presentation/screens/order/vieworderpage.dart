import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/presentation/screens/order/bloc/view_order_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/order/widgets/order_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ViewOrderPage extends StatefulWidget {
  const ViewOrderPage({super.key});

  @override
  State<ViewOrderPage> createState() => _ViewOrderPageState();
}

class _ViewOrderPageState extends State<ViewOrderPage> {
  ViewOrderModel viewOrderModel = ViewOrderModel();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;
  List<Orders> _allOrders = [];
  List<Orders> get _paginatedItems {
    final filtered = _filteredOrders;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<Orders> get _filteredOrders {
    List<Orders> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allOrders;
    } else {
      filtered = _allOrders
          .where((order) =>
              order.name?.toLowerCase().contains(_searchText) ?? false)
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
    setState(
      () {
        if (_isNameSortingEnabled) {
          _isNameSortedAscending = !_isNameSortedAscending;
        } else {
          _isNameSortingEnabled = true;
          _isNameSortedAscending = true;
        }
        _currentPage = 1; // Reset to first page when sorting
      },
    );
  }

  int get _totalPages => (_filteredOrders.length / _itemsPerPage).ceil();
  @override
  void initState() {
    getOrderData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewOrderBloc, ViewOrderState>(
      listener: (context, state) {
        if (state is ViewOrderDataLoaded) {
          viewOrderModel = state.viewOrderModel;
          _allOrders = state.viewOrderModel.orders ?? [];
          _currentPage = 1; // Reset to first page when data is loaded
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
                        titleText: "Manage Orders",
                        onBackButtonPressed: () {
                          getOrderData(context);
                        },
                        showAction: true,
                      ),
                      const SizedBox(
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "All Orders",
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            "S.NO",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Order ID",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Order Map ID",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Order Date",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: GestureDetector(
                                          onTap: () {
                                            _toggleNameSorting();
                                          },
                                          child: Center(
                                            child: Text(
                                              "Buyer Name",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Total Amount",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Payment Mode",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Order Status",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "Action",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                  child: state is ViewOrderDataLoading
                                      ? shimmerLayer()
                                      : viewOrderModel.orders != null &&
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
                                      buildSmartPagination(),
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

  //! Widget for Pagination Border
  Widget buildSmartPagination() {
    // Maximum number of page buttons to show (excluding first/last and navigation buttons)
    final int maxVisiblePages = 5;

    List<Widget> getPageNumbers() {
      List<Widget> pageWidgets = [];

      if (_totalPages <= maxVisiblePages) {
        // Show all pages if total pages is less than or equal to maxVisiblePages
        for (int i = 1; i <= _totalPages; i++) {
          pageWidgets.add(buildPageButton(i));
        }
      } else {
        // Always show first page
        pageWidgets.add(buildPageButton(1));

        if (_currentPage <= 3) {
          // Show: 1, 2, 3, 4, ..., last
          for (int i = 2; i <= 4; i++) {
            pageWidgets.add(buildPageButton(i));
          }
          pageWidgets.add(buildEllipsis());
          pageWidgets.add(buildPageButton(_totalPages));
        } else if (_currentPage >= _totalPages - 2) {
          // Show: 1, ..., last-3, last-2, last-1, last
          pageWidgets.add(buildEllipsis());
          for (int i = _totalPages - 3; i <= _totalPages; i++) {
            pageWidgets.add(buildPageButton(i));
          }
        } else {
          // Show: 1, ..., current-1, current, current+1, ..., last
          pageWidgets.add(buildEllipsis());
          for (int i = _currentPage - 1; i <= _currentPage + 1; i++) {
            pageWidgets.add(buildPageButton(i));
          }
          pageWidgets.add(buildEllipsis());
          pageWidgets.add(buildPageButton(_totalPages));
        }
      }

      return pageWidgets;
    }

    return Wrap(
      spacing: 5,
      children: [
        // First page button
        paginationBorderWidget(
          child: IconButton(
            icon: Icon(Icons.first_page),
            onPressed: _currentPage > 1
                ? () => setState(() => _currentPage = 1)
                : null,
            padding: EdgeInsets.all(0),
            iconSize: 18,
          ),
        ),
        // Previous page button
        paginationBorderWidget(
          child: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed:
                _currentPage > 1 ? () => setState(() => _currentPage--) : null,
            padding: EdgeInsets.all(0),
            iconSize: 18,
          ),
        ),
        // Smart page numbers
        ...getPageNumbers(),
        // Next page button
        paginationBorderWidget(
          child: IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: _currentPage < _totalPages
                ? () => setState(() => _currentPage++)
                : null,
            padding: EdgeInsets.all(0),
            iconSize: 18,
          ),
        ),
        // Last page button
        paginationBorderWidget(
          child: IconButton(
            icon: Icon(Icons.last_page),
            onPressed: _currentPage < _totalPages
                ? () => setState(() => _currentPage = _totalPages)
                : null,
            padding: EdgeInsets.all(0),
            iconSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildPageButton(int pageNumber) {
    return GestureDetector(
      onTap: () => setState(() => _currentPage = pageNumber),
      child: paginationBorderWidget(
        child: Container(
          width: 30,
          height: 30,
          child: Center(
            child: Text(
              "$pageNumber",
              style: TextStyle(
                color: _currentPage == pageNumber ? Colors.blue : Colors.black,
                fontWeight: _currentPage == pageNumber
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEllipsis() {
    return paginationBorderWidget(
      child: Container(
        width: 30,
        height: 30,
        child: Center(
          child: Text(
            "...",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

//! ListView for Order Data
  ListView dataLayer(List<Orders> filteredOrders) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: .5,
        );
      },
      itemCount: filteredOrders.length,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        final order = filteredOrders[i];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ))),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.orderid.toString(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.ordermapid.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    formatOrderDate(
                      order.createdtime.toString(),
                    ).toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.name ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.amount.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.paymentmethod.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    order.orderstatus.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        Routes.orderDetails,
                        arguments: {
                          'ordermapId': order.ordermapid ?? "",
                          'orderstatus': order.orderstatus ?? 0,
                        },
                      );
                    },
                    child: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void getOrderData(BuildContext context) {
    context.read<ViewOrderBloc>().add(ViewOrderDataEvent());
  }
}

//! Widget for Pagination Border
