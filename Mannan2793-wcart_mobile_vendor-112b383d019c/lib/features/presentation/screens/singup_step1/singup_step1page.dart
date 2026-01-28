import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/features/presentation/screens/login/screens/signup/controller/singup_step1controller.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

import '../login/screens/signup/signup_screen.dart';

class SingUpStep1Page extends StatefulWidget {
  const SingUpStep1Page({super.key});

  @override
  State<SingUpStep1Page> createState() => _SingUpStep1PageState();
}

class _SingUpStep1PageState extends State<SingUpStep1Page> {
  final formKey = GlobalKey<FormState>();

  bool? check1 = false;
  String dropDownValue = 'Item 1';

  List<String> listValue = ['+91', '+99', '+98'];
  String value = '+91';
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        appBar: AppBar(
          backgroundColor: ColorResource.colorF3F4F8,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: ColorResource.color000000,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          title: Row(
            children: [
              Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorResource.color000000,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        body: signUpScreen(controller, context, formKey, () {}),
      );

      // Widget vendorFormField({
      //   required int fieldType,
      //   required TextEditingController textFieldController,
      //   String? fieldName,
      // }) {
      //   Widget vendorField = const SizedBox();
      //   switch (fieldType) {
      //     case 1:
      //       vendorField = CustomTextField(fieldName ?? '', textFieldController);
      //       break;
      //     case 2:
      //       vendorField = CustomTextField(
      //         "",
      //         textFieldController,
      //         maxLines: 5,
      //         keyBoardType: TextInputType.multiline,
      //       );
      //       break;
      //     case 3:
      //       vendorField = ElevatedButton(
      //         child: const Text('UPLOAD FILE'),
      //         onPressed: () async {
      //           var picked = await FilePicker.platform.pickFiles();

      //           if (picked != null) {
      //             print(picked.files.first.name);
      //           }
      //         },
      //       );
      //       break;
      //   }
      //   return vendorField;
      // }

      // Widget buildVendorFormField({
      //   required String fieldType,
      //   required String textFieldController,
      //   String? fieldName,
      // }) {
      //   Widget vendorField = const SizedBox();
      //   switch (fieldType) {
      //     case 1:
      //       vendorField = Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
      //           CustomTextField(
      //               fieldName ?? '', textFieldController as TextEditingController),
      //         ],
      //       );
      //       break;
      //     case 2:
      //       vendorField = Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
      //           CustomTextField(
      //             "",
      //             textFieldController as TextEditingController,
      //             maxLines: 5,
      //             keyBoardType: TextInputType.multiline,
      //           ),
      //         ],
      //       );
      //       break;
      //     case 3:
      //       vendorField = ElevatedButton(
      //         child: const Text('UPLOAD FILE'),
      //         onPressed: () async {
      //           var picked = await FilePicker.platform.pickFiles();

      //           if (picked != null) {
      //             print(picked.files.first.name);
      //           }
      //         },
      //       );
      //       break;
      //   }
      //   return vendorField;
      // }

      // Widget buildVendorFormField({
      //   required String fieldType,
      //   required TextEditingController textFieldController,
      //   String? fieldName,
      // }) {
      //   return Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       // Optional: Uncomment if you want to show the field name
      //       // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
      //       CustomTextField(
      //         fieldName ?? "",
      //         textFieldController,
      //         maxLines: 5,
      //         keyBoardType: TextInputType.multiline,
      //       ),
      //     ],
      //   );
      // }
    });
  }

  Widget buildVendorFormField({
    required String fieldType,
    required TextEditingController textFieldController,
    String? fieldName,
  }) {
    switch (fieldType) {
      case 'text':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            CustomTextField(
              "",
              textFieldController,
              maxLines: 5,
              keyBoardType: TextInputType.multiline,
            ),
          ],
        );
      case 'email':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            // TextField(
            //   controller: textFieldController,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            CustomTextField(
              "",
              textFieldController,
              maxLines: 5,
              keyBoardType: TextInputType.multiline,
            ),
          ],
        );
      case 'select':
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
          // TextField(
          //   controller: textFieldController,
          //   keyboardType: TextInputType.emailAddress,
          // ),
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
          ),
        ]);
      case 'number':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            // TextField(
            //   controller: textFieldController,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            CustomTextField(
              "",
              textFieldController,
              maxLines: 5,
              keyBoardType: TextInputType.multiline,
            ),
          ],
        );
      case 'password':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            // TextField(
            //   controller: textFieldController,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            CustomTextField(
              "",
              textFieldController,
              maxLines: 5,
              keyBoardType: TextInputType.multiline,
            ),
          ],
        );
      case 'tel':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            // TextField(
            //   controller: textFieldController,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            CustomTextField(
              "",
              textFieldController,
              maxLines: 5,
              keyBoardType: TextInputType.multiline,
            ),
          ],
        );
      case 'file':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
            // TextField(
            //   controller: textFieldController,
            //   keyboardType: TextInputType.emailAddress,
            // ),
            ElevatedButton(
              child: const Text('UPLOAD FILE'),
              onPressed: () async {
                var picked = await FilePicker.platform.pickFiles();

                if (picked != null) {
                  print(picked.files.first.name);
                }
              },
            )
          ],
        );
      // Implement textarea field widget

      // Add cases for other field types as needed
    }
    return const SizedBox();
  }
}
