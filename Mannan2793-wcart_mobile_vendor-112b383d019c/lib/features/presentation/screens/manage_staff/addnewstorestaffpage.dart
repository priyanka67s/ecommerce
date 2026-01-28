import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_staff/controller/addstaff_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddStoreStaffPage extends StatefulWidget {
  const AddStoreStaffPage({super.key});

  @override
  State<AddStoreStaffPage> createState() => _AddStoreStaffPageState();
}

class _AddStoreStaffPageState extends State<AddStoreStaffPage> {
  AddNewWareHouseStaffController controller =
      Get.put(AddNewWareHouseStaffController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewWareHouseStaffController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: AppBar(
          leading: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Text(
                "Add New Store Staff",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: ColorResource.colorFFFFFF),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                                "User Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  "", controller.userNameController),
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
                                "Role",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // CustomDropdownButton(
                              //   hint: '',
                              //   value: .roleValue,
                              //   dropdownItems: controller.roleDropdownList,
                              //   onChanged: (val, key) {
                              //     setState(() {
                              //       controller.roleValue = val;
                              //     });
                              //   },
                              // )
                              SizedBox(
                                height: 55,
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width:
                                            0.5, // Adjust the width to your desired value
                                        color: ColorResource.colorC4CACD,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width:
                                            0.5, // Adjust the width to your desired value
                                        color: ColorResource.colorC4CACD,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width:
                                            0.5, // Adjust the width to your desired value
                                        color: ColorResource.colorC4CACD,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width:
                                            0.5, // Adjust the width to your desired value
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.0),
                                      ),
                                    ),
                                  ),
                                  hint: const Text('select Data'),
                                  items: controller.staffRolesData.roles
                                      ?.map((item) {
                                    return DropdownMenuItem(
                                      value: item.roleName.toString(),
                                      child: Text(item.roleName.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      controller.staffRolesNameValue = newVal;
                                    });
                                  },
                                  value: controller.staffRolesNameValue,
                                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              CustomTextField("", controller.emailController),
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
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  "", controller.passwordController),
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
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                        onTap: () async {
                                          controller.getImage();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    ColorResource.colorC4CACD),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          height: 100,
                                          width: 100,
                                          child: controller.imageFile != null
                                              ? Image.file(
                                                  controller.imageFile!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const SizedBox(
                                                  child: SvgIcon(
                                                    'assets/icon/svg/camer.svg',
                                                    height: 30,
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
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: ColorResource
                                                          .colorC4CACD),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                height: 100,
                                                width: 100,
                                                margin: const EdgeInsets.only(
                                                    top: 0),
                                                child: Image.network(
                                                    controller.image!)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                value: controller.statusValue,
                                dropdownItems: controller.statusDropdownList,
                                onChanged: (val, key) {
                                  setState(() {
                                    controller.statusValue = val;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 100,
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
                                  "Store Location",
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
                                  child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorResource.colorC4CACD),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.0)),
                                        ),
                                      ),
                                      hint: const Text('select Data'),
                                      items: controller.activeStoreLocationData
                                          .activeStoreLocations
                                          ?.map((item) =>
                                              item.locationTitle.toString())
                                          .toSet() // Duplicates remove செய்ய Set() பயன்படுத்துங்கள்.
                                          .map((uniqueItem) {
                                        return DropdownMenuItem(
                                          value: uniqueItem,
                                          child: Text(uniqueItem),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          controller
                                                  .storeLocationDropDownValue =
                                              newVal;
                                        });
                                      },
                                      value:
                                          controller.storeLocationDropDownValue,
                                    )


                                  // CustomDropdownButton(
                                  //   dropdownItems: controller
                                  //       .selectStoreStatusValueList,
                                  //   hint: 'select',
                                  //   value: controller
                                  //       .selectedStoreStatusValueList,
                                  //   onChanged: (val, key) {
                                  //     setState(() {
                                  //       controller
                                  //               .selectedStoreStatusValueList =
                                  //           val;
                                  //     });
                                  //     print(val);
                                  //   },
                                  // ),
                                ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                    color: ColorResource.color0D5EF8,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                height: AppUtils.vs(65, context),
                                width: AppUtils.vs(200, context),
                                child: Center(
                                  child: Text(
                                    // 'Save',
                                    (Get.arguments['fromScreen'] ==
                                            StringResources.editStoreLocation)
                                        ? 'Save Changes'
                                        : 'Save',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
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
      );
    });
  }

  Future<void> changePassword() async {
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
                      // controller.changePassword(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        height: AppUtils.vs(65, context),
                        width: AppUtils.vs(200, context),
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
