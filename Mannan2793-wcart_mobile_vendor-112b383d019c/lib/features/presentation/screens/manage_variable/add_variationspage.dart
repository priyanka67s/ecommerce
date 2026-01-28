import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wcart_vendor/features/presentation/screens/manage_variable/controller/addvariation_controller.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddVariationPage extends StatefulWidget {
  const AddVariationPage({super.key});

  @override
  State<AddVariationPage> createState() => _AddVariationPageState();
}

class _AddVariationPageState extends State<AddVariationPage> {
  AddVariationController controller = Get.put(AddVariationController());
  final TextEditingController _controller = TextEditingController();
  bool newValue = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVariationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorResource.colorF3F4F8,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CustomAppBar(
                titleText: 'Manage Products ',
                onBackButtonPressed: () {},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      topBar(context),
                      Container(
                        margin: EdgeInsets.only(top: 20.00),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Variations",
                            ),
                            ListView.builder(
                                itemCount: controller.visibleContainer.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                    
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        height: 40,
                                        width: 500,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.showContainer(index);
                                              },
                                              child: Text(
                                                "#543 : 10-20, 9:white",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      controller.visibleContainer[index]
                                          ? addVariation(context)
                                          : SizedBox()
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Container topBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Product Variations for One plus",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          controller.createVariation();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorResource.color0D5EF8,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          height: 40,
                          width: AppUtils.vs(300, context),
                          child: const Center(
                            child: Text(
                              "Create Combination",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),                          
        ],
      ),
    );
  }

  Column addVariation(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 12,
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
                CustomTextField("Price", controller.productSkuController),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sale Price ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField("SalePrice", controller.shippingCostController),
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
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quantity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField("Quantity", controller.quantityController),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "SKU",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField("SKU", controller.quantityController),
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
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Image ",
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
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        controller.addImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorResource.colorC4CACD),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: controller.imageFile != null
                              ? Image.file(controller.imageFile!)
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
                      Get.arguments['fromScreen'] == StringResources.editBrand)
                    controller.imageUrl != null
                        ? Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(top: 10),
                            child: Image.network(
                                                    controller.imageUrl!))
                        : const SizedBox(),
                ]),
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
                  "Weight(kg) ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomTextField(
                            "weight", controller.lengthController),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: CustomDropdownButton(
                            hint: '',
                            value: controller.searchFollow,
                            dropdownItems: controller.searchFollowDownList,
                            onChanged: (val, key) {
                              setState(() {
                                controller.searchFollow = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomTextField(
                            "weight", controller.heightController),
                      ),
                    ),
                  ],
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
                    Flexible(
                      child: Padding(
                          padding:
                                              const EdgeInsets.only(right: 8),
                          child: Padding(
                            padding:
                                                const EdgeInsets.all(2.0),
                            child: Center(
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                                      BorderRadius.circular(3.0),
                                  border: Border.all(
                                    color: ColorResource.colorC4CACD,
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        textAlign:
                                                            TextAlign.center,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets
                                                                  .all(1.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ),
                                        controller: _controller,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: false,
                                          signed: true,
                                        ),
                                        // inputFormatters: <TextInputFormatter>[
                                        //   WhitelistingTextInputFormatter.digitsOnly
                                        // ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            child: const Icon(
                                              Icons.arrow_drop_up,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue =
                                                  int.parse(_controller.text);
                                              setState(() {
                                                currentValue++;
                                                _controller.text = (currentValue)
                                                    .toString(); // incrementing value
                                              });
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 18.0,
                                          ),
                                          onTap: () {
                                            int currentValue =
                                                int.parse(_controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              _controller
                                                                  .text = (currentValue >
                                                          0
                                                      ? currentValue
                                                      : 0)
                                                  .toString(); // decrementing value
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                          //  CustomTextField(
                          //     "Length",
                          //     controller
                          //         .lengthController),
                          ),
                    ),
                    Flexible(
                      child: Padding(
                          padding:
                                              const EdgeInsets.only(right: 8),
                          child: Padding(
                            padding:
                                                const EdgeInsets.all(2.0),
                            child: Center(
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                                      BorderRadius.circular(3.0),
                                  border: Border.all(
                                    color: ColorResource.colorC4CACD,
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        textAlign:
                                                            TextAlign.center,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets
                                                                  .all(1.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ),
                                        controller: _controller,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: false,
                                          signed: true,
                                        ),
                                        // inputFormatters: <TextInputFormatter>[
                                        //   WhitelistingTextInputFormatter.digitsOnly
                                        // ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            child: const Icon(
                                              Icons.arrow_drop_up,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue =
                                                  int.parse(_controller.text);
                                              setState(() {
                                                currentValue++;
                                                _controller.text = (currentValue)
                                                    .toString(); // incrementing value
                                              });
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 18.0,
                                          ),
                                          onTap: () {
                                            int currentValue =
                                                int.parse(_controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              _controller
                                                                  .text = (currentValue >
                                                          0
                                                      ? currentValue
                                                      : 0)
                                                  .toString(); // decrementing value
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                          //  CustomTextField(
                          //     "Length",
                          //     controller
                          //         .lengthController),
                          ),
                    ),
                    Flexible(
                      child: Padding(
                          padding:
                                              const EdgeInsets.only(right: 8),
                          child: Padding(
                            padding:
                                                const EdgeInsets.all(2.0),
                            child: Center(
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                                      BorderRadius.circular(3.0),
                                  border: Border.all(
                                    color: ColorResource.colorC4CACD,
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: TextFormField(
                                        textAlign:
                                                            TextAlign.center,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets
                                                                  .all(1.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                          ),
                                        ),
                                        controller: _controller,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(
                                          decimal: false,
                                          signed: true,
                                        ),
                                        // inputFormatters: <TextInputFormatter>[
                                        //   WhitelistingTextInputFormatter.digitsOnly
                                        // ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            child: const Icon(
                                              Icons.arrow_drop_up,
                                              size: 18.0,
                                            ),
                                            onTap: () {
                                              int currentValue =
                                                  int.parse(_controller.text);
                                              setState(() {
                                                currentValue++;
                                                _controller.text = (currentValue)
                                                    .toString(); // incrementing value
                                              });
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 18.0,
                                          ),
                                          onTap: () {
                                            int currentValue =
                                                int.parse(_controller.text);
                                            setState(() {
                                              print("Setting state");
                                              currentValue--;
                                              _controller
                                                                  .text = (currentValue >
                                                          0
                                                      ? currentValue
                                                      : 0)
                                                  .toString(); // decrementing value
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                          //  CustomTextField(
                          //     "Length",
                          //     controller
                          //         .lengthController),
                          ),
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
                  "Shipping Cost  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField("", controller.quantityController),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                          padding:
                                const EdgeInsets.only(right: 8),
                          child: Padding(
                            padding:
                                  const EdgeInsets.all(2.0),
                            child: Center(
                              child: Container(
                                foregroundDecoration: BoxDecoration(
                                  borderRadius:
                                              BorderRadius.circular(3.0),
                                  border: Border.all(
                                    color: ColorResource.colorC4CACD,
                                  ),
                                ),
                                child: const Row(
                                  children: <Widget>[],
                                ),
                              ),
                            ),
                          )),
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
                  "Include Pincodes",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    "Include Pincodes", controller.productSkuController),
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
                    "ExcludePincodes", controller.shippingCostController),
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
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorResource.color0D5EF8,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                height: AppUtils.vs(65, context),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Save Change",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorResource.color0D5EF8,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                height: AppUtils.vs(65, context),
                // width: AppUtils.vs(200, context),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add inventory Informations#492 ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        thickness: .5,
        color: ColorResource.colorDDDDDD,
      ),
      const SizedBox(
        height: 30,
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // Get.toNamed(Routes);
          },
          child: Container(
            decoration: const BoxDecoration(
                color: ColorResource.color0D5EF8,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            height: AppUtils.vs(65, context),
            width: AppUtils.vs(200, context),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ]);
  }
}
