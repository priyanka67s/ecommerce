import 'package:flutter/material.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';

class MultiStoreInventoryPage extends StatefulWidget {
  const MultiStoreInventoryPage({super.key});

  @override
  State<MultiStoreInventoryPage> createState() =>
      _MultiStoreInventoryPageState();
}

class _MultiStoreInventoryPageState extends State<MultiStoreInventoryPage> {
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomAppBar(
                    titleText: "Multi Store Inventory",
                    onBackButtonPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 7),
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        // border: Border.all(
                        //   color: Color(0xffe3e3e5),
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
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
                                        "Total Inventory Value",
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Retail Value",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: ColorResource.color252525,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '\$ 32,800.00',
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
                                        "Potential Value",
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
                                        "Margin",
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
                                                  color: Color(
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
                                        )
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
                                          "Items",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "IN Stock",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Cost",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Inventory Value',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Retail Value',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          "Potential Porfit",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
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
                                                    "Apple And Pumpkin Beer ",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    "230",
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
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    "\$5,070",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )),
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
}
