import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/widgets/multi_dropdown_widgets.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/controller/addstaff_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

//! new staff add page
class AddNewStaffWareHouse extends StatefulWidget {
  const AddNewStaffWareHouse({super.key});

  @override
  State<AddNewStaffWareHouse> createState() => _AddNewStaffWareHouseState();
}

class _AddNewStaffWareHouseState extends State<AddNewStaffWareHouse> {
  AddNewWareHouseStaffController controller =
      Get.put(AddNewWareHouseStaffController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewWareHouseStaffController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomAppBar(
                      titleText: Get.arguments != null &&
                              (Get.arguments['fromScreen'] ==
                                  StringResources.editStaff)
                          ? 'Edit Staff'
                          : 'Add New Staff',
                      onBackButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: ColorResource.colorFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "User Name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField(
                                            "",
                                            controller.userNameController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Role",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CustomDropdownButton(
                                              hint:
                                                  'Select Role', // Hint text, not part of the list
                                              dropdownWidth:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.25,
                                              offset: const Offset(0, -10),
                                              value: (controller
                                                              .staffRolesNameValue !=
                                                          null &&
                                                      controller.staffRolesData
                                                              .roles
                                                              ?.map((item) =>
                                                                  item.roleName)
                                                              .contains(
                                                                controller
                                                                    .staffRolesNameValue,
                                                              ) ==
                                                          true)
                                                  ? controller
                                                      .staffRolesNameValue
                                                      .toString()
                                                  : null, // Default to null when no valid selection
                                              dropdownItems: controller
                                                      .staffRolesData.roles
                                                      ?.map((item) =>
                                                          item.roleName)
                                                      .whereType<String>()
                                                      .toList() ??
                                                  [], // Ensure it's never null
                                              onChanged: (val, key) {
                                                setState(() {
                                                  controller
                                                          .staffRolesNameValue =
                                                      val;
                                                  controller
                                                      .staffRolesData.roles
                                                      ?.map(
                                                    (item) {
                                                      if (item.roleName ==
                                                          val) {
                                                        controller
                                                                .staffRoleValue =
                                                            item.staffRoleId
                                                                .toString();
                                                      }
                                                    },
                                                  );

                                                      
                                                });
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Email",
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
                                              "", controller.emailController),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Password",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextField("",
                                              controller.passwordController),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Profile Image",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      controller.getImage();
                                                    },
                                                    child: DottedBorder(
                                                      radius:
                                                          Radius.circular(10.0),
                                                      borderType:
                                                          BorderType.RRect,
                                                      color:
                                                          Colors.grey.shade800,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        height: 100,
                                                        width: 100,
                                                        child: controller
                                                                    .imageFile !=
                                                                null
                                                            ? Image.file(
                                                                controller
                                                                    .imageFile!,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                      color: Colors
                                                                          .grey,
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
                                                              ),
                                                      ),
                                                    )),
                                              ),
                                              if (Get.arguments != null &&
                                                  Get.arguments['fromScreen'] ==
                                                      StringResources.editStaff)
                                                controller.image != null
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: DottedBorder(
                                                          radius:
                                                              Radius.circular(
                                                                  10.0),
                                                          borderType:
                                                              BorderType.RRect,
                                                          color: Colors
                                                              .grey.shade800,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(                                                              
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                13,
                                                              ),
                                                            ),
                                                            height: 100,
                                                            width: 100,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 0,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              controller
                                                                      .image!,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                            ],
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "status",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomDropdownButton(
                                            hint: '',
                                            value: controller
                                                .statusDropdownList[int.parse(
                                              controller.statusValue.toString(),
                                            )],
                                            dropdownItems:
                                                controller.statusDropdownList,
                                            onChanged: (val, key) {
                                              setState(() {
                                                // 1-> active , 2->0 disable , 9-> blocked
                                                controller.statusValue =
                                                    key.toString();
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 12,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "warehouse Location",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomDropdownButton(
                                              dropdownHeight: 150,
                                              hint:
                                                  'Select Location', // Hint text, not part of the list
                                              dropdownWidth:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.25,
                                              offset: const Offset(0, 0),
                                              dropdownItems: controller
                                                      .activeWareHouseData
                                                      .warehouseAddress
                                                      ?.map((item) => item
                                                          .locationTitle
                                                          ?.trim()) // Ensure no extra spaces
                                                      .whereType<String>()
                                                      .toSet() // Remove duplicates
                                                      .toList() ??
                                                  [], // Ensure it's never null
                                              value: controller
                                                              .wareHouseLocationValue !=
                                                          null &&
                                                      (controller
                                                              .activeWareHouseData
                                                              .warehouseAddress
                                                              ?.map((item) => item
                                                                  .locationTitle)
                                                              .contains(controller
                                                                  .wareHouseLocationValue) ??
                                                          false)
                                                  ? controller
                                                      .wareHouseLocationValue
                                                  : null, // Ensure valid selection
                                              onChanged: (val, key) {
                                                setState(() {
                                                  controller
                                                          .wareHouseLocationValue =
                                                      val;
                                                  var selectedItem = controller
                                                      .activeWareHouseData
                                                      .warehouseAddress
                                                      ?.firstWhere((item) =>
                                                          item.locationTitle ==
                                                          val);
                                                  if (selectedItem != null) {
                                                    controller
                                                            .warehouseLocationId =
                                                        selectedItem.warehouseId
                                                            .toString();
                                                  }
                                                });
                                              },
),

                                            // SizedBox(
                                            //   height: 55,
                                            //   child: DropdownButtonFormField(
                                            //     decoration: const InputDecoration(
                                            //       border: OutlineInputBorder(
                                            //         borderSide: BorderSide(
                                            //             color: ColorResource
                                            //                 .colorC4CACD),
                                            //         borderRadius:
                                            //             BorderRadius.all(
                                            //           Radius.circular(3.0),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //     hint: const Text('select Data'),
                                            //     items: controller
                                            //         .activeWareHouseData
                                            //         .warehouseAddress
                                            //         ?.map((item) {
                                            //       return DropdownMenuItem(
                                            //         value: item.locationTitle
                                            //             .toString(),
                                            //         child: Text(item.locationTitle
                                            //             .toString()),
                                            //       );
                                            //     }).toList(),
                                            //     onChanged: (newVal) {
                                            //       setState(() {
                                            //         controller
                                            //                 .wareHouseLocationValue =
                                            //             newVal;
                                            //       });
                                            //     },
                                            //     value: controller
                                            //         .wareHouseLocationValue,
                                            //   ),

                                            //   // CustomDropdownButton(
                                            //   //   dropdownItems: controller
                                            //   //       .selectStoreStatusValueList,
                                            //   //   hint: 'select',
                                            //   //   value: controller
                                            //   //       .selectedStoreStatusValueList,
                                            //   //   onChanged: (val, key) {
                                            //   //     setState(() {
                                            //   //       controller
                                            //   //               .selectedStoreStatusValueList =
                                            //   //           val;
                                            //   //     });
                                            //   //     print(val);
                                            //   //   },
                                            //   // ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: 0,
                                          )),
                                      const Expanded(
                                          flex: 12,
                                          child: SizedBox(
                                            height: 0,
                                          )),
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    spacing: 20,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 40,
                                            width: AppUtils.vs(200, context),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: ColorResource
                                                        .color0D5EF8),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(3.0))),
                                            child: const Center(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color:
                                                      ColorResource.color0D5EF8,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            (Get.arguments['fromScreen'] ==
                                                    StringResources.editStaff)
                                                ? controller.updateVendorStaff()
                                                : controller.addVendorStaff();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: ColorResource
                                                      .color0D5EF8,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0))),
                                              height: 40,
                                              width: AppUtils.vs(200, context),
                                              child: Center(
                                                child: Text(
                                                  (Get.arguments != null &&
                                                          Get.arguments[
                                                                  'fromScreen'] ==
                                                              StringResources
                                                                  .editStaff)
                                                      ? 'Save Changes'
                                                      : 'Save ',
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
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> changePassword(String argument, String string) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text(
            'Change Password',
            style: TextStyle(
              fontSize: 18,
              color: ColorResource.color000000,
              fontWeight: FontWeight.w400,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Text(
                      "New Password ",
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
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "New Password",
                      controller.newPasswordController,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Confirm Password ",
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
                SizedBox(
                    height: 50,
                    width: 400,
                    child: CustomTextField(
                      "Confirm Password",
                      controller.confirmPasswordController,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: .5,
                  color: ColorResource.colorDDDDDD,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.changePassword(context, argument, string);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        height: AppUtils.vs(65, context),
                        width: AppUtils.vs(250, context),
                        child: const Center(
                          child: Text(
                            'Change Password',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: AppUtils.vs(65, context),
                      width: AppUtils.vs(150, context),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorResource.color0D5EF8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0))),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: ColorResource.color0D5EF8, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
