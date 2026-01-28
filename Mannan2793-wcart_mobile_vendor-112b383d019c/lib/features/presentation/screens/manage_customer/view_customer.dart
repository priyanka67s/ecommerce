import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_customer/customer_controller/customercontroller.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class ViewCustomerPage extends StatefulWidget {
  const ViewCustomerPage({super.key});

  @override
  State<ViewCustomerPage> createState() => _ViewCustomerPageState();
}

class _ViewCustomerPageState extends State<ViewCustomerPage> {
  CustomerController controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(builder: (controller) {      
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
                      titleText: "View Customer",
                      onBackButtonPressed: () {},
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Product List",
                                      style: TextStyle(fontSize: 18),
                                    ),
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
                                        flex: 4,
                                        child: Text(
                                          "Name",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Mobile",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),                                    
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    // Expanded(
                                    //     flex: 2,
                                    //     child: Center(
                                    //         child: Text(
                                    //       "Action",
                                    //       style: TextStyle(
                                    //           fontSize: 14,
                                    //           fontWeight: FontWeight.bold),
                                    //     )))
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              Expanded(
                                child: controller.status.isLoading ||
                                        controller.viewCustomerData.customers ==
                                            null
                                    ? shimmerLayer()
                                    : dataLayer(controller),
                              )
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
    });
  }

//! shimmer Layer
  ListView shimmerLayer() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: .5,
        );
      },
      itemCount: 15,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              Expanded(
                flex: 4,
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
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 20,
                    width: 90,
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
            ],
          ),
        );
      },
    );
  }

//! data Layer
  ListView dataLayer(CustomerController controller) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: .5,
        );
      },
      itemCount: controller.viewCustomerData.customers?.length ?? 0,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    controller.viewCustomerData.customers?[i].name ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      controller.viewCustomerData.customers?[i].phone ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Text(
                  controller.viewCustomerData.customers?[i].emailId ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addCustomer() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ADD CUSTOMER',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 500, // Adjust the height as needed
            width: 700, // Adjust the width as needed
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Divider(thickness: .5, color: Colors.grey),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 7),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Expanded(
                        //       flex: 12,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Customer Group *",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           SizedBox(
                        //             height: 45,
                        //             child: CustomTextField(
                        //               "",
                        //               controller.productCode,
                        //               validationRules: const ['required'],
                        //               validatorCallBack: (val) {
                        //                 print(val);
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     const Expanded(
                        //         flex: 1,
                        //         child: SizedBox(
                        //           height: 0,
                        //         )),
                        //     Expanded(
                        //       flex: 12,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Price Group",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           SizedBox(
                        //             height: 45,
                        //             child: CustomTextField(
                        //               "",
                        //               controller.productCode,
                        //               validationRules: const ['required'],
                        //               validatorCallBack: (val) {
                        //                 print(val);
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // const SizedBox(height: 10),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Expanded(
                        //       flex: 12,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Company *",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           SizedBox(
                        //             height: 45,
                        //             child: CustomTextField(
                        //               "",
                        //               controller.productCode,
                        //               validationRules: const ['required'],
                        //               validatorCallBack: (val) {
                        //                 print(val);
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     const Expanded(
                        //         flex: 1,
                        //         child: SizedBox(
                        //           height: 0,
                        //         )),
                        //     Expanded(
                        //       flex: 12,
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Postal Code",
                        //             style: TextStyle(
                        //                 color: Colors.black,
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.w500),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           SizedBox(
                        //             height: 50,
                        //             child: CustomTextField(
                        //               "",
                        //               controller.productCode,
                        //               validationRules: const ['required'],
                        //               validatorCallBack: (val) {
                        //                 print(val);
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 15,
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.name,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Phone *",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child:
                                        // TextFormField(
                                        //   controller: controller.mobile,
                                        //   keyboardType: TextInputType.number,
                                        //   decoration: InputDecoration(
                                        //     labelText: 'Phone Number',
                                        //   ),
                                        //   // Validator to check phone number
                                        //   validator: (value) {
                                        //     if (value == null || value.isEmpty) {
                                        //       return 'Please enter your phone number';
                                        //     }
                                        //     // Basic RegExp to check if phone number is valid
                                        //     String pattern = r'^[0-9]{10}$';
                                        //     RegExp regex = RegExp(pattern);
                                        //     if (!regex.hasMatch(value)) {
                                        //       return 'Enter a valid 10-digit phone number';
                                        //     }
                                        //     return null;
                                        //   },
                                        // ),

                                        CustomTextField(
                                      "",
                                      controller.mobile,
                                      validationRules: const ['mobile_number'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Expanded(
                            //   flex: 12,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const Text(
                            //         "Country",
                            //         style: TextStyle(
                            //             color: Colors.black,
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w500),
                            //       ),
                            //       const SizedBox(
                            //         height: 10,
                            //       ),
                            //       SizedBox(
                            //         height: 45,
                            //         child: CustomTextField(
                            //           "",
                            //           controller.productCode,
                            //           validationRules: const ['required'],
                            //           validatorCallBack: (val) {
                            //             print(val);
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.email,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Country",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.country,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Address",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.address,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: CustomTextField(
                                      "",
                                      controller.city,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "VAT Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: CustomTextField(
                                      "",
                                      controller.vatNumber,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "GST Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: CustomTextField(
                                      "",
                                      controller.gstNumber,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // const SizedBox(height: 10),
                        // const Divider(thickness: 0.5, color: Colors.grey),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: ColorResource.color0D5EF8,
                  height: 50,
                  width: 100,
                  child: TextButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Phone number is valid')),
                      //   );
                      // }
                      controller.addCustomer();
                      // Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
