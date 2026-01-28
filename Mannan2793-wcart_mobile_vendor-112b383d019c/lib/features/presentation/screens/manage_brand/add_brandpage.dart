import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/controller/brand_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';
import 'package:wcart_vendor/features/presentation/widgets/custom_dropdown/custom_dropdown_button.dart';
import 'package:wcart_vendor/features/presentation/widgets/textformfield.dart';

class AddBrandPage extends StatefulWidget {
  const AddBrandPage({super.key});
  // static const String routeName = '/Edit Brand';
  @override
  State<AddBrandPage> createState() => _AddBrandPageState();
}

class _AddBrandPageState extends State<AddBrandPage> {
  final formKey = GlobalKey<FormState>();
  EditBrandController controller = Get.put(EditBrandController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditBrandController>(builder: (controller) {      
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
                      titleText: Get.arguments != null
                          ? (Get.arguments['fromScreen'] ==
                                  StringResources.editBrand)
                              ? 'Update Brand'
                              : 'Add Brand'
                          : "Add Brand",
                      onBackButtonPressed: () {},
                      isLoading: controller.status.isLoading,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  ColorResource.color0D5EF8.withOpacity(0.07),
                              spreadRadius: 0.0,
                              blurRadius: 25.0,
                              offset: const Offset(0.0, 8.0)),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    titleWidget(controller),
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
                                              fontSize: 16,
                                              color: ColorResource.color252525,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomDropdownButton(
                                            hint: '',
                                            value: controller.statusValue,
                                            dropdownItems:
                                                controller.statusDropdownList,
                                            onChanged: (val, key) {
                                              setState(() {
                                                controller.statusValue = val;
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
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomDropdownButton(
                                            hint: '',
                                            value: controller.brandValue,
                                            dropdownItems: controller
                                                .brandFeaturedDownList,
                                            onChanged: (val, key) {
                                              setState(() {
                                                controller.brandValue = val;
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
                                const Row(
                                  children: [
                                    Text(
                                      "Image",
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
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () async {
                                            controller.addImage();
                                          },
                                          child: DottedBorder(
                                            borderType: BorderType.RRect,
                                            color: ColorResource.colorC4CACD,
                                            radius: const Radius.circular(15),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: controller.imageFile !=
                                                      null
                                                  ? Image.file(
                                                      controller.imageFile!)
                                                  : Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                            size: 30,
                                                            color: Colors.grey,
                                                          ),
                                                          Text(
                                                            "Click here",
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade800,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (Get.arguments != null &&
                                          Get.arguments['fromScreen'] ==
                                              StringResources.editBrand)
                                        controller.imageUrl != null
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: DottedBorder(
                                                  borderType: BorderType.RRect,
                                                  color:
                                                      ColorResource.colorC4CACD,
                                                  radius:
                                                      const Radius.circular(15),
                                                  child: Container(
                                                    
                                                    decoration: BoxDecoration(                                                    
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    height: 100,
                                                    width: 100,
                                                    margin:
                                                        EdgeInsets.only(top: 0),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          controller.imageUrl!,
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.network(
                                                        'https://wcartnode.webnexs.org/products/default.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: AppUtils.vs(200, context),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    ColorResource.color0D5EF8),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3.0))),
                                        child: const Center(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                fontSize: 14),
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
                                            print('muthuvel');
                                            // if (formKey.currentState
                                            //         ?.validate() ??
                                            //     false) {
                                            //   formKey.currentState?.save();
                                            controller.addBrand(context);
                                            // }
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3.0))),
                                            height: 40,
                                            width: AppUtils.vs(200, context),
                                            child: Center(
                                              child: Text(
                                                (Get.arguments != null &&
                                                        Get.arguments[
                                                                'fromScreen'] ==
                                                        StringResources
                                                            .editBrand)
                                                    ? 'Update Brand'
                                                    : 'Add Brand',
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

  Expanded titleWidget(EditBrandController controller) {
    return Expanded(
      flex: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Name",
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
            "",
            controller.brandNameController,
            validationRules: const ['required'],
            validatorCallBack: (val) {
              print(val);
            },
          ),
        ],
      ),
    );
  }
}
