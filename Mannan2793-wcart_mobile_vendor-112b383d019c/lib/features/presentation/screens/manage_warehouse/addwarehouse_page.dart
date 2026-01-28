import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/controller/addwarehouse_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddWarehousePage extends StatefulWidget {
  const AddWarehousePage({super.key});

  @override
  State<AddWarehousePage> createState() => _AddWarehousePageState();
}

class _AddWarehousePageState extends State<AddWarehousePage> {
  final formKey = GlobalKey<FormState>();
  AddWareHouseController controller = Get.put(AddWareHouseController());

  List<String> listValue = ['+91', '+99', '+98'];
  String value = '+91';
  bool isMobileValidate = true;

@override
  void initState() {
    if (Get.arguments['fromScreen'] == StringResources.editWareHouse) {
      // Here get view the tag data
      controller.updateWarehouseData(context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddWareHouseController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                titleText: 'Add store details',
                onBackButtonPressed: () {},
                isLoading: controller.status.isLoading,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
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
                                  CustomTextField(
                                    "Enter Location",
                                    controller.locationTileController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                    "Contact Person Name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Enter Name",
                                    controller.contactPersonNameController,
                                    validationRules: const ['required'],
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
                            hintStyle: TextStyle(
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
                                  color:
                                      ColorResource.colorC4CACD), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color:
                                      ColorResource.colorC4CACD), //<-- SEE HERE
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
                                    "City",
                                    controller.cityController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                    controller.stateController,
                                    validationRules: const ['required'],
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
                                  CustomTextField(
                                    "country",
                                    controller.countryController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                      labelStyle: const TextStyle(fontSize: 14),
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
                                        // controller.viewPinCodeCheck();
                                      }
                                    },
                                  ),
                                  // CustomTextField(
                                  //   "Pincode",
                                  //   controller.pinCodeController,
                                  //   validationRules: const ['required'],
                                  //   validatorCallBack: (val) {
                                  //     print(val);
                                  //   },
                                  // ),
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
                                    "Google_map_url",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Google_map_url",
                                    controller.googleMapUrlController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                    "Email Id",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Email Id",
                                    controller.emailIdController,
                                    validationRules: const ['email'],
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
                                    "Mobile Number ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Mobile Number ",
                                    controller.phoneNoController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                    "Landline State Code",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Enter Landline State Code",
                                    controller.lStateCodeController,
                                    validationRules: const ['required'],
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
                                    "Landline Country Code",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Enter Landline Country Code ",
                                    controller.lCountryCodeController,
                                    validationRules: const ['required'],
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
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
                                    "Landline Number",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Landline Number",
                                    controller.landLineNumberController,
                                    validationRules: const ['required'],
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
                                    "Default Location",
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
                                      dropdownWidth:
                                          MediaQuery.of(context).size.width /
                                              2.20,
                                      offset: const Offset(0, -10),
                                      dropdownItems:
                                          controller.defaultLocationValueList,
                                      hint: 'select',
                                      value: controller
                                          .defaultSelectedLocationValueList,
                                      onChanged: (val, key) {
                                        setState(() {
                                          controller
                                                  .defaultSelectedLocationValueList =
                                              val;
                                        });
                                        print(val);
                                      },
                                    ),
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
                                    "Warehouse Status",
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
                                      dropdownWidth:
                                          MediaQuery.of(context).size.width /
                                              2.20,
                                      offset: const Offset(0, -10),
                                      dropdownItems:
                                          controller.wareHouseStatusValueList,
                                      hint: 'select',
                                      value: controller
                                          .wareHouseSelectedStatusValueList,
                                      onChanged: (val, key) {
                                        setState(() {
                                          controller
                                                  .wareHouseSelectedStatusValueList =
                                              val;
                                        });
                                        print(val);
                                      },
                                    ),
                                  ),
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
                                    "Location Order",
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
                                      dropdownWidth:
                                          MediaQuery.of(context).size.width /
                                              2.20,
                                      offset: const Offset(0, -10),
                                      dropdownItems:
                                          controller.locationStatusValueList,
                                      hint: 'select',
                                      value: controller
                                          .locationSelectedStatusValueList,
                                      onChanged: (val, key) {
                                        setState(() {
                                          controller
                                                  .locationSelectedStatusValueList =
                                              val;
                                        });
                                        print(val);
                                      },
                                    ),
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
                                    "Active Territory",
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
                                        dropdownWidth:
                                            MediaQuery.of(context).size.width /
                                                2.20,
                                        offset: const Offset(0, -10),
                                        hint: 'Select',
                                        value: controller.selectedTerritory,
                                        dropdownItems:
                                            controller.territoryDropdownList,
                                        onChanged: (selectedValue, index) {
                                          controller.activeTerritoryData
                                              .activeTerritoryLocations
                                              ?.forEach(
                                            (element) {
                                              if (element.locationTitle ==
                                                  selectedValue) {
                                                controller
                                                    .updateSeletedterritory(
                                                        selectedValue);
                                                controller.addWarehouse(
                                                    territoryid:
                                                        element.territoryId,
                                                    context: context);
                                              }
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 40,
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
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    formKey.currentState?.save();
                                  }
                                  controller.addWarehouse(context: context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: ColorResource.color0D5EF8,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    height: 40,
                                    width: AppUtils.vs(200, context),
                                    child: Center(
                                      child: Text(
                                        (Get.arguments?['fromScreen'] ==
                                                StringResources.addWareHouse)
                                            ? 'Submit'
                                            : 'Update',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
