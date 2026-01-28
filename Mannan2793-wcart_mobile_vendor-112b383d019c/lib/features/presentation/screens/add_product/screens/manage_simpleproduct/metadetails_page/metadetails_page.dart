import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:wcart_vendor/model/liveproduct_model.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/metadetails_page/controller/metadetails_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class MetaDetailsPage extends StatefulWidget {
  const MetaDetailsPage({super.key});

  @override
  State<MetaDetailsPage> createState() => _MetaDetailsPageState();
}

class _MetaDetailsPageState extends State<MetaDetailsPage> {
  // String? treding;
  bool selected = false;
  int? trending;
  int? productStatus;
  MetaProductController controller = Get.put(MetaProductController());
  final MultiSelectController<Products> liveProductMultiSelectController =
      MultiSelectController();
  @override
  void initState() {
    // TODO: implement initState
    controller.getSimpleProduct3Data();
    super.initState();
  }

  // Widget liveProductMultiSelectDropDownWidget() {
  //   List<ValueItem<Products>> optionValue = [];

  //   for (var i = 0;
  //       i < (controller.liveProductData.products ?? []).length;
  //       i++) {
  //     Products product = (controller.liveProductData.products ?? [])[i];
  //     optionValue.add(
  //       ValueItem(
  //         label: product.name ?? '',
  //         value: product,
  //       ),
  //     );
  //   }
  //   return MultiSelectDropDown<Products>(
  //     clearIcon: Icon(Icons.close),
  //     controller: liveProductMultiSelectController,
  //     onOptionSelected: (options) {
  //       debugPrint(options.toString());
  //     },
  //     options: optionValue,
  //     selectionType: SelectionType.multi,
  //     chipConfig: const ChipConfig(
  //       wrapType: WrapType.wrap,
  //       backgroundColor: ColorResource.color203052,
  //     ),
  //     optionTextStyle: const TextStyle(fontSize: 16),
  //     selectedOptionIcon: const Icon(
  //       Icons.check_circle,
  //       color: Colors.grey,
  //     ),
  //     selectedOptionTextColor: Colors.blue,
  //     dropdownMargin: 2,
  //     onOptionRemoved: (index, option) {
  //       debugPrint('Removed: $option');
  //     },
  //     borderRadius: 3,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MetaProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomAppBar(
                    titleText: 'Manage Products ',
                    onBackButtonPressed: () {},
                    isLoading: controller.status.isLoading,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: ColorResource.colorFFFFFF,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Meta Title",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      ColorResource.color252525,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomTextField(
                                                " Select Data",
                                                isReadOnly: true,
                                                controller.metaTitleController,
                                                validationRules: const [
                                                  'required'
                                                ],
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
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Allow search results? ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                  height: 55,
                                                  width: 350,
                                                  child: CustomDropdownButton(
                                                    hint: '',
                                                    value:
                                                        controller.allowSearch,
                                                    dropdownItems: controller
                                                        .allowSearchDownList,
                                                    onChanged: (val, key) {
                                                      setState(() {
                                                        controller.allowSearch =
                                                            val;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 0,
                                            )),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Allow search results? ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                  height: 55,
                                                  width: 350,
                                                  child: CustomDropdownButton(
                                                    hint: '',
                                                    value:
                                                        controller.searchFollow,
                                                    dropdownItems: controller
                                                        .searchFollowDownList,
                                                    onChanged: (val, key) {
                                                      setState(() {
                                                        controller
                                                            .searchFollow = val;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Meta Keywords",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextField(
                                      "keyword",
                                      controller.metaKeywordsController,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Text(
                                          "Meta Description",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      "Meta Description",
                                      controller.metaDescriptionController,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Text(
                                          "Canonical URL",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      "Canonical URL",
                                      controller.canonicalUrl,
                                      validationRules: const ['required'],
                                      validatorCallBack: (val) {
                                        print(val);
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Text(
                                          "Additional Details",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Row(
                                      children: [
                                        Text(
                                          "Trending",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: trending,
                                              onChanged: (value) {
                                                setState(() {
                                                  trending = 1;
                                                  print("Button value: $value");
                                                });
                                              },
                                            ),
                                            const Text('Yes')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: trending,
                                              onChanged: (value) {
                                                setState(() {
                                                  trending = 2;
                                                  print("Button value: $value");
                                                });
                                              },
                                            ),
                                            const Text('No')
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: <Widget>[],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Product Status",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResource.color252525,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              value: 1,
                                              groupValue: productStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  productStatus = 1;
                                                  print("Button value: $value");
                                                });
                                              },
                                            ),
                                            const Text('Publish')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 2,
                                              groupValue: productStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  productStatus = 2;
                                                  print("Button value: $value");
                                                });
                                              },
                                            ),
                                            const Text('Draft')
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "UpSell Products",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      ColorResource.color252525,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              controller.liveProductData
                                                          .products ==
                                                      null
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator()) // Show a loading indicator if data is not ready
                                                  : MultiDropdown<String>(
                                                      items: controller
                                                              .liveProductData
                                                              .products
                                                              ?.map((Cross) {
                                                            final termName =
                                                                Cross.name
                                                                    ?.toString();

                                                            print(
                                                                'termImage: $termName'); // Debugging termImage value

                                                            return DropdownItem<
                                                                String>(
                                                              value: termName ??
                                                                  '', // Ensure there's a valid value
                                                              label: termName ??
                                                                  'Unknown', // Ensure there's a visible label
                                                            );
                                                          }).toList() ??
                                                          [], // Handle null or empty list case
                                                      controller: controller
                                                          .upSellController,
                                                      enabled: true,
                                                      searchEnabled: true,
                                                      chipDecoration:
                                                          ChipDecoration(
                                                        backgroundColor:
                                                            Colors.grey[200],
                                                        wrap: true,
                                                        runSpacing: 2,
                                                        spacing: 10,
                                                      ),
                                                      fieldDecoration:
                                                          FieldDecoration(
                                                        hintText: 'Select Tags',
                                                        hintStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black87),
                                                        showClearIcon: false,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: const BorderSide(
                                                              color: ColorResource
                                                                  .colorC4CACD),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: ColorResource
                                                                .colorC4CACD,
                                                          ),
                                                        ),
                                                      ),
                                                      dropdownDecoration:
                                                          const DropdownDecoration(
                                                        marginTop: 2,
                                                        maxHeight: 500,
                                                        header: Padding(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Text(
                                                            'Select Tags List',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      dropdownItemDecoration:
                                                          DropdownItemDecoration(
                                                        selectedIcon:
                                                            const Icon(
                                                                Icons.check_box,
                                                                color: Colors
                                                                    .green),
                                                        disabledIcon: Icon(
                                                            Icons.lock,
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please select ';
                                                        }
                                                        return null;
                                                      },
                                                      onSelectionChange:
                                                          (selectedItems) {
                                                        debugPrint(
                                                            "OnSelectionChange: $selectedItems");
                                                      },
                                                    ),
                                              // liveProductMultiSelectDropDownWidget()
                                            ],
                                          ),
                                        ),
                                        const Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              height: 0,
                                            )),
                                        Expanded(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Cross Sell Products ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              controller.liveProductData
                                                          .products ==
                                                      null
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator()) // Show a loading indicator if data is not ready
                                                  : MultiDropdown<String>(
                                                      items: controller
                                                              .liveProductData
                                                              .products
                                                              ?.map((Cross) {
                                                            final termName =
                                                                Cross.name
                                                                    ?.toString();
                                                            print(
                                                                'termImage: $termName'); // Debugging termImage value

                                                            return DropdownItem<
                                                                String>(
                                                              value: termName ??
                                                                  '', // Ensure there's a valid value
                                                              label: termName ??
                                                                  'Unknown', // Ensure there's a visible label
                                                            );
                                                          }).toList() ??
                                                          [], // Handle null or empty list case
                                                      controller: controller
                                                          .crossSellController,
                                                      enabled: true,
                                                      searchEnabled: true,
                                                      chipDecoration:
                                                          ChipDecoration(
                                                        backgroundColor:
                                                            Colors.grey[200],
                                                        wrap: true,
                                                        runSpacing: 2,
                                                        spacing: 10,
                                                      ),
                                                      fieldDecoration:
                                                          FieldDecoration(
                                                        hintText: 'Select Tags',
                                                        hintStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black87),
                                                        showClearIcon: false,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: const BorderSide(
                                                              color: ColorResource
                                                                  .colorC4CACD),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: ColorResource
                                                                .colorC4CACD,
                                                          ),
                                                        ),
                                                      ),
                                                      dropdownDecoration:
                                                          const DropdownDecoration(
                                                        marginTop: 2,
                                                        maxHeight: 500,
                                                        header: Padding(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          child: Text(
                                                            'Select Tags List',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      dropdownItemDecoration:
                                                          DropdownItemDecoration(
                                                        selectedIcon:
                                                            const Icon(
                                                                Icons.check_box,
                                                                color: Colors
                                                                    .green),
                                                        disabledIcon: Icon(
                                                            Icons.lock,
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Please select ';
                                                        }
                                                        return null;
                                                      },
                                                      onSelectionChange:
                                                          (selectedItems) {
                                                        debugPrint(
                                                            "OnSelectionChange: $selectedItems");
                                                      },
                                                    ),

                                              // liveProductMultiSelectDropDownWidget()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(Routes.productInventoryStep2);
                                          controller.clearCache();
                                          controller.addMetaProduct(
                                              Get.arguments['productID'],
                                              context);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: ColorResource.color0D5EF8,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                          height: AppUtils.vs(65, context),
                                          width: AppUtils.vs(300, context),
                                          child: const Center(
                                            child: Text(
                                              "Complete",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ),
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
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
