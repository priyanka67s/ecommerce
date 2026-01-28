import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/viewpos_report/posreport_contoller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

class VendorOverviewReportPage extends StatefulWidget {
  const VendorOverviewReportPage({super.key});

  @override
  State<VendorOverviewReportPage> createState() =>
      _VendorOverviewReportPageState();
}

class _VendorOverviewReportPageState extends State<VendorOverviewReportPage> {
  DateTime selectedDate = DateTime.now();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null &&
        picked !=
            DateTimeRange(
                start: _startDate ?? DateTime.now(),
                end: _endDate ?? DateTime.now())) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  ReportPerformanceController controller =
      Get.put(ReportPerformanceController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportPerformanceController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            Expanded(
              child: Column(
                children: [
                  CustomAppBar(
                    titleText: 'Vendor overview report',
                    onBackButtonPressed: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Center(
                        child: Container(
                      color: ColorResource.colorFFFFFF,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Range",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width /
                                          4.30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDEEE0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: CustomDropdownButton(
                                        dropdownWidth:
                                            MediaQuery.of(context).size.width /
                                                4.30,
                                        offset: const Offset(0, -10),
                                        dropdownItems:
                                            controller.selectedPeriod,
                                        hint: 'select',
                                        value: controller.countList,
                                        onChanged: (val, key) {
                                          controller.countRecordListValue(
                                            value: val,
                                            context: context,
                                          ); // Pass context here
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
                                      "Performance",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffD2F1F9),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 246, 247, 247),
                                              width: .5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Text("Total Sale Amount",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                controller
                                                    .viewReportPerformanceData
                                                    .totalsales
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(flex: 1, child: Container()),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffBBF0E0),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 247, 249, 250),
                                              width: .5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              const Text("Total Orders",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  controller
                                                      .viewReportPerformanceData
                                                      .totalorder
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(flex: 1, child: Container()),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFBE0F3),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 250, 251, 251),
                                              width: 0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              const Text("Product Sold",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  controller
                                                      .viewReportPerformanceData
                                                      .productsold
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Sales & Orders",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    height: 385,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffFBFBFB),
                                      // border: Border.all(
                                      //     color: ColorResource.colorC4CACD,
                                      //     width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Sales',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Date",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    'Month',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Orders",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Order Earnings",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: .5,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                color:
                                                    ColorResource.colorDDDDDD,
                                                thickness: .5,
                                              );
                                            },
                                            itemCount: controller
                                                    .viewReportPerformanceData
                                                    .salesChartData
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, i) {
                                              // Ensure that salesChartData is not null and has at least 3 items
                                              final salesChartData = controller
                                                  .viewReportPerformanceData
                                                  .salesChartData;
                                              if (salesChartData == null ||
                                                  salesChartData.isEmpty) {
                                                return Container(); // or a placeholder widget
                                              }
                                              // final itemCount =
                                              //     salesChartData.length >= 3
                                              //         ? 3
                                              //         : salesChartData
                                              //             .length;
                                              // if (i >= itemCount) {
                                              //   return Container(); // Prevent out-of-bound access
                                              // }

                                              final data = salesChartData[i];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            data.d?.toString() ??
                                                                'N/A',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            data.m?.toString() ??
                                                                'N/A',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            data.orderCount
                                                                    ?.toString() ??
                                                                'N/A',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            data.earnings
                                                                    ?.toString() ??
                                                                'N/A',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 385,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFBFBFB),
                                              // border: Border.all(
                                              //     color: ColorResource
                                              //         .colorC4CACD,
                                              //     width: 1.0),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(3.0)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Orders',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                            "Date",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            'Month',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "Orders",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "Order Earnings",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: .5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Leader boards",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    height: 385,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFBFBFB),
                                      // border: Border.all(
                                      //     color: ColorResource.colorC4CACD,
                                      //     width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3.0)),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Top categories - Items sold',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Category",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    'Items sold',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                    "Net sales",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: .5,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                color:
                                                    ColorResource.colorDDDDDD,
                                                thickness: .5,
                                              );
                                            },
                                            itemCount: controller
                                                    .viewReportPerformanceData
                                                    .topCategories
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, i) {
                                              final topCategory = controller
                                                  .viewReportPerformanceData
                                                  .topCategories?[i];

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Center(
                                                        child: Text(
                                                          topCategory
                                                                  ?.termName ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Center(
                                                        child: Text(
                                                          topCategory
                                                                  ?.quantitysold
                                                                  ?.toString() ??
                                                              '0',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Center(
                                                        child: Text(
                                                          topCategory
                                                                  ?.quantitysold
                                                                  ?.toString() ??
                                                              '0',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )

                                        // Expanded(
                                        //     child: ListView.builder(
                                        //         itemCount: controller
                                        //             .ViewReportPerformanceData
                                        //             .topCategories?
                                        //             .length ?? 0,
                                        //         itemBuilder:
                                        //             (context, i) {
                                        //           return Padding(
                                        //             padding:
                                        //                 const EdgeInsets
                                        //                     .all(5.0),
                                        //             child: Container(
                                        //               child: Row(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment
                                        //                           .spaceEvenly,
                                        //                   children: [
                                        //                     Expanded(
                                        //                         flex: 3,
                                        //                         child: Center(
                                        //                             child: Text(
                                        //                           controller.ViewReportPerformanceData.topCategories![i].termName ??
                                        //                               '',
                                        //                           style:
                                        //                               TextStyle(
                                        //                             fontSize:
                                        //                                 14,
                                        //                           ),
                                        //                         ))),
                                        //                     Expanded(
                                        //                         flex: 3,
                                        //                         child: Center(
                                        //                             child: Text(
                                        //                           controller
                                        //                               .ViewReportPerformanceData
                                        //                               .topCategories![i]
                                        //                               .quantitysold
                                        //                               .toString(),
                                        //                           style:
                                        //                               TextStyle(
                                        //                             fontSize:
                                        //                                 14,
                                        //                           ),
                                        //                         ))),
                                        //                     Expanded(
                                        //                         flex: 3,
                                        //                         child: Center(
                                        //                             child: Text(
                                        //                           controller
                                        //                               .ViewReportPerformanceData
                                        //                               .topCategories![i]
                                        //                               .quantitysold
                                        //                               .toString(),
                                        //                           style:
                                        //                               TextStyle(
                                        //                             fontSize:
                                        //                                 14,
                                        //                           ),
                                        //                         ))),
                                        //                   ]),
                                        //             ),
                                        //           );
                                        //         }))
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                    flex: 20,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 385,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffFBFBFB),
                                              // border: Border.all(
                                              //     color: ColorResource
                                              //         .colorC4CACD,
                                              //     width: 1.0),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(3.0)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Top products - Items sold',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                            "Name",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                            'Items sold',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                      Expanded(
                                                          flex: 3,
                                                          child: Center(
                                                              child: Text(
                                                            "Net sales",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: .5,
                                                ),
                                                Expanded(
                                                    child: ListView.separated(
                                                        separatorBuilder:
                                                            (context, index) {
                                                          return const Divider(
                                                            color: ColorResource
                                                                .colorDDDDDD,
                                                            thickness: .5,
                                                          );
                                                        },
                                                        itemCount: controller
                                                                .viewReportPerformanceData
                                                                .topProducts
                                                                ?.length ??
                                                            0,
                                                        itemBuilder:
                                                            (context, i) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Container(
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 3,
                                                                        child: Center(
                                                                            child: Text(
                                                                          controller.viewReportPerformanceData.topProducts![i].name ??
                                                                              "",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ))),
                                                                    Expanded(
                                                                        flex: 3,
                                                                        child: Center(
                                                                            child: Text(
                                                                          controller
                                                                              .viewReportPerformanceData
                                                                              .topProducts![i]
                                                                              .quantitysold
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ))),
                                                                    Expanded(
                                                                        flex: 3,
                                                                        child: Center(
                                                                            child: Text(
                                                                          controller
                                                                              .viewReportPerformanceData
                                                                              .topProducts![i]
                                                                              .productsale
                                                                              .toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ))),
                                                                  ]),
                                                            ),
                                                          );
                                                        })),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
