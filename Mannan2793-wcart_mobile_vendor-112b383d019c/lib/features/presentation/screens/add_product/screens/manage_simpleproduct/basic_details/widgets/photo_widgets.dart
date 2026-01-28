import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../controller/simpleproduct_controller.dart';

Widget photoWidget(File? file, int index, SimpleProductController controller) {
  final hasImage = index < controller.networkImageList.length;
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
    height: 100,
    width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
      color: Colors.grey[100],           
    ),
    child: DottedBorder(
      radius: Radius.circular(10.0),
      borderType: BorderType.RRect,
      color: Colors.grey.shade800,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          file != null
              ? ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.file(
                    file,
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: 150,
                  ),
                )
              : controller.networkImageList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Text(
                            "Click here",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    )
                  : !hasImage
                      ? Center(
                          child: Text(
                            "Click here",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            "${controller.viewAllProductData.product!.first.imageUrl}${controller.networkImageList[index]}",
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                            errorBuilder: (context, error, stackTrace) {                              
                              return SizedBox(
                                child: Center(
                                  child: Text(
                                    "Click here",
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
          file == null
              ? SizedBox()
              : Positioned(
                  top: 0,
                  right: 0,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        controller.removeImageFromSelectedImageList(index);
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
        ),
    );
  }
