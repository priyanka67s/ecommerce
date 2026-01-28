import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/controller/storelocation_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

class StoreLocationPage extends StatefulWidget {
  const StoreLocationPage({super.key});

  @override
  State<StoreLocationPage> createState() => _StoreLocationPageState();
}

class _StoreLocationPageState extends State<StoreLocationPage> {
  StoreLocationController controller = Get.put(StoreLocationController());
  @override
  Widget build(BuildContext context) {
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
                    titleText: "Store Settings",
                    onBackButtonPressed: () {},
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,                        
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Store Location",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.addStoreLocation,
                                                arguments: {
                                              'fromScreen': StringResources
                                                  .addStoreLocation
                                            })!
                                            .then((value) {});
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        height: 40,
                                        width: 200,
                                        child: const Center(
                                          child: Text(
                                            "Add Store Location",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 0.5,
                              color: ColorResource.colorDDDDDD,
                            ),
                            const SizedBox(
                              height: 30,
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
                                        "Select Store",
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
                                          dropdownWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.90,
                                          offset: const Offset(0, -10),
                                          dropdownItems: controller
                                              .selectStoreStatusValueList,
                                          hint: 'Select',
                                          value: controller
                                              .selectedStoreStatusValueList,
                                          onChanged: (val, key) {
                                            setState(() {
                                              controller
                                                      .selectedStoreStatusValueList =
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Set Default Location",
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
                                          hint: "Select Data",
                                          dropdownWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.90,
                                          offset: const Offset(0, -10),
                                          dropdownHeight: 200,
                                          dropdownItems: controller
                                                  .activeStoreLocationData
                                                  ?.activeStoreLocations
                                                  ?.map((item) => item
                                                      .locationTitle
                                                      .toString())
                                                  .toSet() // Ensure unique values
                                                  .toList() ??
                                              [], // Default to an empty list if null
                                          value: (controller
                                                          .activeStoreLocationData
                                                          ?.activeStoreLocations ??
                                                      [])
                                                  .any((item) =>
                                                      item.locationTitle ==
                                                      controller
                                                          .storeLocationDropDownValue)
                                              ? controller
                                                  .storeLocationDropDownValue
                                              : null, // Ensure selected value exists in dropdown
                                          onChanged: (val, key) {
                                            setState(() {
                                              controller
                                                      .storeLocationDropDownValue =
                                                  val;
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
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.saveStoreSetting();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        height: 40,
                                        width: 150,
                                        child: const Center(
                                          child: Text(
                                            'Save Changes',
                                            style: TextStyle(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
