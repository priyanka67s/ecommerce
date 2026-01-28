import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/getproductattribute_model.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/singleton.dart';

class AddAttributeController extends GetxController with StateMixin {
  var attributeDropDownValue;
  var attributeDropDownList;
  ViewAttributesModel viewAttributeData = ViewAttributesModel();
  ViewProductModel viewProductData = ViewProductModel();
  GetProductAttributeModel getProductAttributeData = GetProductAttributeModel();
  TextEditingController productNameController = TextEditingController();
  List<ProductAttribute> productAttribute = [];
  MultiSelectController<String> primaryAttributeController =
      MultiSelectController<String>();

  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    viewAttribute();
    viewAllProduct();    
  }

  viewAttribute() async {
    change(null, status: RxStatus.loading());
    try {
      await HttpClint.urlEncoded(HttpUrl.viewAttribute, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewAttributeData = ViewAttributesModel.fromJson(value['data']);
      } else {
        print('error');
      }
      });
    } catch (e) {
      print(e);
    }
    change(viewAttributeData, status: RxStatus.success());
  }

  viewAllProduct() async {
    debugPrint(Get.arguments['productId']);
    change(null, status: RxStatus.loading());
    try {
      await HttpClint.urlEncoded(HttpUrl.viewAllProduct, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
        'productid': Get.arguments['productId'],
    }).then((value) {
      print(value);
      if (value['status']) {
        viewProductData = ViewProductModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    } catch (e) {
      print(e);
    }
    ;
    change(viewProductData, status: RxStatus.success());
  }

  getAttribute(String attributeSlug) async {
    change(null, status: RxStatus.loading());
    try {
      await HttpClint.urlEncoded(HttpUrl.getAttributeItems, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
        "productid": Get.arguments['productId'],
        "attr_slug": "${attributeSlug}",
    }).then((value) {
      print(value);
      if (value['status']) {
        getProductAttributeData =
            GetProductAttributeModel.fromJson(value['data']);
      } else {
        print('error');
      }
      });
    } catch (e) {
      print(e);
    }
    change(getProductAttributeData, status: RxStatus.success());
  }

  void saveAttribute() {
    
    saveProductAttribute(
        attributeDropDownValue ?? '', productNameController.text);
  }

  void deleteAttribute(int i) {
    productAttribute.removeAt(i);
    change(productAttribute, status: RxStatus.success());
  }

  void editAttribute(int i) {
    productAttribute[i].isEdit =
        productAttribute[i].isEdit == true ? false : true;
    change(productAttribute, status: RxStatus.success());
  }

  void updateAttribute(String text, int i) {
    productAttribute[i].attributeValue = text;
    change(productAttribute, status: RxStatus.success());
  }

  //! save product attribute
  void saveProductAttribute(String attributeName, String attributeValue) async {
    change(null, status: RxStatus.loading());
    try {
      await HttpClint.urlEncoded(HttpUrl.addAttribute2, body: {
        "vendorid": Singleton.instance.vendorId,
        "servicekey": Singleton.instance.serviceKey,
        "pid": Get.arguments['productId'],
        "selectattribute": attributeName,
        "itemss": attributeValue,
        "store_staff_id": "0",
      }).then((value) {
        print(value);
        if (value['status']) {
          productAttribute.add(
            ProductAttribute(
              attributeName: attributeName,
              attributeValue: attributeValue,
              isEdit: false,
            ),
          );
          // getProductAttributeData =
          //     GetProductAttributeModel.fromJson(value['data']);
        } else {
          print('error');
        }
      });
    } catch (e) {
      print(e);
    }
    change(getProductAttributeData, status: RxStatus.success());
  }
}

class ProductAttribute {
  final String attributeName;
  String attributeValue;
  bool? isEdit = false;
  ProductAttribute({
    required this.attributeName,
    required this.attributeValue,
    required this.isEdit,
  });
}
