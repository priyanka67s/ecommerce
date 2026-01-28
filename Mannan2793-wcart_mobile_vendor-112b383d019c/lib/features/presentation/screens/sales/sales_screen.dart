import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  String dropdownValue = "one";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.colorF3F4F8,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                // const CustomAppBar(),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 7),
                  height: AppUtils.vs(245, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              "This Month",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorResource.color252525,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: AppUtils.vs(40, context),
                                width: AppUtils.hs(100, context),
                                color: ColorResource.colorBBBBBB,
                                child: Center(
                                  child: Text(
                                    'Between',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorResource.colorffffff,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: AppUtils.vs(40, context),
                              width: AppUtils.hs(250, context),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: ColorResource.colorC4CACD,
                              )),
                              child: Center(
                                child: Text(
                                  "01/12/2023  To 31/12/2023",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: ColorResource.color252525,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  // color: Color(0xFFC5F1E7),
                                  borderRadius: BorderRadius.circular(5)),
                              height: AppUtils.vs(78, context),
                              width: AppUtils.hs(150, context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Paid",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.add),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  // color: Color(0xFFD3E5FC),
                                  borderRadius: BorderRadius.circular(5)),
                              height: AppUtils.vs(78, context),
                              width: AppUtils.hs(150, context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "UnPaid",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "12000.00",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(Icons.remove),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF0CA91),
                                  borderRadius: BorderRadius.circular(5)),
                              height: AppUtils.vs(78, context),
                              width: AppUtils.hs(150, context),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "0.00",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // DropdownButton<String>(
                //     // Step 3.
                //     value: dropdownValue,
                //     // Step 4.
                //     items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(fontSize: 30),
                //         ),
                //       );
                //     }).toList(),
                //     // Step 5.
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropdownValue = newValue!;
                //       });
                //     })),

                const SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 7),
                      height: AppUtils.vs(950, context),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Text(
                                  'TRANSACTIONS',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorResource.color252525,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: AppUtils.vs(45, context),
                                  width: AppUtils.hs(250, context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: ColorResource.colorC4CACD,
                                  )),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: ColorResource.colorC4CACD,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: ColorResource.color0D5EF8,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0))),
                                  height: AppUtils.vs(55, context),
                                  width: AppUtils.vs(180, context),
                                  child: Center(
                                    child: const Text(
                                      "Add Sale",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Date',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'INVOICE NO',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'PARTY NAME ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'TRANSACTION TY.. ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'PAYMENT TYPE',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'AMOUNT ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'BALANCE DUE',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('19/12/2023')),
                                  DataCell(Text('19')),
                                  DataCell(Text('Kavi')),
                                  DataCell(Text('Sale')),
                                  DataCell(Text('Cash')),
                                  DataCell(Text('0')),
                                  DataCell(Text('0')),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
