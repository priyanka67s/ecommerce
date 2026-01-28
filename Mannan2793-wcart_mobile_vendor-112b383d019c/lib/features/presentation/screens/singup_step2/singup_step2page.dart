import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:wcart_vendor/features/presentation/screens/singup_step2/controller/singup2_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';

import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class SingUp2Page extends StatefulWidget {
  const SingUp2Page({super.key});

  @override
  State<SingUp2Page> createState() => _SingUp2PageState();
}

class _SingUp2PageState extends State<SingUp2Page> {
  List<String> listValue = ['Personal', 'Registered'];
  String value = 'Type of Business';
  final formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  SignUp2Controller controller = Get.put(SignUp2Controller());

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<SignUp2Controller>(builder: (controller) {
    //   print('screen status ---> ${controller.status.isLoading}');
    //   if (controller.status.isLoading) {
    //     return Center(child: CircularProgressIndicator());
    //   }
    return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: ColorResource.color000000,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                'SingUp Step 2 ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorResource.color000000,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                color: ColorResource.colorFFFFFF,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Brand and Company details ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async {
                                    controller.getImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: ColorResource.colorF3F4F8,
                                    child: controller.imageFile != null
                                        ? Image.file(controller.imageFile!)
                                        : const SvgIcon(
                                            'assets/icon/svg/camer.svg',
                                            height: 30,
                                          ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomTextField("Enter Brand Name",
                                  controller.brandNameController),
                            ),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 10,
                              child: SizedBox(
                                height: 55,
                                child: CustomDropdownButton(
                                  dropdownItems: controller.statusValue,
                                  hint: 'Personal',
                                  value: controller.value2,
                                  onChanged: (val, key) {
                                    setState(() {
                                      controller.value2 = val;
                                    });
                                    print(val);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  "About Brand", controller.aboutController),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomTextField(
                                  "Enter Company Registration Number",
                                  controller.registerNumberController),
                            ),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 10,
                              child: CustomTextField("Enter Website Address",
                                  controller.websiteController),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomTextField("Enter VAT Number",
                                  controller.vatNumberController),
                            ),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Enter GST Number",
                                    controller.gstNumberController)),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Bank Details ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: CustomTextField(
                                    "Name of the Account Holder",
                                    controller.accountHolderController)),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Bank Account Number",
                                    controller.accountNumberController)),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Enter Bank Name",
                                    controller.bankNameController)),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Enter Bank Branch",
                                    controller.bankBranchController)),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Enter Bank Country",
                                    controller.bankCountryController)),
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                                flex: 10,
                                child: CustomTextField("Enter swift code",
                                    controller.swiftCodeController)),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Additional Field',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ListView.builder(
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     shrinkWrap: true,
                        //     itemCount: controller
                        //         .formFiledData.additionalFields?.length,
                        //     itemBuilder: (context, i) {
                        //       return Padding(
                        //         padding: const EdgeInsets.all(5.0),
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               controller
                        //                       .formFiledData
                        //                       .additionalFields?[i]
                        //                       .formFieldName ??
                        //                   "",
                        //               style: const TextStyle(
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             const SizedBox(
                        //               height: 15,
                        //             ),
                        // SizedBox(
                        //   child: vendorFormField(
                        //       fieldType: controller
                        //           .formFiledData
                        //           .additionalFields![i]
                        //           .formFieldType!,
                        //       textFieldController: controller
                        //           .formFiledData
                        //           .additionalFields![i]
                        //           .textController!,
                        //       fieldName: controller
                        //           .formFiledData
                        //           .additionalFields?[i]
                        //           .formFieldName),
                        // ),
                        //             const SizedBox(
                        //               height: 15,
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     }),

                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                                  .formFiledData.additionalFields?.length ??
                              0,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller
                                            .formFiledData
                                            .additionalFields?[i]
                                            .formFieldName ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    child: vendorFormField(
                                      fieldType: controller.formFiledData
                                          .additionalFields![i].formFieldType!,
                                      textFieldController: controller
                                          .formFiledData
                                          .additionalFields![i]
                                          .textController!,
                                      fieldName: controller.formFiledData
                                          .additionalFields?[i].formFieldName,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            );
                          },
                        ),

                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  print('object');
                                  controller.signup2().then((value) {
                                    print('object ===== $value');
                                    // if (value) {
                                    //   Get.toNamed(Routes.login);
                                    // }
                                  });
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: ColorResource.color0D5EF8,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0))),
                                  height: AppUtils.vs(65, context),
                                  width: AppUtils.vs(280, context),
                                  child: const Center(
                                    child: Text(
                                      "Complete Registration",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
    // });
  }

  Widget vendorFormField({
    required int fieldType,
    required TextEditingController textFieldController,
    String? fieldName,
  }) {
    Widget vendorField = const SizedBox();
    switch (fieldType) {
      case 1:
        vendorField = CustomTextField(fieldName ?? '', textFieldController);
        break;
      case 2:
        vendorField = CustomTextField(
          "",
          textFieldController,
          maxLines: 5,
          keyBoardType: TextInputType.multiline,
        );
        break;
      case 3:
        vendorField = ElevatedButton(
          child: const Text('UPLOAD FILE'),
          onPressed: () async {
            var picked = await FilePicker.platform.pickFiles();

            if (picked != null) {
              print(picked.files.first.name);
            }
          },
        );
        break;
    }
    return vendorField;
  }

  // Widget buildVendorFormField({
  //   required int fieldType,
  //   required TextEditingController textFieldController,
  //   String? fieldName,
  // }) {
  //   Widget vendorField = const SizedBox();
  //   switch (fieldType) {
  //     case 1:
  //       vendorField = Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(fieldName ?? "", style: const TextStyle(fontSize: 12)),
  //           CustomTextField(fieldName ?? '', textFieldController),
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
  //             textFieldController,
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
}
