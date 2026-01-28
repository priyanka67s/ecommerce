import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/model/selectedwarehuse_model.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/inventory/controller/inventory_controller.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/newtextformfield.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class ProductInventoryStep2Page extends StatefulWidget {
  const ProductInventoryStep2Page({super.key});
  static const String routeName = '/edit_inventory';

  @override
  State<ProductInventoryStep2Page> createState() =>
      _ProductInventoryStep2PageState();
}

class _ProductInventoryStep2PageState extends State<ProductInventoryStep2Page> {
  final formKey = GlobalKey<FormState>();
  InventoryController controller =
      Get.put(InventoryController(), permanent: false);

  bool newValue = false;
  bool isCheckedTrack = false;
  bool isCheckedStock = false;

  final MultiSelectController<SelectedWarehouse>
      wareHouseMultiSelectController = MultiSelectController();

  @override
  void initState() {
    super.initState();
    debugPrint(Get.arguments.toString());
    controller.getSimpleProduct2Data(Get.arguments['productId']);
    controller.controllerWidth.text = "0";
    controller.controllerHeight.text = "0";
    controller.controllerLength.text =
        "0"; // Setting the initial value for the field.
  }

  // Widget wareHouseMultiSelectDropDownWidget() {
  //   List<ValueItem<SelectedWarehouse>> optionValue = [];

  //   for (var i = 0;
  //       i < (controller.selectedWarehouseData.selectedWarehouse ?? []).length;
  //       i++) {
  //     SelectedWarehouse warehouse =
  //         (controller.selectedWarehouseData.selectedWarehouse ?? [])[i];
  //     optionValue.add(
  //       ValueItem(
  //         label: warehouse.locationTitle ?? '',
  //         value: warehouse,
  //       ),
  //     );
  //   }
  //   return MultiSelectDropDown<SelectedWarehouse>(
  //     clearIcon: Icon(Icons.close),
  //     controller: wareHouseMultiSelectController,
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

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<InventoryController>(
      builder: (controller) {
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
                        titleText:
                            'Manage Products -> Edit Product:Product Name',
                        onBackButtonPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (Get.arguments['fromScreen'] ==
                                StringResources.addInventory) {
                              controller.getSimpleProduct2Data(
                                  Get.arguments['productId']);
                            }
                          });
                        },
                        isLoading: controller.status.isLoading,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Container(
                            color: ColorResource.colorffffff,
                            margin: EdgeInsets.only(top: 10),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: controller.viewAllProductData.product?[0]
                                            .producttype ==
                                        1
                                    ? inventoryDetails(controller, context,
                                        controller.expandedSubVariationId == 0,
                                        0)
                                    : controller.variationControllers.isEmpty
                                        ? SizedBox(
                                            width: size.width,
                                            child: Row(
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .createCombination();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: ColorResource
                                                              .color0D5EF8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0))),
                                                      height: 45,
                                                      width: AppUtils.vs(
                                                          300, context),
                                                      child: const Center(
                                                        child: Text(
                                                          "Create Combination",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                        children: [
                                          ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .variationControllers.length,
                                            itemBuilder: (context, index) {
                                              final controllerSet = controller
                                                  .variationControllers[index];
                                              debugPrint(
                                                  "Inventory Sku ${controllerSet.skuController.text}");
                                              final e = controller
                                                  .viewAllProductData
                                                  .wcvariations![index];
                                              bool isExpanded = controller
                                                      .expandedVariationId ==
                                                  e.vid;
                                              bool isExpandedSubVariation =
                                                  controller
                                                          .expandedSubVariationId ==
                                                      e.vid;
                                              return Container(
                                                width: size.width,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                margin:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  spacing: 20,
                                                  children: [
                                                        MouseRegion(
                                                          cursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .toggleVariation(
                                                                      e.vid!);
                                                            },
                                                            child: Text(
                                                              "#${e.vid}: ${e.variation.toString()}",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    if (isExpanded)
                                                      inventoryDetails(
                                                        controller,
                                                        context,
                                                        isExpandedSubVariation,
                                                            index,
                                                        e,
                                                        controllerSet,
                                                      ), // show only if expanded
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                              MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.clearCache();
                                                    Get.toNamed(
                                                            Routes
                                                                .metaDetailsStep3,
                                                            arguments: {
                                                          'fromScreen':
                                                              StringResources
                                                                  .addMetaDetails,
                                                          'productID':
                                                              "${controller.viewAllProductData.product?[0].productid}",
                                                        })!
                                                        .then((value) {
                                                      if (value ?? false) {
                                                        controller
                                                            .getSimpleProduct2Data(
                                                                Get.arguments[
                                                                    'productId']);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: ColorResource
                                                              .color0D5EF8,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0))),
                                                    height: AppUtils.vs(
                                                        65, context),
                                                    width: AppUtils.vs(
                                                        300, context),
                                                    child: const Center(
                                                      child: Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                          color: ColorResource
                                                              .color0D5EF8,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        ],
                                      )
// ,Column(
//                                         children: controller
//                                                 .viewAllProductData.wcvariations
//                                                 ?.map((e) {
//                                             }).toList() ??
//                                             [],
//                                       ),
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
      },
    );
  }

  Widget inventoryDetails(InventoryController controller, BuildContext context,
      bool showInventoryMethod,
      int index,
      [Wcvariations? e, VariationControllerSet? controllerSet]) {
    return Form(
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Inventory",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: 0,
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product shipping Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product SKU",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    "SKU",
                    isReadOnly: true,
                    controllerSet == null
                        ? controller.productSkuController
                        : controllerSet.skuController,
                    validationRules: const ['required'],
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
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shipping Cost ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    "cost",
                    controllerSet == null
                        ? controller.shippingCostController
                        : controllerSet.shippingCostController,
                    validationRules: const ['required'],
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
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Stock Quantity",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      "0",
                      controllerSet == null
                          ? controller.quantityController
                          : controllerSet.quantityController),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Column(
                children: [],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Low Stock Limit",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      "0",
                      controllerSet == null
                          ? controller.quantityController1
                          : controllerSet.quantityController),
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
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Weight(kg) ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IncrementDecrementTextField(
                        controller: controllerSet == null
                            ? controller.controllerWeight1
                            : controllerSet.weightController,
                        isReadOnly: false,
                        label: "weight",
                      ),
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: CustomDropdownButton(
                          hint: '',
                          value: controller.weightValue,
                          dropdownItems: controller.weightDropDownList,
                          onChanged: (val, key) {
                            setState(() {
                              controller.weightValue = val;
                            });
                          },
                        ),
                      ),
                      IncrementDecrementTextField(
                        controller: controllerSet == null
                            ? controller.controllerWeight1
                            : controllerSet.weightController,
                        isReadOnly: true,
                        label: controller.controllerWeight1.text == ''
                            ? 'weight'
                            : "${controller.controllerWeight1.text}${controller.weightValue}",
                        weightValue: controller.weightValue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Include Pincodes ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    "include Pincodes",
                    controller.includePinCodeController,
                    validationRules: const ['required'],
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
              flex: 10,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dimensions(cm)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IncrementDecrementTextField(
                        controller: controllerSet == null
                            ? controller.controllerLength
                            : controllerSet.lengthController,
                        isReadOnly: false,
                        label: 'Length',
                      ),
                      IncrementDecrementTextField(
                        controller: controllerSet == null
                            ? controller.controllerWidth
                            : controllerSet.widthController,
                        isReadOnly: false,
                        label: 'Width',
                      ),
                      IncrementDecrementTextField(
                        controller: controllerSet == null
                            ? controller.controllerHeight
                            : controllerSet.heightController,
                        isReadOnly: false,
                        label: 'Height',
                      ),
                    ],
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
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Exclude Pincodes ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    "exclude Pincodes",
                    controller.excludePinCodeController,
                    validationRules: const ['required'],
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
            e == null
                ? const Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[],
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  "0", controllerSet!.priceController),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Column(
                            children: [],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "sale price",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                  "0", controllerSet!.salePriceController),
                            ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(
                    () {
                      controller.toggleSubVariation(e?.vid ?? 0);
                      scrollController.animateTo(
                        500,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ColorResource.color0D5EF8,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  height: AppUtils.vs(65, context),
                  width: AppUtils.vs(300, context),
                  child: const Center(
                    child: Text(
                      "Add Inventory",
                      style: TextStyle(
                        color: ColorResource.color0D5EF8,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  // !need to fix this
                  e == null
                      ? controller.addInventory(
                          null, null, null, null, null, null, null, null, null)
                      : controller.addInventory(
                          e.vid!,
                          e.varsku,
                          controllerSet!.shippingCostController.text,
                          controllerSet!.lengthController.text,
                          controllerSet!.widthController.text,
                          controllerSet!.heightController.text,
                          controllerSet!.priceController.text,
                          controllerSet!.salePriceController.text,
                          controllerSet!.weightController.text,
                        );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: ColorResource.color0D5EF8,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  height: AppUtils.vs(65, context),
                  width: AppUtils.vs(300, context),
                  child: Center(
                    child: Text(
                      Get.arguments != null && Get.arguments['edit'] == true
                          ? "Update and continue"
                          : "Save & Continue",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        showInventoryMethod ? inventoryMethod(index, e) : SizedBox(),
      ]),
    );
  }

  Widget inventoryMethod(int index, [Wcvariations? e]) {
    // final SelectedWarehouse selectedWarehouse = (e == null)
    //     ? controller.selectedWarehouseData[0]
    //     ;
    return GetBuilder<InventoryController>(builder: (controller) {
      return Column(
        children: [
          Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Inventory",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (() {}),
                  child: const Text(
                    "History",
                    style: TextStyle(
                        color: ColorResource.color0D5EF8,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            const Text(
              "SKU CODE",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 400,
              child: CustomTextField(
                isReadOnly: true,
                "sku code",
                controller.productSkuController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          CheckboxListTile(
            title: const Text(
              "Track Quantity",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            value: isCheckedTrack,
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedTrack = newValue ?? false; // Update the checkbox state
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, // Leading checkbox
          ),

          const SizedBox(
            height: 5,
          ),
          CheckboxListTile(
            title: const Text(
              "Continue selling when out of stock",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            value: isCheckedStock,
            onChanged: (bool? newValue) {
              setState(() {
                isCheckedStock = newValue ?? false; // Update the checkbox state
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    controller.inventoryLocationUpdate(
                        isCheckedTrack, isCheckedStock);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: ColorResource.color0D5EF8,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    height: AppUtils.vs(65, context),
                    width: AppUtils.vs(200, context),
                    child: const Center(
                      child: Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              Text(
                "Locations",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller
                      .selectedWarehouseData[index].selectedWarehouse?.length ??
                  0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final location = controller.selectedWarehouseData[0]
                        .selectedWarehouse?[index].locationTitle ??
                    "";
                debugPrint("locaiton$location");
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.removeLocations(
                          controller.selectedWarehouseData[0]
                              .selectedWarehouse![index].warehouseId
                              .toString(),
                          location,
                          e == null
                              ? controller.viewAllProductData.product![0].sku
                              : e.sku);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: const Color.fromARGB(129, 238, 238, 238),
                        border: Border.all(
                          color: const Color.fromARGB(255, 221, 221, 221),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 10,
                        children: [
                          Text(
                            location,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.redAccent,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(129, 238, 238, 238),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Add New Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 400,
                      child: controller
                                  .selectedWarehouseData[0].selectedWarehouse ==
                              null
                          ? const Center(
                              child:
                                  CircularProgressIndicator()) // Show a loading indicator if data is not ready
                          : MultiDropdown<String>(
                              items: controller
                                      .selectedWarehouseData[0].listOfWarehouse
                                      ?.map((WarehouseAddress) {
                                        final termName = WarehouseAddress
                                            .locationTitle
                                            ?.toString();
                                        final territoryId = WarehouseAddress
                                            .warehouseId
                                            ?.toString();
                                        print(
                                            'termImage: $territoryId'); // Debugging termI
                                        return DropdownItem<String>(
                                          value: territoryId ??
                                              'sadfasfd', // Ensure there's a valid value
                                          label: termName ??
                                              'Unknown', // Ensure there's a visible label
                                        );
                                      })
                                      .toSet()
                                      .toList() ??
                                  [], // Handle null or empty list case
                              controller: controller.locationController,
                              enabled: true,
                              searchEnabled: true,
                              chipDecoration: ChipDecoration(
                                backgroundColor: Colors.grey[200],
                                wrap: true,
                                runSpacing: 2,
                                spacing: 10,
                              ),
                              fieldDecoration: FieldDecoration(
                                hintText: 'Select Tags',
                                hintStyle:
                                    const TextStyle(color: Colors.black87),
                                showClearIcon: false,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: ColorResource.colorC4CACD),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: ColorResource.colorC4CACD,
                                  ),
                                ),
                              ),
                              dropdownDecoration: const DropdownDecoration(
                                marginTop: 2,
                                maxHeight: 500,
                                header: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Select Tags List',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              dropdownItemDecoration: DropdownItemDecoration(
                                selectedIcon: const Icon(Icons.check_box,
                                    color: Colors.green),
                                disabledIcon: Icon(Icons.lock,
                                    color: Colors.grey.shade300),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select ';
                                }
                                return null;
                              },
                              onSelectionChange: (selectedItems) {
                                debugPrint(
                                    "OnSelectionChange: ${selectedItems}");
                              },
                            ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // addQty();
                          controller.locationController.selectedItems.isNotEmpty
                              ? controller.addLocations(
                                  controller
                                      .locationController.selectedItems[0].value
                                      .toString(),
                                  e == null
                                      ? controller.viewAllProductData
                                              .product![0].sku ??
                                          ''
                                      : e.varsku?.toString() ?? '')
                              : null;
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorResource.color0D5EF8,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          height: AppUtils.vs(65, context),
                          width: AppUtils.vs(150, context),
                          child: const Center(
                            child: Text(
                              "Save ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(
            thickness: 1,
          ),
          (controller.selectedWarehouseData[0].status != null &&
                  controller
                      .selectedWarehouseData[0].selectedWarehouse!.isNotEmpty)
              ? Column(
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Center(
                                  child: Text(
                                "Location",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(
                                "Incoming",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(
                                "Committed",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(
                                "Available",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(
                                "Action",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.selectedWarehouseData[0]
                                    .selectedWarehouse!.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child: Text(
                                              controller
                                                      .selectedWarehouseData[0]
                                                      .selectedWarehouse![i]
                                                      .locationTitle ??
                                                  "",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ))),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                              child: Text(controller
                                                  .selectedWarehouseData[0]
                                                  .selectedWarehouse![i]
                                                  .incomingQuantity
                                                  .toString()),
                                            )),
                                        Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Text(
                                              controller
                                                  .selectedWarehouseData[0]
                                                  .selectedWarehouse![i]
                                                  .committedQuantity
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Center(
                                                child: Text(
                                              controller
                                                  .selectedWarehouseData[0]
                                                  .selectedWarehouse![i]
                                                  .incomingQuantity
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ))),
                                        Expanded(
                                            flex: 3,
                                            child: MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    getStores(controller
                                                        .selectedWarehouseData[
                                                            0]
                                                        .selectedWarehouse![i]
                                                        .locationId
                                                        .toString());
                                                  },
                                                  child:
                                                      Icon(
                                                      Icons.remove_red_eye)),
                                            ))
                                      ],
                                    ),
                                  );
                                })),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              : SizedBox(),

          // Row(
          //   mainAxisAlignment:
          //       MainAxisAlignment.spaceEvenly,
          //   children: [
          //     const Expanded(
          //         flex: 2,
          //         child: Center(
          //             child: Text(
          //           "Total",
          //           style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         ))),
          //     Expanded(
          //         flex: 3,
          //         child: Center(
          //             child: Text(
          //           controller.getIncomingQuantity(),
          //           style: const TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         ))),
          //     Expanded(
          //         flex: 3,
          //         child: Center(
          //             child: Text(
          //           controller.getIncomingQuantity(),
          //           style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         ))),
          //     Expanded(
          //         flex: 3,
          //         child: Center(
          //             child: Text(
          //           controller.getaVabileQuantity(),
          //           style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         ))),
          //     Expanded(
          //         flex: 3,
          //         child: Center(
          //             child: Text(
          //           '',
          //           style: TextStyle(
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         ))),
          //   ],
          // ),

          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    });
  }

  Future<void> addQty(String productId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorResource.colorFFFFFF,
          title: const Text('Store Location'),
          content: GetBuilder<InventoryController>(builder: (context) {
            final locations = controller.storeLocationsData.listOfStoreLocation
                ?.map((e) => e.locationTitle!)
                .toSet()
                .toList(); // removes duplicates

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  (controller.storeLocationsData.listOfStoreLocation != null &&
                          controller.storeLocationsData.listOfStoreLocation!
                              .isNotEmpty)
                      ? Row(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 200,
                              child: CustomDropdownButton(
                                dropdownItems: locations!,
                                hint: 'Select Store Location',
                                value: locations
                                        .contains(controller.storeTitleValue)
                                    ? controller.storeTitleValue
                                    : null,
                                onChanged: (val, key) {
                                  controller.storeTitleValue = val;
                                  controller.change(val);
                                  print(val);
                                },
                              ),
                            ),

                            // child: CustomTextField(
                            //   isReadOnly: true,
                            //   controller.storeLocationsData
                            //       .listOfStoreLocation![0].locationTitle
                            //       .toString(),
                            //   controller.storeTitleController,
                            // )),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 45,
                              width: 100,
                              child: CustomTextField(
                                "10",
                                controller.quantityController1,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          child: Text("No Store Location"),
                        ),
                ],
              ),
            );
          }),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      height: 40,
                      width: AppUtils.vs(150, context),
                      child: const Center(
                        child: Text(
                          "Close",
                          style: TextStyle(
                              color: ColorResource.color0D5EF8, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      controller.addStoreLocation(productId);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorResource.color0D5EF8,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      height: 40,
                      width: AppUtils.vs(150, context),
                      child: const Center(
                        child: Text(
                          "Sumbit",
                          style: TextStyle(color: Colors.white, fontSize: 14),
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

  void getStores(String warehouseId) async {
    await controller.getStoreList(warehouseId).then((onValue) {
      if (onValue) {
        addQty(Get.arguments['productId']);
      } else {
        debugPrint('Value false');
      }
    });
  }
}
