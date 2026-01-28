import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/viewpos_report/ordercount_controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
// import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

class OrderCountTotalPage extends StatefulWidget {
  const OrderCountTotalPage({super.key});

  @override
  State<OrderCountTotalPage> createState() => _OrderCountTotalPageState();
}

class _OrderCountTotalPageState extends State<OrderCountTotalPage> {
  OrderCountReportController controller = Get.put(OrderCountReportController());
  @override
  Widget build(BuildContext context) {
    DateTime? startDate;
    DateTime? endDate;

    Future<void> selectDateRange(BuildContext context) async {
      final DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null &&
          picked !=
              DateTimeRange(
                  start: startDate ?? DateTime.now(),
                  end: endDate ?? DateTime.now())) {
        setState(() {
          startDate = picked.start;
          endDate = picked.end;
        });
      }
    }

    return GetBuilder<OrderCountReportController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
          backgroundColor: ColorResource.colorF3F4F8,
          body: Row(children: [
            Expanded(
                child: Column(children: [
              CustomAppBar(
                titleText: "",
                onBackButtonPressed: () {},
              ),
              
              Expanded(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 7, top: 10),
                  child: Container(
                      color: ColorResource.colorFFFFFF,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Column(children: [
                              const Row(
                                children: [
                                  Text(
                                    "Range",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
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
                                    width: 400,
                                    child: CustomDropdownButton(
                                      dropdownItems:
                                          controller.selectedPeriodCount,
                                      hint: 'select',
                                      value: controller.countList,
                                      onChanged: (val, key) {
                                        controller.countRecordListValue(
                                            value: val,
                                            context:
                                                context); // Pass context here
                                      },
                                    ),
                                  ),

                                  // SizedBox(
                                  //   height: 50,
                                  //   width: 400,
                                  //   child: CustomDropdownButton(
                                  //     dropdownItems:
                                  //         controller.selectedPeriodCount,
                                  //     hint: 'select',
                                  //     value: controller.countList,
                                  //     onChanged: (val, key) {
                                  //       controller.countRecordListValue(
                                  //           value: val);
                                  //     },
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  // Center(
                                  //   child: Column(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: <Widget>[
                                  //       Text("${selectedDate.toLocal()}"
                                  //           .split(' ')[0]),
                                  //       const SizedBox(
                                  //         height: 15.0,
                                  //       ),
                                  //       ElevatedButton(
                                  //         onPressed: () => _selectDate(context),
                                  //         child: const Text('Select date'),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Center(
                                  //   child: Column(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: <Widget>[
                                  //       ElevatedButton(
                                  //         onPressed: () =>
                                  //             _selectDateRange(context),
                                  //         child:
                                  //             const Text('Select date range'),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // )
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
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
                                                  fontWeight: FontWeight.bold),
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
                                              flex: 3,
                                              child: Text(
                                                "Sales",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          // Expanded(
                                          //     flex: 3,
                                          //     child: Text(
                                          //       "Action",
                                          //       style: TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.bold),
                                          //     ))
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                        color: ColorResource.colorDDDDDD,
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                color:
                                                    ColorResource.colorDDDDDD,
                                                thickness: 0.5,
                                              );
                                            },
                                            itemCount: controller
                                                    .orderCountReportData
                                                    .ordercount
                                                    ?.length ??
                                                0,
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
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        formatOrderDate(controller
                                                                .orderCountReportData
                                                                .ordercount?[i]
                                                                .orderDate) ??
                                                            '',
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        controller
                                                                .orderCountReportData
                                                                .ordercount?[i]
                                                                .totalOrders
                                                                ?.toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        controller
                                                                .orderCountReportData
                                                                .ordercount?[i]
                                                                .totalSales
                                                                ?.toString() ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      )),
                                                  // Expanded(
                                                  //   flex: 3,
                                                  //   child: Center(
                                                  //     child: GestureDetector(
                                                  //       onTap: () {},
                                                  //       child: const Icon(
                                                  //         Icons.remove_red_eye,
                                                  //         color: Colors.grey,
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                ],
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]))),
                ),
              )),
            ])),
          ]));
    });
  }
}
