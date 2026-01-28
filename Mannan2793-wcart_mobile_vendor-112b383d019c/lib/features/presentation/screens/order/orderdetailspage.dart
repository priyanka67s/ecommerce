import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/login/loginpage.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/manage_attribute_page.dart';
import 'package:wcart_vendor/features/presentation/screens/order/controller/orderdetails_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  AllOrderController controller = Get.put(AllOrderController());

  bool isToggled = false;
  TextEditingController orderNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllOrderController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');      
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: LayoutBuilder(builder: (context, constraints) {
          UserDeviceType deviceType = getDeviceType(constraints.maxWidth);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomAppBar(
                      titleText: "Manage Orders",
                      onBackButtonPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        color: ColorResource.colorffffff,
                        margin: const EdgeInsets.only(left: 15, right: 7),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: SizedBox(
                                          height: 40,
                                          width: 950,
                                          child: Row(
                                            children: [
                                              const Text(
                                                "View Order",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Order - # Details ${controller.viewAllOrderData.result?.first.ordermapid ?? ''}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                        color: ColorResource.colorDDDDDD,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          generalWidget(
                                            deviceType,
                                            controller,
                                          ),
                                          addressWidget(
                                            controller,
                                          ),
                                          orderNotes(
                                            deviceType,
                                            controller,
                                            context,
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   height: 50,
                                      // ),
                                      const Divider(
                                        thickness: 0.5,
                                        color: ColorResource.colorDDDDDD,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      controller.viewAllOrderData.ordermeta !=
                                                  null &&
                                              controller.viewAllOrderData
                                                  .ordermeta!.isNotEmpty
                                          ? const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Product Detail",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      controller.viewAllOrderData.ordermeta !=
                                                  null &&
                                              controller.viewAllOrderData
                                                  .ordermeta!.isNotEmpty
                                          ? const Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Center(
                                                          child: Text(
                                                        "S.NO",
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
                                                        "Product Image",
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
                                                        "Product",
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
                                                        "Price",
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
                                                        "Quantity",
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
                                                        "Subtotal",
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
                                                        "Shipping Cost",
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
                                                        "Total",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )))
                                                ],
                                              ),
                                            )
                                          : SizedBox(),

                                      controller.viewAllOrderData.ordermeta !=
                                                  null &&
                                              controller.viewAllOrderData
                                                  .ordermeta!.isNotEmpty
                                          ? Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Divider(
                                                  thickness: 0.5,
                                                  color:
                                                      ColorResource.colorDDDDDD,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Expanded(
                                                        flex: 2,
                                                        child: Center(
                                                          child: Text(
                                                            "1",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Container(
                                                            height: 80,
                                                            width: 80,
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/icon/svg/wcartlogo.svg',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            controller
                                                                    .viewAllOrderData
                                                                    .ordermeta?[
                                                                        0]
                                                                    .name ??
                                                                '',
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.viewAllOrderData.ordermeta?.first.price ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.viewAllOrderData.ordermeta?.first.quantity ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.viewAllOrderData.ordermeta?.first.totalAmount ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.viewAllOrderData.ordermeta?.first.shippingCost ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Center(
                                                          child: Text(
                                                            "${controller.viewAllOrderData.ordermeta?.first.totalAmount ?? ''}",
                                                            style: const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : SizedBox(),

                                      controller.viewAllOrderData.ordermeta !=
                                                  null &&
                                              controller.viewAllOrderData
                                                  .ordermeta!.isNotEmpty
                                          ? Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Divider(
                                                  thickness: 0.5,
                                                  color:
                                                      ColorResource.colorDDDDDD,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 40,
                                                    color: Colors.grey[50],
                                                    child: const Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "Billing Details",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            )
                                          : SizedBox(),

                                      controller.viewAllOrderData.ordermeta !=
                                                  null &&
                                              controller.viewAllOrderData
                                                  .ordermeta!.isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: 700,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: ColorResource
                                                        .colorDDDDDD,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'subtotal:',
                                                          ),
                                                          Text(
                                                            controller
                                                                    .viewAllOrderData
                                                                    .ordermeta?[
                                                                        0]
                                                                    .subtotal ??
                                                                "0.0"
                                                                    .toString(),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Exchange Credit: (-):'),
                                                          Text(controller
                                                                  .viewAllOrderData
                                                                  .ordermeta?[0]
                                                                  .exchangeOrderCredit
                                                                  .toString() ??
                                                              "0.0")
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('shipping:'),
                                                          Text(
                                                            controller
                                                                    .viewAllOrderData
                                                                    .ordermeta?[
                                                                        0]
                                                                    .totalShippingCost
                                                                    .toString() ??
                                                                "0.0",
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Coupon Code:'),
                                                          Text(controller
                                                                  .viewAllOrderData
                                                                  .ordermeta?[0]
                                                                  .couponCode ??
                                                              "0.0".toString())
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Coupon Amount:'),
                                                          Text(controller
                                                                  .viewAllOrderData
                                                                  .ordermeta?[0]
                                                                  .couponAmount
                                                                  .toString() ??
                                                              "0.0")
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Tax:'),
                                                          Text(controller
                                                                  .viewAllOrderData
                                                                  .ordermeta?[0]
                                                                  .tax
                                                                  .toString() ??
                                                              "0.0")
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: ColorResource
                                                          .colorDDDDDD,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('cart Total:'),
                                                          Text(
                                                            controller
                                                                    .viewAllOrderData
                                                                    .ordermeta?[
                                                                        0]
                                                                    .ordertotal
                                                                    .toString() ??
                                                                "0.0",
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
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
          );
        }),
      );
    });
  }

  Expanded orderNotes(UserDeviceType deviceType, AllOrderController controller,
      BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "  Order Notes",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.5,
              color: ColorResource.colorDDDDDD,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    height: 65,
                    width: getCategoryContainerSize(deviceType, 350),
                    child: CustomTextField(
                        "Add Note", controller.orderNoteController))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                FlutterSwitch(
                  height: 20.0,
                  width: 40.0,
                  padding: 4.0,
                  toggleSize: 15.0,
                  borderRadius: 10.0,
                  activeColor: ColorResource.color0D5EF8,
                  value: isToggled,
                  onToggle: (value) {
                    setState(() {
                      isToggled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.addOrderNote();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorResource.color0D5EF8,
                          borderRadius: BorderRadius.all(Radius.circular(3.0))),
                      height: AppUtils.vs(55, context),
                      width: AppUtils.vs(150, context),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  'Order Logs',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 0.5,
              color: ColorResource.colorDDDDDD,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '${controller.viewAllOrderData.orderlogs?[0].createdtime.toString()}',
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${controller.viewAllOrderData.orderlogs?[0].statusNote.toString()}',
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded addressWidget(AllOrderController controller) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "  Address",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.5,
              color: ColorResource.colorDDDDDD,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(controller.viewAllOrderData.result?.first.addressline1 ??
                    ''),
                Text(controller.viewAllOrderData.result?.first.addressline2 ??
                    '')
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(controller.viewAllOrderData.result?.first.city ?? ''),
                Text(controller.viewAllOrderData.result?.first.state ?? '')
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(controller.viewAllOrderData.result?.first.country ?? ''),
                Text(
                    " ,${controller.viewAllOrderData.result?.first.pincode ?? ''}")
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text("Email Id"),
                Text(
                    ":${controller.viewAllOrderData.result?.first.emailId ?? ''}")
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text("Phone Number "),
                Text(
                    ":${controller.viewAllOrderData.result?.first.phone ?? ''}")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded generalWidget(
      UserDeviceType deviceType, AllOrderController controller) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "General",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.5,
              color: ColorResource.colorDDDDDD,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: getCategoryContainerSize(deviceType, 400),
              child: Row(
                children: [
                  const Text(
                    "Order Status :",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 45,
                    width: getCategoryContainerSize(deviceType, 200),
                    child: CustomDropdownButton(
                      dropdownWidth: getCategoryContainerSize(deviceType, 250),
                      dropdownItems: controller.orderStatusList,
                      hint: 'Select',
                      value: controller.manageorderstatusValuelist,
                      onChanged: (val, status) {
                        orderChange(ordervalue: val, orderStatus: status);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 15,
              color: ColorResource.colorffffff,
            ),
            Row(
              children: [
                const Text("Customer Name :"),
                Text(controller.viewAllOrderData.result?.first.name ?? '')
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text("Order Total :"),
                Text(
                    "${controller.viewAllOrderData.result?.first.amount ?? ''}")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> orderChange(
      {required String ordervalue, required int orderStatus}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you really want to change status for order'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    controller.updateOrderStatus(
                        ordervalue: ordervalue,
                        selectedOrderStatus: orderStatus);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
