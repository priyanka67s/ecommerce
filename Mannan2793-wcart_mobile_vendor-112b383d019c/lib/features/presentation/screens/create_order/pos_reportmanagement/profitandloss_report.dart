import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/viewpos_report/ordercount_controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

class ProfitAndLossPage extends StatefulWidget {
  const ProfitAndLossPage({super.key});

  @override
  State<ProfitAndLossPage> createState() => _ProfitAndLossPageState();
}

class _ProfitAndLossPageState extends State<ProfitAndLossPage> {
  OrderCountReportController controller = Get.put(OrderCountReportController());
  @override
  Widget build(BuildContext context) {
    print('screen status ---> ${controller.status.isLoading}');
    if (controller.status.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: ColorResource.colorF3F4F8,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomAppBar(
                  titleText: "Profit Report",
                  onBackButtonPressed: () {},
                ),
                
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 7),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        // border: Border.all(
                        //   color: Color(0xffe3e3e5),
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Amount",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '\$ 14,0000.00',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    // Column(
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   children: [
                                    //     Text(
                                    //       "Total Retail Value",
                                    //       style: TextStyle(
                                    //         fontSize: 14,
                                    //         color: ColorResource.color252525,
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       '\$ 32,800.00',
                                    //       style: TextStyle(
                                    //         fontSize: 18,
                                    //         color: ColorResource.color252525,
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Profit",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '\$ 23,400.00',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Profit Margin",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '\$ 61.05%',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 7),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        // border: Border.all(
                        //   color: Color(0xffe3e3e5),
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   "Export",
                                      //   style: TextStyle(fontSize: 18),
                                      // ),
                                      // PopupMenuButton(
                                      //   itemBuilder: (BuildContext context) {
                                      //     <PopupMenuEntry<String>>[
                                      //       const PopupMenuItem<String>(
                                      //         value: 'Option 1',
                                      //         child: Text('Store A'),
                                      //       ),
                                      //       const PopupMenuItem<String>(
                                      //         value: 'Option 2',
                                      //         child: Text('Store B'),
                                      //       ),
                                      //       const PopupMenuItem<String>(
                                      //         value: 'Option 3',
                                      //         child: Text('Store C'),
                                      //       ),
                                      //     ];
                                      //   },
                                      //   child: Container(
                                      //     margin: const EdgeInsets.all(1.0),
                                      //     padding: const EdgeInsets.all(5.0),
                                      //     decoration: BoxDecoration(
                                      //         borderRadius:
                                      //             BorderRadius.circular(3),
                                      //         border: Border.all(
                                      //             color: ColorResource
                                      //                 .colorC4CACD)),
                                      //     child: const Row(
                                      //       children: [
                                      //         Text(
                                      //           "Filter",
                                      //           style:
                                      //               TextStyle(fontSize: 14.0),
                                      //         ),
                                      //         SizedBox(
                                      //           width: 20,
                                      //         ),
                                      //         Icon(Icons.arrow_drop_down)
                                      //       ],
                                      //     ),
                                      //   ),
                                      // )

                                      PopupMenuButton(
                                        itemBuilder: (BuildContext context) {
                                          return <PopupMenuEntry<String>>[
                                            const PopupMenuItem<String>(
                                              value: 'Option 1',
                                              child: Text('Store A'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 2',
                                              child: Text('Store B'),
                                            ),
                                            const PopupMenuItem<String>(
                                              value: 'Option 3',
                                              child: Text('Store C'),
                                            ),
                                          ];
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(1.0),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            border: Border.all(
                                                color: const Color(
                                                    0xFFC4CACD)), // Use your color constant here
                                          ),
                                          child: const Row(
                                            children: [
                                              Text(
                                                "All Store",
                                                style:
                                                    TextStyle(fontSize: 14.0),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(Icons.arrow_drop_down),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 40,
                                        width: 200,
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
                                    ])),
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
                                      flex: 5,
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Invoice Number",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Total Amount",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        'COGS',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Profit',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  // Expanded(
                                  //     flex: 3,
                                  //     child: Text(
                                  //       "Porfit",
                                  //       style: TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.bold),
                                  //     )),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Margin",
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
                                child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: ColorResource.colorDDDDDD,
                                        thickness: .5,
                                      );
                                    },
                                    itemCount: 10,
                                    itemBuilder: (context, i) {
                                      return const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "23-09-2024",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "230905697",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "\$23",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "\$1,300",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "\$3,356",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                            // Expanded(
                                            //     flex: 3,
                                            //     child: Text(
                                            //       "\$5,070",
                                            //       style: TextStyle(
                                            //         fontSize: 14,
                                            //       ),
                                            //     )),
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "58.33%",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    }))
                          ],
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
    );
  }
}
