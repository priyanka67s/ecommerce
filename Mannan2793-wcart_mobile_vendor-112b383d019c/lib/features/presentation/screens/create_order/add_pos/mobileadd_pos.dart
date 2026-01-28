import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/controller/poscontoller.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

class MobileAppPos extends StatefulWidget {
  const MobileAppPos({super.key});

  @override
  State<MobileAppPos> createState() => _MobileAppPosState();
}

class _MobileAppPosState extends State<MobileAppPos> {
  List<String> statusDropdownList = ['Warehouse1', "Warehouse2", "Warehouse3"];

  String Value = 'Warehouse1';
  ViewOrderModel ViewProductData = ViewOrderModel();
  TextEditingController searchText = TextEditingController();
  ViewOrderPosController controller = Get.put(ViewOrderPosController());
  // String _selectedCity;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewOrderPosController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
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
            "POS",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1000,
              color: Colors.grey[100],
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomDropdownButton(
                      dropdownItems: statusDropdownList,
                      hint: 'Warehouse1',
                      value: Value,
                      onChanged: (val, key) {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    // controller: controller.searchText,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (term) {},
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.add_box_rounded,
                        size: 20.0,
                        color: Colors.blue,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 7.0, horizontal: 20),
                      hintText: 'Scan/Search the product by name/code',
                      hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 69, 166, 246),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    height: 45,
                    child: const Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Center(
                              child: Text(
                                "Product",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            )),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text("Price",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text("Qty",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text("Subtotal",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)))),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 16,
                            )))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 230,
              child: Column(children: [
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Items"),
                              Text("0",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total"),
                              Text("0.00",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("order Tax"),
                              Text(
                                "0.00",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount"),
                              Text("0.00",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 50, 50),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        height: 40,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Payable",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  )),
                              Text("0.00",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text("Order",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Row(),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text("Bill",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (() {}),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text("Payment",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      );
    });
  }
}
