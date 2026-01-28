import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/controller/addstorelocation_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddStoreLocationPage extends StatefulWidget {
  const AddStoreLocationPage({super.key});

  @override
  State<AddStoreLocationPage> createState() => _AddStoreLocationPageState();
}

class _AddStoreLocationPageState extends State<AddStoreLocationPage> {
  final formKey = GlobalKey<FormState>();
  List<String> listValue = ['+91', '+99', '+98'];
  String value = '+91';
  AddStoreLocationController controller = Get.put(AddStoreLocationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStoreLocationController>(builder: (controller) {
      return Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                titleText: "Add store ",
                onBackButtonPressed: () {},
                isLoading: controller.status.isLoading,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration:
                      const BoxDecoration(color: ColorResource.colorFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Location Title",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField("Enter Location",
                                        controller.storeLocationTileController),
                                  ],
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 0,
                                  )),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Contact Person Name",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField("Enter Name",
                                        controller.contactPersonNameController),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Select Territory",
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
                                          hint: 'Select',
                                          value: controller.selectedTerritory,
                                          dropdownItems:
                                              controller.territoryDropdownList,
                                          onChanged: (selectedValue, index) {
                                            controller.updateSelectTerritory(
                                                selectedValue);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 0,
                                  )),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Select Warehouse",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 55,
                                      child: CustomDropdownButton(
                                          hint: 'Select',
                                          value: controller.selectedWarehouse,
                                          dropdownItems: controller
                                              .territoryBasedWarehouseDropdownList
                                              .toSet()
                                              .toList(),
                                          onChanged: (selectedValue, index) {
                                            controller
                                                .updateSelectWarehouseTerritory(
                                                    selectedValue);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Address Line 1",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.addressLine1Controller,
                            maxLines: 2,
                            // expands: true,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Address Line 1",
                              hintStyle: const TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontWeight: FontWeight.w400),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: const BorderSide(
                                    width: 0,
                                    color: ColorResource
                                        .colorC4CACD), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: const BorderSide(
                                    width: 0,
                                    color: ColorResource
                                        .colorC4CACD), //<-- SEE HERE
                              ),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "City",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.color252525,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField(
                                        "City", controller.cityController),
                                  ],
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 0,
                                  )),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "State", controller.stateController),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    CustomTextField("country",
                                        controller.countryController),
                                  ],
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 0,
                                  )),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Pincode",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: controller.pinCodeController,
                                      // maxLength: 6,
                                      decoration: InputDecoration(
                                        labelText: 'Enter Pincode',
                                        labelStyle:
                                            const TextStyle(fontSize: 14),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey,
                                              width:
                                                  0.5), // Customize color and width here
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResource.colorC4CACD,
                                              width:
                                                  1.0), // Customize color and width here
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResource.colorC4CACD,
                                              width:
                                                  1.0), // Customize color and width here
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: ColorResource.colorC4CACD,
                                              width:
                                                  1.0), // Customize color and width here
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onChanged: (text) {
                                        if (text.length == 6) {
                                          controller.viewPinCodeCheck();
                                        }
                                      },
                                    ),

                                    // CustomTextField(
                                    //     "Pincode", controller.pinCodeController),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Mobile Number ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
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
                                      //     controller.countrycodeController),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      " ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField("Mobile Number ",
                                        controller.phoneNoController),
                                  ],
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 0,
                                  )),
                              Expanded(
                                flex: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email Id",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField("Email Id",
                                        controller.emailIdController),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 12,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Google_map_url",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField("Google_map_url",
                                          controller.googleMapUrlController),
                                    ],
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: AppUtils.vs(65, context),
                                    width: AppUtils.vs(200, context),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorResource.color0D5EF8),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(3.0))),
                                    child: const Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: ColorResource.color0D5EF8,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.addStoreLocation();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: ColorResource.color0D5EF8,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      height: AppUtils.vs(65, context),
                                      width: AppUtils.vs(200, context),
                                      child: Center(
                                        child: Text(
                                          Get.arguments != null
                                              ? (Get.arguments!['fromScreen'] ==
                                                      StringResources
                                                          .editStoreLocation)
                                                  ? 'Save Changes'
                                                  : 'Save'
                                              : 'Save',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
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
    }
    );
  }
}
