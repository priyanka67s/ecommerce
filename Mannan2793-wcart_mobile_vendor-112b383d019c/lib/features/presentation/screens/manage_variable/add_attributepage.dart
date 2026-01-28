import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/basic_details/controller/simpleproduct_controller.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_variable/controller/addattribute_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddAttributePage extends StatefulWidget {
  const AddAttributePage({super.key});

  @override
  State<AddAttributePage> createState() => _AddAttributePageState();
}

class _AddAttributePageState extends State<AddAttributePage> {
  AddAttributeController controller = Get.put(AddAttributeController());
  SimpleProductController basicDetailsController =
      Get.put(SimpleProductController());

  @override
  void initState() {
    if (Get.arguments != null && Get.arguments['edit']) {
      if (basicDetailsController.viewAllProductData.attrrelation != null) {
        basicDetailsController.viewAllProductData.attrrelation!
            .forEach((element) {
          controller.productAttribute.add(  
            ProductAttribute(
              attributeName: element.attributename ?? '',
              attributeValue: element.items ?? '',
              isEdit: false,
            ),
          );
        });
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAttributeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Column(
          children: [
            CustomAppBar(
              titleText:
                  'Product Name : ${controller.viewProductData.product?.first.name ?? ''}',
              onBackButtonPressed: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(                        
                  height: AppUtils.vs(1500, context),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Attribute",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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

                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorResource.color1c1d22),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0)),
                                      ),
                                    ),
                                    hint: const Text('Select Data'),
                                    items: controller
                                        .viewAttributeData.attributes
                                        ?.map((item) => item.attributename
                                            .toString()) // convert to string list
                                        .toSet() // <-- remove duplicates here
                                        .map(
                                            (value) => DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                ))
                                        .toList(),
                                    onChanged: (newVal) {
                                      setState(() {
                                        controller.attributeDropDownValue =
                                            newVal;
                                      });
                                    },
                                    value: controller
                                                .viewAttributeData.attributes
                                                ?.map((e) =>
                                                    e.attributename.toString())
                                                .toSet()
                                                .contains(controller
                                                    .attributeDropDownValue) ==
                                            true
                                        ? controller.attributeDropDownValue
                                        : null, // fallback if value not found
                                  )
                                  // CustomTextField("Select Data",
                                  //     controller.productNameController),
                                ],
                              ),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 0,
                                )),
                            Expanded(
                              flex: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Select Attribute Value",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField("Select Data",
                                      controller.productNameController),
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
                          spacing: 50,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  // Get.toNamed(Routes.variation);
                                  controller.saveAttribute();
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: ColorResource.color0D5EF8,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0))),
                                  height: AppUtils.vs(75, context),
                                  width: AppUtils.vs(250, context),
                                  child: const Center(
                                    child: Text(
                                      "Save Attribute",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            controller.productAttribute.isEmpty
                                ? Container()
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Get.toNamed(Routes.variation, arguments: {
                                        //   'productId': controller.viewProductData
                                        //       .product?.first.productid,
                                        // });

                                        Get.offNamed(
                                            Routes.productInventoryStep2,
                                            arguments: {
                                              'fromScreen':
                                                  StringResources.addInventory,
                                              'productId':
                                                  "${controller.viewProductData.product?.first.productid}",
                                            });
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorResource.color0D5EF8,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0))),
                                        height: AppUtils.vs(75, context),
                                        width: AppUtils.vs(250, context),
                                        child: const Center(
                                          child: Text(
                                            "Continue",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 0.5,
                          color: ColorResource.colorDDDDDD,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.productAttribute.isEmpty
                            ? SizedBox()
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: controller.productAttribute.length,
                                  // controller
                                  //     .viewProductData.product?.length,
                                  itemBuilder: (context, i) {
                                    return attributeItem(
                                        controller, i, context);
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Column attributeItem(
      AddAttributeController controller, int i, BuildContext context) {
    return Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Text(
                controller.productAttribute[i].attributeName ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    controller.deleteAttribute(i);
                  },
                  child: const SvgIcon(
                    'assets/icon/svg/remove.svg',
                    height: 30,
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    controller.editAttribute(i);
                  },
                  child: const SvgIcon(
                    'assets/icon/svg/edit.svg',
                    height: 30,
                  ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
        Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Text(
                'selected items: ${controller.productAttribute[i].attributeValue}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
        controller.productAttribute[i].isEdit == true
            ? editItemsView(controller, context, i)
            : SizedBox(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Padding editItemsView(
      AddAttributeController controller, BuildContext context, int i) {
    TextEditingController productNameController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Edit items",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 350,
                height: 55,
                child: CustomTextField(
                  "Select Attribute",
                  productNameController,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    controller.updateAttribute(productNameController.text, i);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: ColorResource.color0D5EF8,
                        borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    height: AppUtils.vs(75, context),
                    width: AppUtils.vs(250, context),
                    child: const Center(
                      child: Text(
                        "Save Attribute",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
