import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/widgets/multi_dropdown_widgets.dart';

import 'package:wcart_vendor/features/presentation/screens/manage_categories/controller/addcategory_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});
  static const routeName = '/Add Category';
  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final formKey = GlobalKey<FormState>();
  CategoryController controller = Get.put(CategoryController());
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      print('screen status ---> ${controller.status.isLoading}');
      return GetBuilder<CategoryController>(builder: (controller) {
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
                        titleText: 'Add New Category',
                        onBackButtonPressed: () {},
                        isLoading: controller.status.isLoading,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            // height: AppUtils.vs(2000, context),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                "Title",
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
                                                "",
                                                controller
                                                    .categoryTitleController,
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
                                                "Slug",
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
                                                "",
                                                controller
                                                    .categorySlugController,
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
                                                "Parent Category",
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
                                                      title:
                                                          "Primary Categories",
                                                      onSelectionChange:
                                                          (value) {},
                                                    )
                                                  : multiDropDownWidget(
                                                      items: controller
                                                          .allCategoryData
                                                          .categories!
                                                          .map((item) {
                                                        return DropdownItem(
                                                          value: item
                                                              .termId
                                                              .toString(),
                                                          label: item
                                                              .termFullName
                                                              .toString(),
                                                          selected: (controller
                                                                          .viewcategoryData
                                                                          .status !=
                                                                      null &&
                                                                  controller
                                                                          .viewcategoryData
                                                                          .viewCategory![
                                                                              0]
                                                                          .parent ==
                                                                      item.termId)
                                                              ? true
                                                              : false,
                                                        );
                                                      }).toList(),
                                                      controller: controller
                                                          .categoryTypesController,
                                                      onSelectionChange:
                                                          (value) {
                                                        setState(() {
                                                          debugPrint(
                                                              "value$value");
                                                          controller
                                                                  .categoryDropdownValue =
                                                              value[0];
                                                        });
                                                      },
                                                      title: "Data",
                                                      singleSelect: true,
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
                                                "Select Attributes",
                                                style: TextStyle( 
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              controller.viewAttributeData
                                                          .attributes ==
                                                      null
                                                  ? multiDropDownWidget(
                                                      items: [],
                                                      title:
                                                          "Primary Categories",
                                                      onSelectionChange:
                                                          (value) {},
                                                    )
                                                  : multiDropDownWidget(
                                                      items: controller
                                                          .viewAttributeData
                                                          .attributes!
                                                          .map((attributes) =>
                                                                // attributes
                                                                //     .attributename
                                                                //     ?.toString() ?
                                                              DropdownItem<
                                                                  String>(
                                                              value: attributes
                                                                  .id
                                                                  .toString(),
                                                              label: attributes
                                                                      .attributename ??
                                                                  'Unknown',
                                                              selected: (controller
                                                                              .viewcategoryData
                                                                              .status !=
                                                                          null &&
                                                                      controller
                                                                              .viewcategoryData
                                                                              .viewCategory![
                                                                                  0]
                                                                              .catAttribute ==
                                                                          attributes
                                                                              .id
                                                                              .toString())
                                                                  ? true
                                                                  : false,
                                                            ),
                                                          )
                                                          // .toSet() // Remove duplicates
                                                          // .map((termName) =>
                                                          //     )
                                                          .toList(),
                                                      controller:
                                                         controller
                                                          .attributesController,
                                                      onSelectionChange:
                                                          (value) {
                                                        setState(() {
                                                          debugPrint(
                                                              "value$value");
                                                        });
                                                      },
                                                      title: "Attributes",
                                                      singleSelect: true,
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
                                          "Description ",
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
                                          .categoryDescriptionController,
                                      maxLines: 2,
                                      // expands: true,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: "",
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [ 
                                          categoryImagePicker(
                                              controller, controller.imageUrl1),
                                          iconImagePicker(controller),
                                          bannerWidget(controller),
                                        ],
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(15.0),
                                    //   child: Row(
                                    //     children: [
                                    //       bannerImageWidget(controller),
                                    //       offerBannerWidget(controller),
                                    //       offerBannerMobileWidget(controller)
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
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
                                                "Status",
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
                                              CustomDropdownButton(
                                                hint: '',
                                                dropdownWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.20,
                                                offset: const Offset(0, -10),
                                                value: controller.statusValue,
                                                dropdownItems: controller
                                                    .statusDropdownList,
                                                onChanged: (val, key) {
                                                  setState(() {
                                                    controller.statusValue =
                                                        val;
                                                  });
                                                },
                                              )
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
                                                "Featured Category",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomDropdownButton(
                                                dropdownWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2.20,
                                                offset: const Offset(0, -10),
                                                hint: '',
                                                value: controller
                                                    .featuredCategoryValue,
                                                dropdownItems: controller
                                                    .featuredCategoryDropdownList,
                                                onChanged: (val, key) {
                                                  setState(() {
                                                    controller
                                                            .featuredCategoryValue =
                                                        val;
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
                                    Text(
                                      "Meta Details",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: ColorResource.color000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex: 20,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Meta Title ",
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
                                                "",
                                                controller.metaTitleController,
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
                                              CustomDropdownButton(
                                                hint: '',
                                                dropdownWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4.08,
                                                offset: const Offset(0, -10),
                                                value: controller.allowSearch,
                                                dropdownItems: controller
                                                    .allowSearchDropdownList,
                                                onChanged: (val, key) {
                                                  setState(() {
                                                    controller.allowSearch =
                                                        val;
                                                  });
                                                },
                                              )
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
                                                "Search Follow",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomDropdownButton(
                                                hint: '',
                                                dropdownWidth:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        4.08,
                                                offset: const Offset(0, -10),
                                                value: controller.searchFollow,
                                                dropdownItems: controller
                                                    .searchFollowDropdownList,
                                                onChanged: (val, key) {
                                                  setState(() {
                                                    controller.searchFollow =
                                                        val;
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Meta Keywords ",
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
                                                  "",
                                                  controller
                                                      .metaKeywordController),
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
                                          "Meta Description ",
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
                                      controller:
                                          controller.metaDescriptionController,
                                      maxLines: 2,
                                      // expands: true,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        hintText: "",
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
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: ColorResource.color0D5EF8
                                                  .withOpacity(0.07),
                                              spreadRadius: 0.0,
                                              blurRadius: 25.0,
                                              offset: const Offset(0.0, 8.0)),
                                        ],
                                        color: Colors.white,
                                      ),
                                      height: AppUtils.vs(139, context),
                                      width: double.infinity,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: AppUtils.vs(150, context),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: ColorResource
                                                        .color0D5EF8),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    3.0,
                                                  ),
                                                ),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: ColorResource
                                                        .color0D5EF8,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                onTap: () {
                                                  // if (formKey.currentState
                                                  //         ?.validate() ??
                                                  //     false) {
                                                  //   formKey.currentState?.save();
                                                  // }
                                                  print('muthuvel');
                                                  controller.addCategory(
                                                      context: context);
                                                },
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: ColorResource
                                                        .color0D5EF8,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        3.0,
                                                      ),
                                                    ),
                                                  ),
                                                  height: 40,
                                                  width:
                                                      AppUtils.vs(250, context),
                                                  child: Center(
                                                    child: Text(
                                                      Get.arguments == null ||
                                                              Get.arguments[
                                                                      'fromScreen'] ==
                                                                  StringResources
                                                                      .editCategory
                                                          ? "Update Category"
                                                          : "Add Category",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
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
    });
  }

  Expanded offerBannerMobileWidget(CategoryController controller) {
    return Expanded(
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Offer Banner - Mobile",
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.color252525,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(spacing: 20, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  controller.addOfferBannerMobile();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorResource.colorC4CACD,
                  radius: Radius.circular(15),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: controller.imageFile5 != null
                        ? Image.file(controller.imageFile5!)
                        : SizedBox(
                            child: SvgIcon(
                              'assets/icon/svg/camer.svg',
                              height: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (Get.arguments != null &&
                Get.arguments['fromScreen'] == StringResources.addCategory)
              controller.imageUrl5 != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: ColorResource.colorC4CACD,
                        radius: Radius.circular(13),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              13,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: controller.imageUrl5!,
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                'https://wcartnode.webnexs.org/products/default.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
          ]),
        ],
      ),
    );
  }

  Expanded offerBannerWidget(CategoryController controller) {
    return Expanded(
        child: Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Offer Banner",
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorResource.color252525,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(spacing: 20, children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                controller.addOfferBanner();
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: ColorResource.colorC4CACD,
                radius: Radius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  height: 100,
                  width: 100,
                  child: controller.imageFile4 != null
                      ? Image.file(controller.imageFile4!)
                      : SizedBox(
                          child: SvgIcon(
                            'assets/icon/svg/camer.svg',
                            height: 30,
                          ),
                        ),
                ),
              ),
            ),
          ),
          if (Get.arguments != null &&
              Get.arguments['fromScreen'] == StringResources.editCategory)
            controller.imageUrl4 != null
                ? DottedBorder(
                    borderType: BorderType.RRect,
                    color: ColorResource.colorC4CACD,
                    radius: Radius.circular(
                      13,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: CachedNetworkImage(
                          imageUrl: controller.imageUrl4!,
                          errorWidget: (context, url, error) => Image.network(
                            'https://wcartnode.webnexs.org/products/default.png',
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
        ])
      ],
    ));
  }

  Expanded bannerImageWidget(CategoryController controller) {
    return Expanded(
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Banner - Mobile",
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.color252525,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(spacing: 20, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  controller.addBannerMobile();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorResource.colorC4CACD,
                  radius: Radius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 100,
                    width: 100,
                    child: controller.imageFile3 != null
                        ? Image.file(controller.imageFile3!)
                        : const SizedBox(
                            child: SvgIcon(
                              'assets/icon/svg/camer.svg',
                              height: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (Get.arguments != null &&
                Get.arguments['fromScreen'] == StringResources.editCategory)
              controller.imageUrl3 != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: ColorResource.colorC4CACD,
                      radius: Radius.circular(
                        15,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            13,
                          ),
                        ),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: CachedNetworkImage(
                            imageUrl: controller.imageUrl3!,
                            errorWidget: (context, url, error) => Image.network(
                              'https://wcartnode.webnexs.org/products/default.png',
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
          ]),
        ],
      ),
    );
  }

  Expanded bannerWidget(CategoryController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "Banner",
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.color252525,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(spacing: 20, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  controller.addBanner();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorResource.colorC4CACD,
                  radius: Radius.circular(15),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: controller.imageFile2 != null
                        ? Image.file(
                            controller.imageFile2!,
                          )
                        : SizedBox(
                            child: SvgIcon(
                              'assets/icon/svg/camer.svg',
                              height: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (Get.arguments != null &&
                Get.arguments['fromScreen'] == StringResources.editCategory)
              controller.imageUrl2 != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: ColorResource.colorC4CACD,
                      radius: Radius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(13),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: controller.imageUrl2!,
                            errorWidget: (context, url, error) => Image.network(
                              'https://wcartnode.webnexs.org/products/default.png',
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
          ]),
        ],
      ),
    );
  }

  Expanded iconImagePicker(CategoryController controller) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text(
            "Icon",
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.color252525,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(spacing: 20, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  controller.addIcon();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorResource.colorC4CACD,
                  radius: Radius.circular(15),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: controller.imageFile6 != null
                        ? Image.file(controller.imageFile6!)
                        : SizedBox(
                            child: SvgIcon(
                              'assets/icon/svg/camer.svg',
                              height: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (Get.arguments != null &&
                Get.arguments['fromScreen'] == StringResources.editCategory)
              controller.imageUrl6 != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: ColorResource.colorC4CACD,
                      radius: Radius.circular(15),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              13,
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: controller.imageUrl6!,
                            errorWidget: (context, url, error) => Image.network(
                              'https://wcartnode.webnexs.org/products/default.png',
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
          ]),
        ],
      ),
    );
  }

  Expanded categoryImagePicker(
    CategoryController controller,
    String? httpImage,
  ) {
    return Expanded(
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Image",
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.color252525,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(spacing: 20, children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  controller.addImage();
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: ColorResource.colorC4CACD,
                  radius: Radius.circular(15),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: controller.imageFile1 != null
                        ? Image.file(controller.imageFile1!)
                        : SizedBox(
                            child: SvgIcon(
                              'assets/icon/svg/camer.svg',
                              height: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (Get.arguments != null &&
                Get.arguments['fromScreen'] == StringResources.editCategory)
              httpImage != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      color: ColorResource.colorC4CACD,
                      radius: Radius.circular(15),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: httpImage,
                            errorWidget: (context, url, error) => Image.network(
                              'https://wcartnode.webnexs.org/products/default.png',
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
          ])
        ],
      ),
    );
  }
}
