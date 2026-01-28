import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class MobileSalesSignUp extends StatefulWidget {
  const MobileSalesSignUp({super.key});

  @override
  State<MobileSalesSignUp> createState() => _MobileSalesSignUpState();
}

class _MobileSalesSignUpState extends State<MobileSalesSignUp> {
  List<String> listValue = ['+91', '+99', '+98'];
  String value = '+91';
  TextEditingController customernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countrycodeController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Add Sales person",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField("Enter Name", customernameController),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField("Enter email", emailController),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Mobile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: Column(
                      children: [
                        CustomDropdownButton(
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
                      ],
                    ),

                    // CustomTextField("countrycode",
                    //     controller.countrycodeController),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      height: 50,
                      width: 255,
                      child: CustomTextField(
                        "MobileNumber",
                        mobilenoController,
                        validationRules: ['mobile_number'],
                        validatorCallBack: (val) {
                          print(val);
                        },
                      )),
                ],
              ),
              SizedBox(
                width: 25,
              ),
              Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField("Enter Password", passwordController),
              SizedBox(
                height: 15,
              ),
              SizedBox(
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
                  onPressed: () {
                    // controller.addcustomer();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.grey[50]),
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
