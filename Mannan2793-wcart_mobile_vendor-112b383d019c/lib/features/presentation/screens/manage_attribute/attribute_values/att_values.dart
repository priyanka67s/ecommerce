import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/attribute_values/controller/att_values_controller.dart';
import 'package:wcart_vendor/features/presentation/widgets/svg-icon.widget.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class AttValues extends StatefulWidget {
  AttValues({super.key});

  @override
  State<AttValues> createState() => _AttValuesState();
}

class _AttValuesState extends State<AttValues> {
  AttValuesController controller = Get.put(AttValuesController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  initState() {
    super.initState();

    controller.getAttributeItems(Get.arguments['slug']);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttValuesController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  titleText: "Manage Attributes",
                  onBackButtonPressed: () {},
                  showAction: false,
                    isLoading: controller.status.isLoading,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Add ${controller.title} Item",
                              style: TextStyle(
                                  color: ColorResource.color252525,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: ColorResource.colorE5E5E5,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorResource.color252525,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 350,
                                  child: CustomTextField(
                                    validationRules: ['required'],
                                    "Attribute Name",
                                    controller.titleController,
                                    validatorCallBack: (val) {
                                      print(val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 25, top: 50),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    spacing: 20,
                                    children: [
                                      controller.selectedIndex != null
                                          ? GestureDetector(
                                              onTap: () {
                                                controller.clearValues();
                                              },
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                        color: ColorResource
                                                            .color0D5EF8,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    3.0))),
                                                    height: AppUtils.vs(
                                                        65, context),
                                                    width: AppUtils.vs(
                                                        200, context),
                                                    child: const Center(
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      GestureDetector(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            controller.addAttribute();
                                          }
                                        },
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.0))),
                                            height: AppUtils.vs(65, context),
                                            width: AppUtils.vs(200, context),
                                            child: Center(
                                              child: Text(
                                                controller.selectedIndex != null
                                                    ? "Update"
                                                    : "Add Attribute",
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.title} Attribute Data",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: ColorResource.colorE5E5E5,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "S.NO",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      StringResources.name,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      "Slug",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Action",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: ColorResource.colorDDDDDD,
                              ),
                              Expanded(
                                  child: controller.viewAttributeItemData
                                                  .items !=
                                              null &&
                                          controller.viewAttributeItemData
                                              .items!.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: controller
                                                  .viewAttributeItemData
                                                  .items
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            final sno = index + 1;
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      "$sno",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      controller
                                                          .viewAttributeItemData
                                                          .items![index]
                                                          .itemname
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      controller
                                                          .viewAttributeItemData
                                                          .items![index]
                                                          .itemslug
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: SizedBox(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller.editAttribute(
                                                                    context,
                                                                    controller
                                                                        .viewAttributeItemData
                                                                        .items![index],
                                                                    index);
                                                              },
                                                              child: SvgIcon(
                                                                'assets/icon/svg/edit.svg',
                                                                height: 40,
                                                              ),
                                                            ),
                                                          ),
                                                          // IconButton(
                                                          //     onPressed: () {},
                                                          //     icon: Icon(
                                                          //       Icons.delete,
                                                          //       color:
                                                          //           Colors.grey[600],
                                                          //     )),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Text(
                                            "No Data Found",
                                            style: TextStyle(
                                                fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
