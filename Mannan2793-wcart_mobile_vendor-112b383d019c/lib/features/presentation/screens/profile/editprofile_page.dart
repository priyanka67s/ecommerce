import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/profile/controller/editprofile_controller.dart';

import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileController controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return Center(child: const CircularProgressIndicator());
      }
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomAppBar(
                  titleText: "Edit profile",
                  onBackButtonPressed: () {},
                ),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: ColorResource.colorFFFFFF,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic Details',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "FirstName",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "FirstName",
                                        controller.firstNameController,
                                        validationRules: ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "LastName",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "LastName",
                                        controller.lastNameController,
                                        validationRules: ['required'],
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
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Email",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "Email",
                                        controller.emailController,
                                        validationRules: ['email'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "MobileNumber",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "MobileNumber",
                                        controller.phoneNumberController,
                                        validationRules: ['email'],
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
                              height: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Address 1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  "Address 1",
                                  controller.address1Controller,
                                  validationRules: ['required'],
                                  validatorCallBack: (val) {
                                    print(val);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Country",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "Country",
                                        controller.countryController,
                                        validationRules: ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Address 2",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "Address 2",
                                        controller.address2Controller,
                                        validationRules: ['required'],
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
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "City",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "City",
                                        controller.cityController,
                                        validationRules: ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "State",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "State",
                                        controller.sateController,
                                        validationRules: ['required'],
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
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand Details',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Enter Brand Name",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Brand Name",
                                          controller.brandNameController),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Brand Logo",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () async {
                                            controller.getImage();
                                          },
                                          child: Container(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            height: 100,
                                            width: 100,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100],
                                            ),
                                            child: DottedBorder(
                                              radius: Radius.circular(10.0),
                                              borderType: BorderType.RRect,
                                              color: Colors.grey.shade800,
                                              child: Stack(
                                                children: [
                                                  controller.imageFile != null
                                                      ? Image.file(
                                                          controller.imageFile!,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Center(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .camera_alt_outlined,
                                                                size: 30,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              Text(
                                                                "Click here",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade800,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "About Brand",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("About Brand",
                                          controller.aboutController),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Business Type",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 55,
                                        child: CustomDropdownButton(
                                          dropdownItems: controller.statusValue,
                                          hint: 'Personal',
                                          value: controller.valueType,
                                          onChanged: (val, key) {
                                            setState(
                                              () {
                                                controller.valueType = val;
                                              },
                                            );
                                            print(val);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Register Number",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "Register Number",
                                        controller.registerNumberController,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "VAT Number",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter VAT Number",
                                          controller.vatNumberController),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "GST Number",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        "GST Number",
                                        controller.gstNumberController,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Website",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Website",
                                          controller.websiteController),
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                const Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Bank Details ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Account Holder",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Account Holder",
                                          controller.accountHolderController)
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Account Number",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Account Number",
                                          controller.accountNumberController)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Bank Name ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Bank Name ",
                                          controller.bankNameController)
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Bank Branch",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Bank Branch",
                                          controller.bankBranchController)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Bank Country ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Bank Country ",
                                          controller.bankCountryController)
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Swift Code",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Enter Swift Code",
                                          controller.swiftCodeController)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Additional Field',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "PAN Number ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(" ",
                                          controller.additionalFiledController)
                                    ],
                                  ),
                                ),
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "text filed",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("",
                                          controller.additionalFiledController)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.updateProfile();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: ColorResource.color0D5EF8,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.0))),
                                      height: 40,
                                      width: AppUtils.vs(250, context),
                                      child: const Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      );
      },
    );
  }
}
