import 'dart:async';

import 'package:animated_loading_bar/animated_loading_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/controller/tags_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';

import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddTagsPage extends StatefulWidget {
  const AddTagsPage({super.key});
  // static const String routeName = '/Edit Tags';
  @override
  State<AddTagsPage> createState() => _AddTagsPageState();
}

class _AddTagsPageState extends State<AddTagsPage> {
  final formKey = GlobalKey<FormState>();
  TagsController controller = Get.put(TagsController());
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TagsController>(builder: (controller) {
            
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
                                  StringResources.editTag)
                          ? 'Update Tag'
                          : 'Add Tag',
                      onBackButtonPressed: () {},
                      isLoading: controller.status.isLoading ? true : false,
                    ),
                    
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(                        
                        height: 800,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: StreamBuilder<Object>(
                              stream: null,
                              builder: (context, snapshot) {
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 30),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      "Name ",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: ColorResource
                                                            .color252525,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextField(
                                                      "",
                                                      controller
                                                          .tagNameController,
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
                                                      "Tag Type",
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
                                                    //! custom Popup menu
                                                    CustomDropdownButton(
                                                      hint: '',
                                                      dropdownWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.37,
                                                      offset:
                                                          const Offset(0, -10),
                                                      value:
                                                          controller.statusTag,
                                                      dropdownItems: controller
                                                          .tagDropdownList,
                                                      onChanged: (val, key) {
                                                        setState(() {
                                                          controller.statusTag =
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
                                                      "Status",
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
                                                              3.37,
                                                      offset:
                                                          const Offset(0, -10),
                                                      hint: '',
                                                      value: controller
                                                          .statusValue,
                                                      dropdownItems: controller
                                                          .statusDropdownList,
                                                      onChanged: (val, key) {
                                                        setState(() {
                                                          controller
                                                                  .statusValue =
                                                              val;
                                                        });
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            children: [],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                "Image",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      controller.tagImage();
                                                    },
                                                    child: DottedBorder(
                                                      radius:
                                                          Radius.circular(10.0),
                                                      borderType:
                                                          BorderType.RRect,
                                                      color:
                                                          Colors.grey.shade600,
                                                      child: Container(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        height: 100,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              Colors.grey[100],
                                                        ),
                                                        child: controller
                                                                    .imageFile !=
                                                                null
                                                            ? Image.file(
                                                                controller
                                                                    .imageFile!)
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
                                                    Get.arguments[
                                                            'fromScreen'] ==
                                                        StringResources.editTag)
                                                  controller.imageUrl != null
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: DottedBorder(
                                                            radius:
                                                                Radius.circular(
                                                                    10.0),
                                                            borderType:
                                                                BorderType
                                                                    .RRect,
                                                            color: Colors
                                                                .grey.shade600,
                                                            child: Container(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              height: 90,
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(                                                                
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    controller
                                                                        .imageUrl!,
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image
                                                                        .network(
                                                                  'https://wcartnode.webnexs.org/products/default.png',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(),
                                              ]),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Meta Details",
                                            style: TextStyle(
                                              fontSize: 20,
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
                                                        color: ColorResource
                                                            .color252525,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextField(
                                                        "",
                                                        controller
                                                            .metaTitleController),
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
                                                      value: controller
                                                          .allowSearch,
                                                      dropdownItems: controller
                                                          .allowSearchDropdownList,
                                                      onChanged: (val, key) {
                                                        setState(() {
                                                          controller
                                                                  .allowSearch =
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
                                                      value: controller
                                                          .searchFollow,
                                                      dropdownItems: controller
                                                          .searchFollowDropdownList,
                                                      onChanged: (val, key) {
                                                        setState(() {
                                                          controller
                                                                  .searchFollow =
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
                                                        color: ColorResource
                                                            .color252525,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    CustomTextField(
                                                      "",
                                                      controller
                                                          .metaKeywordController,
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
                                                "Meta Description ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: controller
                                                .metaDescriptionController,

                                            maxLines: 2,
                                            // expands: true,
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: "",
                                              hintStyle: TextStyle(
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
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: ColorResource
                                                        .color0D5EF8
                                                        .withOpacity(0.07),
                                                    spreadRadius: 0.0,
                                                    blurRadius: 25.0,
                                                    offset:
                                                        const Offset(0.0, 8.0)),
                                              ],
                                              color: Colors.white,
                                            ),
                                            height: AppUtils.vs(139, context),
                                            width: double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 25),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: AppUtils.vs(
                                                            200, context),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorResource
                                                                    .color0D5EF8),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        3.0))),
                                                        child: const Center(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: ColorResource
                                                                    .color0D5EF8,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print('muthuvel');
                                                        // if (formKey.currentState
                                                        //         ?.validate() ??
                                                        //     false) {
                                                        //   formKey.currentState?.save();
                                                        controller.addTags();
                                                        // }
                                                      },
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: ColorResource
                                                                .color0D5EF8,
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        3.0))),
                                                        height: 40,
                                                        width: AppUtils.vs(
                                                            200, context),
                                                        child: Center(
                                                          child: Text(
                                                            Get.arguments !=
                                                                        null &&
                                                                    (Get.arguments[
                                                                            'fromScreen'] ==
                                                                        StringResources
                                                                            .editTag)
                                                                ? 'Update Tag'
                                                                : 'Add Tag',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
}
