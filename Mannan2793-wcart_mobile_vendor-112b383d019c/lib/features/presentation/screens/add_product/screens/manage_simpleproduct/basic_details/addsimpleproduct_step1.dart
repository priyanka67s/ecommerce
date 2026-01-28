import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/model/all_tagslist_model.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/controller/simpleproduct_controller.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';
import 'widgets/multi_dropdown_widgets.dart';
import 'widgets/photo_widgets.dart';

class SimpleProductStep1Page extends StatefulWidget {
  const SimpleProductStep1Page({super.key});

  static const String routeName = '/add_product';

  @override
  State<SimpleProductStep1Page> createState() => _SimpleProductStep1PageState();
}

class _SimpleProductStep1PageState extends State<SimpleProductStep1Page> {
  final TextEditingController searchController = TextEditingController();
  // final categoriesController = MultiSelectController<String>();

  String? fileName;
  FilePickerResult? result;
  String? selectedFileName;

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
  

  final formKey = GlobalKey<FormState>();

  final MultiSelectController<Tags> tagMultiSelectController =
      MultiSelectController();

  @override
  Widget build(BuildContext context) {
    SimpleProductController controller =
        Get.put(SimpleProductController(), permanent: false);
    return GetBuilder<SimpleProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    CustomAppBar(
                      titleText: 'Manage Products ',
                      onBackButtonPressed: () {
                        if (Get.arguments['fromScreen'] ==
                            StringResources.editProduct) {
                          controller.getSimpleProduct1Data();
                        } else {
                          controller.allCategory();
                          controller.allTags();
                          controller.allBrand();
                        }
                      },
                      isLoading: controller.status.isLoading,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: ColorResource.colorFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30),
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
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextField(
                                              "Product Name",
                                              controller.productNameController,
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
                                                color:
                                                    ColorResource.color252525,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            controller.allCategoryData
                                                        .categories ==
                                                    null
                                                ? multiDropDownWidget(
                                                    items: [],
                                                    title: "Categories",
                                                    onSelectionChange:
                                                        (value) {},
                                                  )
                                                : multiDropDownWidget(
                                                    items: controller
                                                            .allCategoryData
                                                            .categories
                                                            ?.map((category) {
                                                          final name = category
                                                              .termName
                                                              ?.toString();
                                                          final termName =
                                                              category
                                                                  .termFullName
                                                                  ?.toString();

                                                          print(
                                                              'termName: $termName'); // Debugging termImage value

                                                          return DropdownItem<
                                                              String>(
                                                            value: category
                                                                    .termId
                                                                    .toString() ??
                                                                '', // Ensure there's a valid value
                                                            label: termName ??
                                                                'Unknown', // Ensure there's a visible label
                                                            selected: controller
                                                                .getIsCategorySelected(
                                                                    name ?? '',
                                                                    category.termId
                                                                            .toString() ??
                                                                        ''),
                                                          );
                                                        }).toList() ??
                                                        [],
                                                    controller: controller
                                                        .categoriesController,
                                                    title: "Categories",
                                                    onSelectionChange: (value) {
                                                      controller
                                                          .primaryCategoriesController
                                                          .clearAll();
                                                      debugPrint(
                                                          "Selected Categories: $value");
                                                      setState(() {
                                                        // Clear old items
                                                        controller
                                                            .primaryCategoryList
                                                            .clear();
                                                        // Convert raw values to a Set first to remove duplicates
                                                        final uniqueValues =
                                                            value.toSet();
                                                        // Add new selected categories with unique values only
                                                        controller
                                                            .primaryCategoryList
                                                            .addAll(uniqueValues
                                                                .map((item) {
                                                          return DropdownItem<
                                                              String>(
                                                            value: item,
                                                            label: controller
                                                                    .allCategoryData
                                                                    .categories
                                                                    ?.firstWhere((data) =>
                                                                        data.termId
                                                                            .toString() ==
                                                                        item)
                                                                    .termFullName ??
                                                                '',
                                                            selected: item ==
                                                                uniqueValues
                                                                    .first,
                                                          );
                                                        }).toList());
                                                        // Set the first item as the selected item in the controller
                                                        if (controller
                                                            .primaryCategoryList
                                                            .isNotEmpty) {
                                                          if (controller
                                                              .primaryCategoriesController
                                                              .items
                                                              .contains(
                                                                 controller
                                                                  .primaryCategoryList
                                                                      .last)) {
                                                          } else {
                                                            controller
                                                                .primaryCategoriesController
                                                                .addItem(
                                                                  controller
                                                                    .primaryCategoryList
                                                                        .last);
                                                            controller
                                                                .primaryCategoriesController
                                                                .selectAtIndex(
                                                                    0);
                                                          }
                                                        } else {
                                                          controller
                                                                  .primaryCategoriesController =
                                                              MultiSelectController<
                                                                  String>();
                                                        }
                                                        if (categories
                                                            .isNotEmpty) {
                                                          controller
                                                              .primaryCategoriesController
                                                              .selectAtIndex(0);
                                                        }
                                                      });
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            controller
                                                    .primaryCategoryList.isEmpty
                                                ? multiDropDownWidget(
                                                    items: [],
                                                    title: "Primary Categories",
                                                    onSelectionChange:
                                                        (value) {},
                                                  )
                                                : multiDropDownWidget(
                                                    items: controller
                                                        .primaryCategoryList
                                                        .toList(),
                                                        
                                                    controller: controller
                                                        .primaryCategoriesController,
                                                    title: "Primary Categories",
                                                    onSelectionChange:
                                                        (value) {},
                                                    singleSelect: true,
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            controller.allTagsData.tags == null
                                                ? multiDropDownWidget(
                                                    items: [],
                                                    title: "Tags",
                                                    onSelectionChange:
                                                        (value) {},
                                                  )
                                                : multiDropDownWidget(
                                                    items: controller
                                                            .allTagsData.tags
                                                            ?.map((Tags) {
                                                          final termName = Tags
                                                              .tagname
                                                              ?.toString();
                                                          return DropdownItem<
                                                              String>(
                                                            value: Tags.tagid
                                                                    .toString() ??
                                                                '', // Ensure there's a valid value
                                                            label: termName ??
                                                                'Unknown', // Ensure there's a visible label
                                                            selected: controller
                                                                .getIsTagsSelected(
                                                              termName ?? '',
                                                            ),
                                                          );
                                                        }).toList() ??
                                                        [],
                                                    controller: controller
                                                        .tagsController,
                                                    title: "Tags",
                                                    onSelectionChange:
                                                        (value) {},
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
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              child: controller
                                                          .allTagsData.tags ==
                                                      null
                                                  ? multiDropDownWidget(
                                                      items: [],
                                                      title: "Brands",
                                                      onSelectionChange:
                                                          (value) {},
                                                    )
                                                  : multiDropDownWidget(
                                                      items: controller
                                                              .allBrandData
                                                              .brands
                                                              ?.map((Tags) {
                                                            final brandName =
                                                                Tags.brandName!
                                                                    .toString();
                                                            final brandValue =
                                                                Tags.brandId!
                                                                    .toString();

                                                            print(
                                                                'termImage: $brandName'); // Debugging termImage value

                                                            return DropdownItem<
                                                                String>(
                                                              value:
                                                                  brandValue ??
                                                                      '',
                                                              label:
                                                                  brandName ??
                                                                      'Unknown',
                                                              selected: controller
                                                                  .getIsBrandSelected(
                                                                brandName ?? '',
                                                              ),
                                                            );
                                                          }).toList() ??
                                                          [
                                                            DropdownItem(
                                                              label: "Zara",
                                                              value: "1",
                                                            ),
                                                            DropdownItem(
                                                              label: "Levi's",
                                                              value: "2",
                                                            ),
                                                            DropdownItem(
                                                              label:
                                                                  "Allen Solly",
                                                              value: "3",
                                                            )
                                                          ],
                                                      controller: controller
                                                          .brandController,
                                                      title: "brand",
                                                      onSelectionChange:
                                                          (value) {},
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
                                  (Get.arguments?['productType'] ?? false)
                                      ? Row(
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
                                                  fontWeight: FontWeight.w500),
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
                                                  fontWeight: FontWeight.w500),
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
                                        )
                                      : SizedBox(),
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
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    "Short Description",
                                    maxLines: 5,
                                    keyBoardType: TextInputType.multiline,
                                    controller
                                        .productShortDescriptionController,
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
                                    maxLines: 7,
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
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                      child: SizedBox(
                                          height: 100,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                3, // Assuming you want exactly 5 items
                                            itemBuilder: (context, index) {
                                              final hasImage = index <
                                                  controller.imageFiles.length;

                                              return MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (controller
                                                            .imageFiles.length <
                                                        3) {
                                                      controller.addImage();
                                                    } else {
                                                      showInfoSnackBar(
                                                          "You can add only 3 images");
                                                    }
                                                  },
                                                  child: photoWidget(
                                                    hasImage
                                                        ? controller
                                                            .imageFiles[index]
                                                        : null,
                                                    index,
                                                    controller,
                                                  ),
                                                ),
                                              );
                                            },
                                          )) // : GestureDetector(
                                      //     onTap: () async {
                                      // controller.addImage();
                                      //     },
                                      //     child: Container(
                                      //       height: 150,
                                      //       width: 150,
                                      //       child: SizedBox(
                                      //         child: Icon(Icons.camera),
                                      //       ),
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey[100],
                                      //         border: Border.all(
                                      //           color: Colors.grey,
                                      //         ),
                                      //         borderRadius:
                                      //             BorderRadius.circular(
                                      //                 5),
                                      //       ),
                                      //     ),
                                      //   ),
                                      ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Upload Product Video',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(spacing: 10, children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await addVideo(controller);
                                        },
                                        child: DottedBorder(
                                          radius: Radius.circular(3),
                                          color: Colors.grey.shade800,
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Text('Choose Video',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      selectedFileName != null
                                          ? 'Selected file: $selectedFileName'
                                          : 'No File Chosen',
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          (Get.arguments['fromScreen'] ==
                                                  StringResources.addProduct)
                                              ? controller.addProduct()
                                              : controller.updateProduct();
                                        }
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        height: 40,
                                        width: AppUtils.vs(300, context),
                                        child: Center(
                                          child: Text(
                                            (Get.arguments?['fromScreen']
                                                        .toString() ==
                                                    StringResources.addProduct)
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
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Future<void> addVideo(SimpleProductController controller) async {
    result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      controller.videoFile = File(file?.path ?? '');

      final fileName = (controller.videoFile?.path.split('/').last);
      print(fileName);
      setState(() {
        selectedFileName = fileName;
      });
    } else {
      // User canceled the picker
      showWarningSnackBar("Image not selected");
    }
  }
}
