import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
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
                    titleText: "Manage Products",
                    onBackButtonPressed: () {},
                  ),            
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResource.colorFFFFFF,
                        // border: Border.all(
                        //   color: Color(0xffe3e3e5),
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add New Product",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 0.5,
                              color: ColorResource.colorDDDDDD,
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  child: Text(
                                    "Select Product Type",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: ColorResource.color000000,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              child: Row(
                                children: [
                                  PopupMenuButton(  
                                    clipBehavior: Clip.antiAlias,
                                    itemBuilder: (BuildContext context) {
                                      return <PopupMenuEntry<String>>[
                                        PopupMenuItem<String>(
                                          value: 'option1',
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                  Routes.simpleProductStep1,
                                                  arguments: {
                                                    'fromScreen':
                                                        StringResources
                                                            .addProduct,
                                                    'toScreen': StringResources
                                                        .simpleProduct,
                                                    'productType': true
                                                  },
                                                );
                                              },
                                              child: ListTile(
                                                title: SizedBox(
                                                  width: 400,
                                                  child: const Text(
                                                    'Simple',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const PopupMenuDivider(),
                                        PopupMenuItem<String>(
                                          value: 'option2',
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.simpleProductStep1,
                                                    arguments: {
                                                      'fromScreen':
                                                          StringResources
                                                              .addProduct,
                                                      'toScreen': StringResources
                                                          .variableProductStep,
                                                      'productType': false
                                                    });
                                              },
                                              child: ListTile(
                                                title: const Text('Variable'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const PopupMenuItem<String>(
                                        //   value: 'option3',
                                        //   child: ListTile(
                                        //     title: Text('Share'),
                                        //   ),
                                        // ),
                                      ];
                                    },
                                    color: Colors.white,                                    
                                    onSelected: (String value) {
                                      // Handle the selected option
                                      switch (value) {
                                        case 'option1':
                                          // Perform delete operation
                                          break;
                                        case 'option2':
                                          // Perform edit operation
                                          break;
                                        case 'option3':
                                          // Perform share operation
                                          break;
                                      }
                                    },
                                    position: PopupMenuPosition.under,
                                    shadowColor: Colors.grey.shade100,
                                    offset: const Offset(0.0, 5.0),
                                    elevation: 8.0,
                                    child: Container(
                                      height: 55,
                                      width: 300,
                                      margin: const EdgeInsets.all(1.0),
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorResource.colorC4CACD,
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Choose",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                                                   
                                  ),
                                ],
                              ),
                            )
                          ],
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
  }
}
