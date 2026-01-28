import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/controller/configureitems_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddConfigureItemsPage extends StatefulWidget {
  const AddConfigureItemsPage({super.key});

  @override
  State<AddConfigureItemsPage> createState() => _AddConfigureItemsPageState();
}

class _AddConfigureItemsPageState extends State<AddConfigureItemsPage> {
  ConfigureItemsController controller = Get.put(ConfigureItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.colorF3F4F8,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomAppBar(
                  titleText: "Manage Attribute Items",
                  onBackButtonPressed: () {},
                ),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 500,
                        margin: const EdgeInsets.only(left: 15, right: 7),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorResource.colorFFFFFF,
                            // border: Border.all(
                            //   color: Color(0xffe3e3e5),
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add Width (mm) Item",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Title",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorResource.color252525,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 40,
                                      width: 350,
                                      child: CustomTextField(
                                          "", controller.titleController)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Product Slug",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorResource.color252525,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 40,
                                      width: 350,
                                      child: CustomTextField("",
                                          controller.productSlugController)),
                                ],
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
                                height: AppUtils.vs(300, context),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25, top: 150),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.addConfigureItems();
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.0))),
                                            height: AppUtils.vs(65, context),
                                            width: AppUtils.vs(200, context),
                                            child: const Center(
                                              child: Text(
                                                "Add Items",
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        child: Container(
                          height: AppUtils.hs(900, context),
                          margin: const EdgeInsets.only(left: 15, right: 7),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorResource.colorFFFFFF,
                              // border: Border.all(
                              //   color: Color(0xffe3e3e5),
                              // ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Width (mm) Attribute Data",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     Get.toNamed(Routes.addBrand);
                                          //   },
                                          //   child: Container(
                                          //     decoration: const BoxDecoration(
                                          //         color: ColorResource
                                          //             .color0D5EF8,
                                          //         borderRadius:
                                          //             BorderRadius.all(
                                          //                 Radius.circular(
                                          //                     3.0))),
                                          //     height: AppUtils.vs(65, context),
                                          //     width: AppUtils.vs(200, context),
                                          //     child: const Center(
                                          //       child: Text(
                                          //         "Add Attributes",
                                          //         style: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: 14),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              "S.NO",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                                child: Text(
                                              StringResources.name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                                child: Text(
                                              "Slug",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                                child: Text(
                                              "Action",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )))
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0.5,
                                    color: ColorResource.colorDDDDDD,
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                          itemCount: controller
                                                  .viewConfigureData
                                                  .viewConfigureitem
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, i) {
                                            int sNo = i + 1;
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Center(
                                                          child: Text(
                                                        "$sNo",
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ))),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Center(
                                                          child: Text(controller
                                                                  .viewConfigureData
                                                                  .viewConfigureitem?[
                                                                      i]
                                                                  .itemname ??
                                                              ''))),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Center(
                                                          child: Text(
                                                        controller
                                                                .viewConfigureData
                                                                .viewConfigureitem?[
                                                                    i]
                                                                .itemslug ??
                                                            '',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ))),
                                                  const Expanded(
                                                    flex: 3,
                                                    child: Row(children: [
                                                      Expanded(
                                                          child: Text(
                                                              "No Permission",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14)))
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
