import 'package:flutter/material.dart';
import '../../../../../util/color_resource.dart';
import '../../../../../util/svg_icon.dart';
import '../../../widgets/textformfield.dart';
import '../../salemanlogin/salemanContoller.dart';
import '../loginpage.dart';

Widget staffLogin(
  SaleManController controller,
  BuildContext context,
  GlobalKey<FormState> formKey,
  VoidCallback back,
  UserDeviceType deviceType,
) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 600,
          width: 500,
          decoration: BoxDecoration(
            color: ColorResource.colorFFFFFF,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgIcon(
                          'assets/icon/svg/wcartlogo.svg',
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    "Email",
                    controller.saleManUserNameController,
                    validationRules: ['email'],
                    validatorCallBack: (val) {
                      print(val);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    "Password",
                    controller.saleManPassWordController,
                    validationRules: ['required'],
                    validatorCallBack: (val) {
                      print(val);
                    },
                    // suffixWidget: Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    //   child: GestureDetector(
                    //     onTap: _toggleObscured,
                    //     child: Icon(
                    //       color: Colors.amber,
                    //       _obscureText
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded,
                    //       size: 24,
                    //     ),
                    //   ),
                    // ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // SizedBox(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Colors.blue, // background
                  //       onPrimary: Colors.white, // foreground
                  //     ),
                  //     onPressed: () {
                  //       if (formKey.currentState?.validate() ?? false) {
                  //         formKey.currentState?.save();

                  //         controller.staffLogin();
                  //       }
                  //       print('object');
                  //       // controller.login();
                  //     },
                  //     child: Text(
                  //       'login',
                  //       style: TextStyle(
                  //           color: Colors.grey[50], fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          formKey.currentState?.save();

                          controller.staffLogin();
                        }
                        print('object');
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0))),
                        height: 40,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  continueOrWidget(context, deviceType),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Go to vendor login",
                      style: TextStyle(
                        color: Color(0xFF8A8B8B),
                        fontSize: getContentDeviceSize(deviceType, 16),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        back();
                      },
                      child: Text(
                        "Vendor login",
                        style: TextStyle(
                          color: Color(0xFF0893d1),
                          fontWeight: FontWeight.bold,
                          fontSize: getContentDeviceSize(deviceType, 17),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
