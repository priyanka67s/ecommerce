import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/payment_pos/contoller_payment.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';


// import 'package:wcart_vendor/screens/pos_method/payment_pos/payment_succes.dart';
// import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class DesktopPosPayment extends StatefulWidget {
  const DesktopPosPayment({super.key});
  static const String routeName = '/desktop_payment_order';

  @override
  State<DesktopPosPayment> createState() => _DesktopPosPaymentState();
}

class _DesktopPosPaymentState extends State<DesktopPosPayment> {
  bool selectCheckbox = false;
  final cartTotalAmount = Get.arguments['totalAmount'];
  PaymentController controller = Get.put(PaymentController());

  int? selecteddeliverytype;

  TextEditingController staffNote = TextEditingController();
  TextEditingController otherCharges = TextEditingController();

  final TextEditingController totalAmountController = TextEditingController();
  double remainingAmount = 0.0;
  double totalAmount = 0.0;
  int itemCount = 0;
  String userId = '';

  @override
  void initState() {
    super.initState();
    totalAmount = double.tryParse(Get.arguments['totalAmount']) ?? 0.0;
    userId = Get.arguments['userId'];
    remainingAmount = totalAmount;
    totalAmountController.addListener(_updateRemainingAmount);
  }

  void _updateRemainingAmount() {
    double enteredAmount = double.tryParse(totalAmountController.text) ?? 0.0;
    setState(() {
      remainingAmount = totalAmount - enteredAmount;
    });
  }

  @override
  void dispose() {
    totalAmountController.removeListener(_updateRemainingAmount);
    totalAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (contoller) {
      List<String> locationStatusValueList =
          controller.locationStatusMap.keys.toList();
      // print('screen status ---> ${controller.status.isLoading}');
      // if (controller.status.isLoading) {
      //   return Center(child: CircularProgressIndicator());
      // }
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (() {
                Get.back();
              }),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 226, 225, 225),
                  width: 1,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     const Text(
                            //       "Other Charges",
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ),
                            //     const SizedBox(
                            //       height: 10,
                            //     ),
                            //     CustomTextField(
                            //       "",
                            //       otherCharges,
                            //       validationRules: const ['required'],
                            //       validatorCallBack: (val) {
                            //         print(val);
                            //       },
                            //     ),
                            //   ],
                            // ),
                            // const Row(
                            //   children: [
                            //     Text(
                            //       "Biller",
                            //       style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w500),
                            //     ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: DropdownButtonFormField(
                            //         decoration: const InputDecoration(
                            //           fillColor: ColorResource.colorFFFFFF,
                            //           border: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: ColorResource.colorC4CACD,
                            //             ),
                            //             borderRadius: BorderRadius.all(
                            //               Radius.circular(3.0),
                            //             ),
                            //           ),
                            //           enabledBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: ColorResource.colorC4CACD,
                            //               width: 1.0, // Border width when enabled
                            //             ),
                            //             borderRadius: BorderRadius.all(
                            //               Radius.circular(3.0),
                            //             ),
                            //           ),
                            //           focusedBorder: OutlineInputBorder(
                            //             borderSide: BorderSide(
                            //               color: ColorResource.colorC4CACD,
                            //               width: 1.0, // Border width when focused
                            //             ),
                            //             borderRadius: BorderRadius.all(
                            //               Radius.circular(3.0),
                            //             ),
                            //           ),
                            //         ),
                            //         hint: const Text('Select Data'),
                            //         items: controller.allStaffData.staffs?.map((item) {
                            //           return DropdownMenuItem(
                            //             value: item.userName.toString(),
                            //             child: Text(item.userName.toString()),
                            //           );
                            //         }).toList(),
                            //         onChanged: (newVal) {
                            //           setState(() {
                            //             controller.brandDropDownValue = newVal;
                            //           });
                            //         },
                            //         value: controller.brandDropDownValue,
                            //       ),

                            //       //  DropdownButtonFormField(
                            //       //   decoration: const InputDecoration(
                            //       //     fillColor: ColorResource.colorFFFFFF,
                            //       //     border: OutlineInputBorder(
                            //       //       borderSide: BorderSide(
                            //       //           color: ColorResource.colorC4CACD),
                            //       //       borderRadius: BorderRadius.all(
                            //       //         Radius.circular(3.0),
                            //       //       ),
                            //       //     ),
                            //       //     enabledBorder: OutlineInputBorder(
                            //       //       borderSide: BorderSide(
                            //       //         color: ColorResource.colorC4CACD,
                            //       //         width: 1.0, // Border width when enabled
                            //       //       ),
                            //       //       borderRadius: BorderRadius.all(
                            //       //         Radius.circular(3.0),
                            //       //       ),
                            //       //     ),
                            //       //     focusedBorder: OutlineInputBorder(
                            //       //       borderSide: BorderSide(
                            //       //         color: ColorResource.colorC4CACD,
                            //       //         width: 1.0, // Border width when focused
                            //       //       ),
                            //       //       borderRadius: BorderRadius.all(
                            //       //         Radius.circular(3.0),
                            //       //       ),
                            //       //     ),
                            //       //   ),
                            //       //   hint: const Text('select Data'),
                            //       //   items: controller.allStaffData.staffs?.map((item) {
                            //       //     return DropdownMenuItem(
                            //       //       value: item.userName.toString(),
                            //       //       child: Text(item.userName.toString()),
                            //       //     );
                            //       //   }).toList(),
                            //       //   onChanged: (newVal) {
                            //       //     setState(() {
                            //       //       controller.brandDropDownValue = newVal;
                            //       //     });
                            //       //   },
                            //       //   value: controller.brandDropDownValue,
                            //       // ),
                            //     ),

                            //     // Expanded(
                            //     //   child: CustomDropdownButton(
                            //     //     dropdownItems: controller.locationStatusValueList,
                            //     //     hint: 'select',
                            //     //     value: controller.locationSelectedStatusValueList,
                            //     //     onChanged: (val, key) {
                            //     //       setState(() {
                            //     //         controller.locationSelectedStatusValueList =
                            //     //             val;
                            //     //       });
                            //     //       print(val);
                            //     //     },
                            //     //   ),
                            //     // ),
                            //   ],
                            // ),

                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     Expanded(
                            //       flex: 12,
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            // const Text(
                            //   "Country",
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontSize: 16,
                            //       fontWeight: FontWeight.w500),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // TextFormField(
                            //   controller: controller.saleNoteController,
                            //   maxLines: 3,
                            //   // expands: true,
                            //   keyboardType: TextInputType.multiline,
                            //   decoration: InputDecoration(
                            //     fillColor: Colors.white,
                            //     hintText: "Sale Note",
                            //     hintStyle: const TextStyle(
                            //         color: Color(0xFF6B7280),
                            //         fontWeight: FontWeight.w400),
                            //     border: const OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //       color: Colors.teal,
                            //     )),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.circular(3),
                            //       borderSide: const BorderSide(
                            //           width: 0,
                            //           color: ColorResource
                            //               .colorC4CACD), //<-- SEE HERE
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.circular(3),
                            //       borderSide: const BorderSide(
                            //           width: 0,
                            //           color: ColorResource
                            //               .colorC4CACD), //<-- SEE HERE
                            //     ),
                            //     filled: true,
                            //   ),
                            // ),
                            //     ],
                            //   ),
                            // ),
                            // const Expanded(
                            //     flex: 1,
                            //     child: SizedBox(
                            //       height: 0,
                            //     )),
                            // Expanded(
                            //   flex: 12,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       // const Text(
                            //       //   "Pincode",
                            //       //   style: TextStyle(
                            //       //       color: Colors.black,
                            //       //       fontSize: 16,
                            //       //       fontWeight: FontWeight.w500),
                            //       // ),
                            //       const SizedBox(
                            //         height: 10,
                            //       ),
                            //       TextFormField(
                            //         controller: controller.staffNoteController,
                            //         maxLines: 3,
                            //         // expands: true,
                            //         keyboardType: TextInputType.multiline,
                            //         decoration: InputDecoration(
                            //           fillColor: Colors.white,
                            //           hintText: "Staff Note",
                            //           hintStyle: const TextStyle(
                            //               color: Color(0xFF6B7280),
                            //               fontWeight: FontWeight.w400),
                            //           border: const OutlineInputBorder(
                            //               borderSide: BorderSide(
                            //             color: Colors.teal,
                            //           )),
                            //           focusedBorder: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(3),
                            //             borderSide: const BorderSide(
                            //                 width: 0,
                            //                 color: ColorResource
                            //                     .colorC4CACD), //<-- SEE HERE
                            //           ),
                            //           enabledBorder: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(3),
                            //             borderSide: const BorderSide(
                            //                 width: 0,
                            //                 color: ColorResource
                            //                     .colorC4CACD), //<-- SEE HERE
                            //           ),
                            //           filled: true,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //   ],
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Amount",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "",
                                        totalAmountController,
                                        validationRules: const ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Paying by",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // CustomDropdownButton(
                                      //   dropdownItems: controller.locationStatusValueList,
                                      //   hint: 'Select',
                                      //   value: controller.locationSelectedStatusValueList,
                                      //   onChanged: (val, key) {
                                      //     setState(() {
                                      //       controller.locationSelectedStatusValueList =
                                      //           val;
                                      //     });
                                      //     print(val);
                                      //   },
                                      // ),
                                      CustomDropdownButton(
                                        dropdownItems: locationStatusValueList,
                                        hint: 'Select',
                                        value: controller
                                            .locationSelectedStatusValueList,
                                        onChanged: (selectedLabel, key) {
                                          setState(() {
                                            // Set the selected label
                                            controller
                                                    .locationSelectedStatusValueList =
                                                selectedLabel;

                                            // Get the corresponding value from the map
                                            int selectedValue =
                                                controller.locationStatusMap[
                                                    selectedLabel]!;
                                            controller.paymentType =
                                                selectedValue.toString();
                                            // You can now use selectedValue as needed
                                            print(
                                                selectedValue); // Prints the associated integer value
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Payment Note",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "",
                                        controller.paymentNoteController,
                                        validationRules: const ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
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
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() =>
                                          selectCheckbox = !selectCheckbox);
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgIcon(
                                              selectCheckbox
                                                  ? 'assets/icon/svg/checkbox.svg'
                                                  : 'assets/icon/svg/selectcheck.svg',
                                              height: 18,
                                            ),
                                            const Text(
                                              "  Reward Points ( Maximum 20 allowed per order ) : 120",
                                              // " Reward Points : ${Singleton.instance.currencySymbol ?? ""}${controller.viewCartData.pricedata?.first.availableRewardPoints ?? ""}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              "Reward Points Added Remaining points: 70",
                                              // " Reward Points : ${Singleton.instance.currencySymbol ?? ""}${controller.viewCartData.pricedata?.first.availableRewardPoints ?? ""}",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            // Get.toNamed(Routes.addWarehouse, arguments: {
                            //   'fromScreen': StringResources.addWareHouse
                            // })!
                            //     .then((value) {
                            //   controller.getWarehouse();
                            // });
                            // },
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.only(right: 20),
                            //         child: Container(
                            //           padding: const EdgeInsets.all(10),
                            //           decoration: const BoxDecoration(
                            //               color: ColorResource.color0D5EF8,
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(3.0))),
                            //           height: 40,
                            //           child: const Center(
                            //             child: Text(
                            //               "+ Add More Payment",
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontSize: 14),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(20.0),
                              child: Table(
                                border: TableBorder.all(
                                    color: Colors.black, width: .2),
                                children: [
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Total Items'),
                                            Text(itemCount.toString()),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Total Payable'),
                                            Text(
                                              cartTotalAmount ??
                                                  "No amount provided",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Reward Point'),
                                            Text("20"
                                                //  cartTotalAmount ?? "No amount provided",
                                                ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Balance'),
                                            Text(
                                              remainingAmount
                                                  .toStringAsFixed(2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  //! navigate to payment success screen
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //         PaymentSuccessScreen(),
                                  //   ),
                                  // );
                                  // Get.toNamed(Routes.addWarehouse, arguments: {
                                  //   'fromScreen': StringResources.addWareHouse
                                  //   },
                                  // )!
                                  //     .then((value) {
                                  //   // controller.getWarehouse();
                                  //   },
                                  // );
                                  if (controller.paymentType == null ||
                                      controller.paymentType!.isEmpty) {
                                    showInfoSnackBar(                                      
                                      'Please select Payment Type',
                                    );
                                  } else {
                                    addAddressDialog(context, controller,
                                        Get.arguments['userId'].toString());
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorResource.color0D5EF8,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        3.0,
                                      ),
                                    ),
                                  ),
                                  width: 200,
                                  height: 40,
                                  // width: AppUtils.vs(250, context),
                                  child: const Center(
                                    child: Text(
                                      "Add Address",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //  Container(
                      //   decoration: BoxDecoration(
                      //       border:
                      //           Border.all(color: Color.fromARGB(255, 226, 225, 225))),
                      //   width: 900,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(50.0),
                      //     child: Column(
                      //       children: [
                      //         Row(
                      //           children: [
                      //             const Text(
                      //               "Total Amount : Rs",
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.w600),
                      //             ),
                      //             Text(
                      //               contoller.createOrderData.amount.toString(),
                      //               style: TextStyle(
                      //                   color: Colors.black,
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.w600),
                      //             )
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //           height: 10,
                      //         ),
                      //         Card(
                      //           child: SizedBox(
                      //             height: 230,
                      //             width: double.infinity,
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(10.0),
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   const Text(
                      //                     "select payment option",
                      //                     style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: 18,
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 20,
                      //                   ),
                      //                   RadioListTile(
                      //                     title: Text("Cash"),
                      //                     value: "1",
                      //                     groupValue: contoller.paymentOption,
                      //                     onChanged: (value) {
                      //                       setState(() {
                      //                         contoller.paymentOption =
                      //                             value.toString();
                      //                       });
                      //                     },
                      //                   ),
                      //                   RadioListTile(
                      //                     title: const Text(
                      //                         "Cards (Credit / Debit Cards)"),
                      //                     value: "0",
                      //                     groupValue: contoller.paymentOption,
                      //                     onChanged: (value) {
                      //                       setState(() {
                      //                         contoller.paymentOption =
                      //                             value.toString();
                      //                       });
                      //                     },
                      //                   ),
                      //                   RadioListTile(
                      //                     title: const Text(
                      //                         "UPI Payments ( GPay, Paytm, PhonePe )"),
                      //                     value: "-1",
                      //                     groupValue: contoller.paymentOption,
                      //                     onChanged: (value) {
                      //                       setState(() {
                      //                         contoller.paymentOption =
                      //                             value.toString();
                      //                       });
                      //                     },
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 20,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 20,
                      //         ),
                      //         Card(
                      //           child: SizedBox(
                      //             height: 200,
                      //             width: double.infinity,
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(10.0),
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   const Text(
                      //                     "Delivery Type",
                      //                     style: TextStyle(
                      //                         color: Colors.black,
                      //                         fontSize: 18,
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 20,
                      //                   ),
                      //                   RadioListTile(
                      //                     title: const Text("Pick Up"),
                      //                     value: "1",
                      //                     groupValue: contoller.deliveryType,
                      //                     onChanged: (value) {
                      //                       setState(() {
                      //                         contoller.deliveryType = value.toString();
                      //                       });
                      //                       print(value);
                      //                     },
                      //                   ),
                      //                   RadioListTile(
                      //                     title: const Text("Delivery to Address"),
                      //                     value: "2",
                      //                     groupValue: contoller.deliveryType,
                      //                     onChanged: (value) {
                      //                       setState(() {
                      //                         contoller.deliveryType = value.toString();
                      //                       });
                      //                       print(value);
                      //                     },
                      //                   ),
                      //                   const SizedBox(
                      //                     height: 20,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 20,
                      //         ),
                      //         const SizedBox(
                      //           height: 50,
                      //           child: TextField(
                      //             decoration: InputDecoration(
                      //               border: OutlineInputBorder(),
                      //               hintText: 'Delivery Notes',
                      //             ),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           height: 30,
                      //         ),
                      //         const Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Non Listed Products If Any Please Click Here To Upload (Optional)",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //           height: 20,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             SizedBox(
                      //               height: 40,
                      //               width: 150,
                      //               child: ElevatedButton(
                      //                 style: ElevatedButton.styleFrom(
                      //                   primary: Color.fromARGB(
                      //                       255, 50, 50, 50), // background
                      //                   onPrimary: Colors.white, // foreground
                      //                 ),
                      //                 onPressed: () {
                      //                   // Navigator.of(context).push(MaterialPageRoute(
                      //                   //     builder: (context) =>
                      //                   //         PaymentSuccessScreen()));
                      //                 },
                      //                 child: Text(
                      //                   'Attach file',
                      //                   style: TextStyle(
                      //                     color: Colors.grey[50],
                      //                     fontSize: 16,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //           height: 70,
                      //         ),
                      //         SizedBox(
                      //           height: 45,
                      //           width: double.infinity,
                      //           child: ElevatedButton(
                      //             style: ElevatedButton.styleFrom(
                      //               primary:
                      //                   Color.fromARGB(255, 84, 181, 122), // background
                      //               onPrimary: Colors.white, // foreground
                      //             ),
                      //             onPressed: () {
                      //               contoller.createorder();
                      //             },
                      //             child: Text(
                      //               'Proceed',
                      //               style: TextStyle(
                      //                 color: Colors.grey[50],
                      //                 fontSize: 18,
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

//! get Order Address
Future<void> addAddressDialog(
    BuildContext context, PaymentController controller, String? userId) async {
  final formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        height: 400,
        width: 700,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Add Address",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          "Name",
                          controller.nameController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          "Address",
                          controller.addressController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          "Zip Code",
                          maximumWordCount: 6,
                          controller.zipCodeController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                          onChanged: (text) async {
                            if (text.length == 6) {
                              controller.fetchZipCodeData(pincode: text);
                            }
                            // controller.viewPinCodeCheck();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          "City",
                          controller.cityController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                          isReadOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          "State",
                          controller.stateController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                          isReadOnly: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          "Country",
                          controller.countryController,
                          validationRules: const ['required'],
                          validatorCallBack: (val) {
                            print(val);
                          },
                          isReadOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    "Phone",
                    controller.phoneController,
                    validationRules: const ['required'],
                    validatorCallBack: (val) {
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                // Add address to the order
                                // controller.addAddressToOrder(
                                //   nameController.text,
                                //   addressController.text,
                                //   cityController.text,
                                //   stateController.text,
                                //   countryController.text,
                                //   zipCodeController.text,
                                //   phoneController.text,
                                // );
                                //! create Order
                                if (userId != null) {
                                  controller.createOrder(userId: userId);
                                }
                                
                                // Get.toNamed(Routes.paymentSuccessPage);
                              }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ColorResource.color0D5EF8,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              ),
                              height: 40,
                              child: const Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
