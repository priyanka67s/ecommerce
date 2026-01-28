import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class DesktopSaleSignUp extends StatefulWidget {
  const DesktopSaleSignUp({super.key});

  @override
  State<DesktopSaleSignUp> createState() => _DesktopSaleSignUpState();
}

class _DesktopSaleSignUpState extends State<DesktopSaleSignUp> {
  List<String> listValue = ['+91', '+99', '+98'];
  List<String> listValue1 = ['Administrator', 'Staf', '+98'];
  List<String> listValue2 = ['Chennai', '', ''];

  String value2 = 'Chennai';
  String value = '+91';
  String value1 = 'Administrator';
  TextEditingController customernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE1F1FF),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
            ),
          ),
          title: Text(
            "Add Sale Preson Details",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 7, 0),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 226, 225, 225))),
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sales Person Details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 35,
                            width: 180,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black, // foreground
                              ),
                              onPressed: () {
                                _addLocation();
                              },
                              child: Text(
                                'Add New Location',
                                style: TextStyle(color: Colors.grey[50]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "First Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    "Enter Firstname", emailController),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 0,
                              )),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    "Entre Lastname", emailController),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NickName",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    " Enter Nickname", emailController),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 0,
                              )),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 90,
                                      child: CustomDropdownButton(
                                        dropdownItems: listValue,
                                        hint: '+91',
                                        value: value,
                                        onChanged: (val, key) {
                                          setState(() {
                                            value = val;
                                          });
                                          print(val);
                                        },
                                      ),

                                      // CustomTextField("countrycode",
                                      //    countrycodeController),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                        height: 45,
                                        width: 370,
                                        child: CustomTextField(
                                          "MobileNumber",
                                          emailController,
                                          validationRules: ['mobile_number'],
                                          validatorCallBack: (val) {
                                            print(val);
                                          },
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(" Enter Pin", emailController),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 0,
                              )),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Confirm Pin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    "Enter ConfirmPin", emailController),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    " Enter Password", emailController),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 0,
                              )),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Confirm Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    " Enter Password", emailController),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Role",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 500,
                                  child: CustomDropdownButton(
                                    dropdownItems: listValue1,
                                    hint: 'Administrator',
                                    value: value1,
                                    onChanged: (val, key) {
                                      setState(() {
                                        value1 = val;
                                      });
                                      print(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 0,
                              )),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black, // foreground
                              ),
                              onPressed: () {
                                // controller.addwarehouse().then((value) => {
                                //       if (value) {Get.back(result: value)}
                                //     });
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(color: Colors.grey[50]),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ),
              )),
        ));
  }

  Future<void> _addLocation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Location'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: 500,
                  child: CustomDropdownButton(
                    dropdownItems: listValue2,
                    hint: 'Choose Location',
                    value: value2,
                    onChanged: (val, key) {
                      setState(() {
                        value2 = val;
                      });
                      print(val);
                    },
                  ),
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
                  child: const Text('Ok'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
