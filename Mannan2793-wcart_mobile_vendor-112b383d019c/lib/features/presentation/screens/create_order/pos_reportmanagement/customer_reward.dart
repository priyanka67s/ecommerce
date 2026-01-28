import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/pos_reportmanagement/controller/lowstock_contoller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/dateformate.dart';

class CustomerRewardPage extends StatefulWidget {
  const CustomerRewardPage({super.key});

  @override
  State<CustomerRewardPage> createState() => _CustomerRewardPageState();
}

class _CustomerRewardPageState extends State<CustomerRewardPage> {
  LowStockController controller = Get.put(LowStockController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LowStockController>(builder: (controller) {
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
                    titleText: "Customer Reward Points",
                    onBackButtonPressed: () {},
                  ),
                  
                  Expanded(
                    flex: 15,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 7),
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 300,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Search Customer',
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter your name',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null; // Return null if the input is valid
                                        },
                                        onSaved: (value) {
                                          // Save the input value
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Text("Order Map Id",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                      flex: 3,
                                      child: Text("Reward Points",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                      flex: 3,
                                      child: Text("Total Amount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                      flex: 3,
                                      child: Text("Expiry Date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                  // Expanded(
                                  //     flex: 3,
                                  //     child: Text("Points Earned",
                                  //         style: TextStyle(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.bold))),
                                  Expanded(
                                      flex: 3,
                                      child: Text("Total Points Available",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                  // Expanded(
                                  //     flex: 3,
                                  //     child: Text("Points Redeemed",
                                  //         style: TextStyle(
                                  //             fontSize: 14,
                                  //             fontWeight: FontWeight.bold))),
                                  Expanded(
                                      flex: 3,
                                      child: Text("Action",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ),
                            const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD),
                            Expanded(
                              child: ListView.separated(
                                itemCount: controller.rewardPointTransactionData
                                        .rewardTransactions?.length ??
                                    0,
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                      color: ColorResource.colorDDDDDD,
                                      thickness: 0.5);
                                },
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            flex: 4,
                                            child: Text(
                                                controller
                                                        .rewardPointTransactionData
                                                        .rewardTransactions?[
                                                            index]
                                                        .ordermapid
                                                        .toString() ??
                                                    "",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                                controller
                                                        .rewardPointTransactionData
                                                        .rewardTransactions?[
                                                            index]
                                                        .remainingPoints
                                                        .toString() ??
                                                    "",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                                controller
                                                        .rewardPointTransactionData
                                                        .rewardTransactions?[
                                                            index]
                                                        .earnPoints
                                                        .toString() ??
                                                    "",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                                formatOrderDate(
                                                      controller
                                                              .rewardPointTransactionData
                                                              .rewardTransactions?[
                                                                  index]
                                                              .expiredDate
                                                              .toString() ??
                                                          "",
                                                    ) ??
                                                    '',
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                                controller
                                                        .rewardPointTransactionData
                                                        .rewardTransactions?[
                                                            index]
                                                        .remainingPoints
                                                        .toString() ??
                                                    "",
                                                style:
                                                    TextStyle(fontSize: 14))),
                                        // const Expanded(
                                        //     flex: 3,
                                        //     child: Text("100",
                                        //         style: TextStyle(fontSize: 14))),
                                        Expanded(
                                          flex: 3,
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,

                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(Routes
                                                    .rewardTransactionHistory);
                                              },
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 80),
                                                child: Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
          ],
        ),
      );
    });
  }
}
