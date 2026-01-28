import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MobilePaymentPos extends StatefulWidget {
  const MobilePaymentPos({super.key});

  @override
  State<MobilePaymentPos> createState() => _MobilePaymentPosState();
}

class _MobilePaymentPosState extends State<MobilePaymentPos> {
  String gender = "male";
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Total Amount :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " Rs 547",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "select payment option",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RadioListTile(
                          title: Text("Visa Card"),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("Cash On Delivery"),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Delivery Notes',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
