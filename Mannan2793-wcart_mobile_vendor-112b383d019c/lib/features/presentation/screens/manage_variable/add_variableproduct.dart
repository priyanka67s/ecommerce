import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/all_tagslist_model.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_variable/controller/addvariableproduct_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddVariableProduct extends StatefulWidget {
  const AddVariableProduct({super.key});

  @override
  State<AddVariableProduct> createState() => _AddVariableProductState();
}

class _AddVariableProductState extends State<AddVariableProduct> {
  final TextEditingController searchController = TextEditingController();
  File? videoFile;
  String? fileName;
  FilePickerResult? result;
  String? selectedFileName;

  final formKey = GlobalKey<FormState>();
  VariableProductController controller = Get.put(VariableProductController());

  final MultiSelectController<Tags> tagMultiSelectController =
      MultiSelectController();

  final tagsController = MultiSelectController<String>();
  String? selectedBrand;

  final MultiSelectController<String> categoriesController =
      MultiSelectController<String>();

  // List to store selected categories from the first dropdown
  // List<String> selectedCategories = [];
  List<String> selectedCategories = [];
  String? selectedValue;

  // Example list of categories to display in the first dropdown
  final List<DropdownItem<String>> categories = List.generate(
    5,
    (index) => DropdownItem<String>(
      value: 'Category $index',
      label: 'Category $index',
    ),
  );

  // Widget tagsMultiSelectDropDownWidget() {
  //   List<ValueItem<Tags>> optionValue = [];

  //   for (var i = 0; i < (controller.allTagsData.tags ?? []).length; i++) {
  //     Tags tags = (controller.allTagsData.tags ?? [])[i];
  //     optionValue.add(
  //       ValueItem(
  //         label: tags.tagname ?? '',
  //         value: tags,
  //       ),
  //     );
  //   }
  //   return MultiSelectDropDown<Tags>(
  //     clearIcon: Icon(Icons.close),
  //     controller: tagMultiSelectController,
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
    return GetBuilder<VariableProductController>(builder: (controller) {
      return Obx(() => Scaffold(
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
                      ),                      
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: ColorResource.colorFFFFFF),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Form(
                                  key: formKey,
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
                                                  "Product Name",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextField(
                                                  "Product Name",
                                                  controller
                                                      .productNameController,
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
                                          // const Expanded(
                                          //     flex: 1,
                                          //     child: SizedBox(
                                          //       height: 0,
                                          //     )),
                                          // Expanded(
                                          //   flex: 10,
                                          //   child: Column(
                                          //     crossAxisAlignment: CrossAxisAlignment.start,
                                          //     children: [
                                          //       Text(
                                          //         "Select Category ",
                                          //         style: TextStyle(
                                          //             color: Colors.black,
                                          //             fontSize: 16,
                                          //             fontWeight: FontWeight.w500),
                                          //       ),
                                          //       SizedBox(
                                          //         height: 10,
                                          //       ),
                                          // MultiSelectDialogField(
                                          //     items:
                                          //         (controller.allCategoryData.category ??
                                          //                 [])
                                          //             .map((value) =>
                                          //                 MultiSelectItem<Categories>(
                                          //                     value,
                                          //                     value.termName ?? 'Jones'))
                                          //             .toList(),
                                          //     title: Text("Category"),
                                          //     selectedColor: Colors.grey,
                                          //     decoration: BoxDecoration(
                                          //       color: Colors.grey.withOpacity(0.1),
                                          //       borderRadius:
                                          //           BorderRadius.all(Radius.circular(4)),
                                          //       border: Border.all(
                                          //         color: Colors.grey,
                                          //         width: 2,
                                          //       ),
                                          //     ),
                                          //     buttonIcon: Icon(
                                          //       Icons.arrow_drop_down,
                                          //       color: Colors.grey,
                                          //     ),
                                          //     buttonText: Text(
                                          //       "Select Category",
                                          //       style: TextStyle(
                                          //         color: Colors.black,
                                          //         fontSize: 16,
                                          //       ),
                                          //     ),
                                          //     onConfirm: (selectedResults) {
                                          //       List<String> tempList = [];
                                          //       for (var element in selectedResults
                                          //           as List<Categories>) {
                                          //         tempList.add(element.termName ?? '');
                                          //       }
                                          //       controller.selectedCategory = tempList;
                                          //       // ignore: invalid_use_of_protected_member
                                          //       controller
                                          //           .change(controller.selectedCategory);
                                          //       print(
                                          //           '======= > ${controller.selectedCategory}');
                                          //     }
                                          //     // onSelectionChanged: (results) {
                                          //     //   print('===== > ${results.length}');
                                          //     // }
                                          //     ),
                                          //     ],
                                          //   ),
                                          // ),
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
                                                  "Select Categories ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: ColorResource
                                                        .color252525,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                controller.allCategoryData
                                                            .categories ==
                                                        null
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator()) // Show a loading indicator if data is not ready
                                                    : MultiDropdown<String>(
                                                        items: controller
                                                                .allCategoryData
                                                                .categories
                                                                ?.map(
                                                                    (category) {
                                                              final termName =
                                                                  category
                                                                      .termFullName
                                                                      ?.toString();

                                                              print(
                                                                  'termName: $termName'); // Debugging termImage value

                                                              return DropdownItem<
                                                                  String>(
                                                                value: termName ??
                                                                    '', // Ensure there's a valid value
                                                                label: termName ??
                                                                    'Unknown', // Ensure there's a visible label
                                                              );
                                                            }).toList() ??
                                                            [], // Handle null or empty list case
                                                        controller:
                                                            categoriesController,
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
                                                          hintText:
                                                              'Select Categories',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                          showClearIcon: false,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide: const BorderSide(
                                                                color: ColorResource
                                                                    .colorC4CACD),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
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
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Text(
                                                              'Select Categories List',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                  Icons
                                                                      .check_box,
                                                                  color: Colors
                                                                      .green),
                                                          disabledIcon: Icon(
                                                              Icons.lock,
                                                              color: Colors.grey
                                                                  .shade300),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please select a category';
                                                          }
                                                          return null;
                                                        },
                                                        onSelectionChange:
                                                            (selectedItems) {
                                                          debugPrint(
                                                              "OnSelectionChange: $selectedItems");
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Primary Category",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                DropdownButtonFormField<String>(
                                                  decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        color: Colors.black87),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors
                                                            .grey, // Customize the border color
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors
                                                            .blue, // Color when focused
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10,
                                                            horizontal: 15),
                                                  ),
                                                  value: selectedCategories
                                                          .isNotEmpty
                                                      ? selectedCategories.first
                                                      : null, // Set the initial value
                                                  hint: const Text(
                                                      'Select from Categories'),
                                                  items: selectedCategories
                                                      .map(
                                                        (category) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                          value: category,
                                                          child: Text(category),
                                                        ),
                                                      )
                                                      .toList(),
                                                  onChanged: (value) {
                                                    debugPrint(
                                                        "Selected from second dropdown: $value");
                                                    // You can handle any changes here when the user selects from this dropdown
                                                    setState(() {
                                                      // Optionally update the selected item if needed
                                                    });
                                                  },
                                                ),

                                                // CustomTextField(
                                                //     "", controller.primaryCat),
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
                                                  "Select Tags",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                controller.allBrandData
                                                            .brands ==
                                                        null
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator()) // Show a loading indicator if data is not ready
                                                    : MultiDropdown<String>(
                                                        items: controller
                                                                .allTagsData
                                                                .tags
                                                                ?.map((Tags) {
                                                              final termName = Tags
                                                                  .tagname
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
                                                        controller:
                                                            tagsController,
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
                                                          hintText:
                                                              'Select Tags',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                          showClearIcon: false,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            borderSide: const BorderSide(
                                                                color: ColorResource
                                                                    .colorC4CACD),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
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
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: Text(
                                                              'Select Tags List',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
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
                                                                  Icons
                                                                      .check_box,
                                                                  color: Colors
                                                                      .green),
                                                          disabledIcon: Icon(
                                                              Icons.lock,
                                                              color: Colors.grey
                                                                  .shade300),
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

                                                // tagsMultiSelectDropDownWidget()
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
                                                  "Select Brand",
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
                                                  height: 50,
                                                  child:
                                                      DropdownButtonFormField2(
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(3.0),
                                                        ),
                                                      ),
                                                    ),
                                                    isExpanded: true,
                                                    hint: const Text(
                                                        'Select Data'),
                                                    searchController:
                                                        searchController,
                                                    searchInnerWidget: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        controller:
                                                            searchController,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 10,
                                                            vertical: 8,
                                                          ),
                                                          hintText:
                                                              'Search Brand',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                                color: ColorResource
                                                                    .colorC4CACD),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    searchMatchFn:
                                                        (item, searchValue) {
                                                      return item.value
                                                          .toString()
                                                          .toLowerCase()
                                                          .contains(searchValue
                                                              .toLowerCase());
                                                    },
                                                    onMenuStateChange:
                                                        (isOpen) {
                                                      if (!isOpen) {
                                                        searchController
                                                            .clear();
                                                      }
                                                    },
                                                    items: controller
                                                        .allBrandData.brands
                                                        ?.map((item) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: item.brandId
                                                            .toString(),
                                                        child: Text(item
                                                            .brandName
                                                            .toString()),
                                                      );
                                                    }).toList(),
                                                    onChanged: (newVal) {
                                                      setState(() {
                                                        selectedBrand =
                                                            newVal.toString();
                                                      });
                                                    },
                                                    value: selectedBrand,
                                                    buttonHeight: 50,
                                                    dropdownMaxHeight: 200,
                                                    buttonWidth:
                                                        double.infinity,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 12,
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           const Text(
                                      //             "Select Categories ",
                                      //             style: TextStyle(
                                      //               fontSize: 16,
                                      //               color: ColorResource
                                      //                   .color252525,
                                      //               fontWeight: FontWeight.w500,
                                      //             ),
                                      //           ),
                                      //           const SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           // controller
                                      //           //     .categoryMultiSelectDropDownWidget(),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     const Expanded(
                                      //         flex: 1,
                                      //         child: SizedBox(
                                      //           height: 0,
                                      //         )),
                                      //     Expanded(
                                      //       flex: 12,
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           const Text(
                                      //             "Primary Category",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 16,
                                      //                 fontWeight:
                                      //                     FontWeight.w500),
                                      //           ),
                                      //           const SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           CustomTextField(
                                      //               "",
                                      //               controller
                                      //                   .productNameController),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),

                                      // const SizedBox(
                                      //   height: 20,
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 12,
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           const Text(
                                      //             "Select Tags",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 16,
                                      //                 fontWeight:
                                      //                     FontWeight.w500),
                                      //           ),
                                      //           const SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           // tagsMultiSelectDropDownWidget()
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     const Expanded(
                                      //         flex: 1,
                                      //         child: SizedBox(
                                      //           height: 0,
                                      //         )),
                                      //     Expanded(
                                      //       flex: 12,
                                      //       child: Column(
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: [
                                      //           const Text(
                                      //             "Select Brand",
                                      //             style: TextStyle(
                                      //                 color: Colors.black,
                                      //                 fontSize: 16,
                                      //                 fontWeight:
                                      //                     FontWeight.w500),
                                      //           ),
                                      //           const SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           DropdownButtonFormField(
                                      //             decoration:
                                      //                 const InputDecoration(
                                      //               border: OutlineInputBorder(
                                      //                 borderSide: BorderSide(
                                      //                     color: ColorResource
                                      //                         .color1c1d22),
                                      //                 borderRadius:
                                      //                     BorderRadius.all(
                                      //                   Radius.circular(3.0),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             hint:
                                      //                 const Text('select Data'),
                                      //             items: controller
                                      //                 .allBrandData.brands
                                      //                 ?.map((item) {
                                      //               return DropdownMenuItem(
                                      //                 value: item.brandName
                                      //                     .toString(),
                                      //                 child: Text(item.brandName
                                      //                     .toString()),
                                      //               );
                                      //             }).toList(),
                                      //             onChanged: (newVal) {
                                      //               setState(() {
                                      //                 controller
                                      //                         .brandDropDownValue =
                                      //                     newVal;
                                      //               });
                                      //             },
                                      //             value: controller
                                      //                 .brandDropDownValue,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),

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
                                                  "Product Regular Price",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextField(
                                                  "Product Price",
                                                  controller
                                                      .productRegularPriceController,
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
                                            flex: 12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Product Sale Price",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextField(
                                                  "Sale Price",
                                                  controller
                                                      .productSalePriceController,
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
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            "Product Short Description",
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
                                      CustomTextField(
                                        "short Description",
                                        maxLines: 5,
                                        keyBoardType: TextInputType.multiline,
                                        controller
                                            .productShortDescriptionController,
                                        validationRules: const ['required'],
                                        validatorCallBack: (val) {
                                          print(val);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            "Product long Description",
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
                                        controller: controller
                                            .productLongDescriptionController,
                                        maxLines: 2,
                                        // expands: true,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "Product long Description",
                                          hintStyle: const TextStyle(
                                              color: Color(0xFF6B7280),
                                              fontWeight: FontWeight.w400),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                            color: Colors.teal,
                                          )),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: ColorResource
                                                    .colorC4CACD), //<-- SEE HERE
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: ColorResource
                                                    .colorC4CACD), //<-- SEE HERE
                                          ),
                                          filled: true,
                                        ),
                                      ),

                                      // CustomTextField(
                                      //     "long Description",
                                      //     maxLines: 5,
                                      //     keyBoardType: TextInputType.multiline,
                                      //     controller
                                      //         .productLongDescriptionController),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: DropdownSearch<int>(
                                      //         items: [1, 2, 3, 4, 5, 6, 7],
                                      //       ),
                                      //     ),
                                      //     Padding(padding: EdgeInsets.all(4)),
                                      //     Expanded(
                                      //       child: DropdownSearch<int>.multiSelection(
                                      //         clearButtonProps:
                                      //             ClearButtonProps(isVisible: true),
                                      //         items: [1, 2, 3, 4, 5, 6, 7],
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                      const Row(
                                        children: [
                                          Text(
                                            'Upload Product image',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: controller.imageFiles.isNotEmpty
                                            ? SizedBox(
                                                height: 105,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: controller
                                                        .imageFiles.length,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Stack(
                                                              children: [
                                                                Container(
                                                                  height: 100,
                                                                  width: 100,
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2.5),
                                                                  clipBehavior:
                                                                      Clip.hardEdge,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle),
                                                                  child: Image
                                                                      .file(
                                                                    controller
                                                                            .imageFiles[
                                                                        index],
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 100,
                                                                  width: 100,
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child: InkWell(
                                                                      onTap: () {
                                                                        print(
                                                                            'nk-----');
                                                                        controller
                                                                            .removeImageFromSelectedImageList(index);
                                                                      },
                                                                      child: Container(
                                                                          height: 25,
                                                                          width: 25,
                                                                          decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorResource.color000000),
                                                                          child: const Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                ColorResource.colorffffff,
                                                                          ))),
                                                                )
                                                              ],
                                                            )),
                                              )
                                            : MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    controller.addImage();
                                                  },
                                                  child: Container(
                                                    height: 150,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const SizedBox(
                                                      child: Icon(Icons.camera),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            'Upload Product Video',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                await addVideo();
                                              },
                                              child: const Text('Pick Video'),
                                            ),
                                            const SizedBox(height: 20),
                                            if (selectedFileName != null)
                                              Text(
                                                  'Selected file: $selectedFileName'),

                                            // GestureDetector(
                                            //   onTap: () async {
                                            //     controller.addVideo();
                                            //   },
                                            //   child: Container(
                                            //     height: 40,
                                            //     width: 150,
                                            //     child: controller.fileName !=
                                            //             null
                                            //         ? Text(
                                            //             controller.fileName!
                                            //                 .toString(),
                                            //             style: TextStyle(
                                            //                 color: Colors.blue),
                                            //           )
                                            //         : const SizedBox(
                                            //             child: Center(
                                            //               child: Text(
                                            //                 "Uploade video",
                                            //                 style: TextStyle(
                                            //                     color: Colors
                                            //                         .black,
                                            //                     fontSize: 14),
                                            //               ),
                                            //             ),
                                            //           ),
                                            //     decoration: BoxDecoration(
                                            //       color: Colors.grey[100],
                                            //       border: Border.all(),
                                            //       borderRadius:
                                            //           BorderRadius.circular(5),
                                            //     ),
                                            //   ),
                                            // ),
                                          ]),
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      // Container(
                                      //   height: 50,
                                      //   width: 300,
                                      //   child: ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //       primary: Colors.blue, // background
                                      //       onPrimary: Colors.white, // foreground
                                      //     ),
                                      //     onPressed: () {
                                      //       Get.toNamed(Routes.addBrand);
                                      //     },
                                      //     child: Text(
                                      //       'Save and Continue',
                                      //       style: TextStyle(color: Colors.grey[50]),
                                      //     ),
                                      //   ),
                                      // ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Get.toNamed(
                                            //     Routes.productInventoryStep2);
                                            // if (formKey.currentState
                                            //         ?.validate() ??
                                            //     false) {
                                            //   formKey.currentState?.save();
                                            controller.addProduct();
                                            print("muthuvel");
                                            // }
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0))),
                                            height: AppUtils.vs(65, context),
                                            width: AppUtils.vs(300, context),
                                            child: Center(
                                              child: Text(
                                                (Get.arguments['fromScreen'] ==
                                                        StringResources
                                                            .addProduct)
                                                    ? 'Save and Continue'
                                                    : 'Update',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
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
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }

  Future<void> addVideo() async {
    result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      videoFile = File(file?.path ?? '');

      final fileName = (videoFile?.path.split('/').last);
      print(fileName);
      setState(() {
        selectedFileName = fileName;
      });
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }
}
