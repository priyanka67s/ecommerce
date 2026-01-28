import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/addinventory_model.dart';
import 'package:wcart_vendor/model/selectedwarehuse_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';

class AddVariationController extends GetxController with StateMixin {
  AddInventoryModel addInventoryData = AddInventoryModel();
  ActiveWareHouseModel activeWarehouseData = ActiveWareHouseModel();
  SelectedWarehouseModel selectedWarehouseData = SelectedWarehouseModel();
  ViewProductModel viewAllProductData = ViewProductModel();

  TextEditingController productSkuController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController includePinCodeController = TextEditingController();
  TextEditingController excludePinCodeController = TextEditingController();
  TextEditingController shippingCostController = TextEditingController();
  TextEditingController weightUnitController = TextEditingController();
  TextEditingController unitTypeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController shippingStatusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<bool> visibleContainer = [];

  FilePickerResult? result;
  File? imageFile;
  String? imageUrl;
  // TextEditingController skuCode = TextEditingController();

  List<String> searchFollowDownList = ['KG', "GMS", 'LBS'];
  String searchFollow = 'KG';
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    final visibleList = [true, false, false, true];
    visibleContainer.addAll(visibleList);
    change(visibleList, status: RxStatus.success());
  }

  List selectedActiveWarehouse = [];

  addVariations() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.updateProducts, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      'productid': Get.arguments['productId'],
      'vid': '',
      'price': priceController.text,
      'saleprice': '',
      'sku': productSkuController.text,
      'quantity': quantityController.text,
      'shippingcost': shippingCostController.text,
      'weight_unit': weightUnitController.text,
      'unit_type': unitTypeController.text,
      'weight': weightController.text,
      'length': lengthController.text,
      'width': widthController.text,
      'height': heightController.text,
      "include_pincodes": '',
      "exclude_pincodes": '',
    }).then((value) {
      // print(value);
      if (value['status']) {
        Get.toNamed(Routes.metaDetailsStep3);
      } else {
        print('error');
      }
    });
    // change(AddInventoryData, status: RxStatus.success());
  }

  getSimpleProduct2Data() async {
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewAllProduct, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "productid": '402',
    }).then((value) {
      print("--Muthuvel------");
      print(value);
      if (value['status']) {
        viewAllProductData = ViewProductModel.fromJson(value['data']);
        productSkuController.text =
            viewAllProductData.shipping?.first.sku ?? "";
        // quantityController.text =
        //     viewAllProductData.shipping!.first.quantity.toString();
        // shippingCostController.text =
        //     viewAllProductData.shipping!.first.shippingcost.toString();
        // weightUnitController.text =
        //     viewAllProductData.shipping!.first.weightUnit ?? '';
        // unitTypeController.text =
        //     viewAllProductData.shipping!.first.unitType ?? '';
        // weightController.text = viewAllProductData.shipping!.first.weight ?? '';
        // lengthController.text = viewAllProductData.shipping!.first.length ?? '';
        // widthController.text = viewAllProductData.shipping!.first.width ?? '';
        // heightController.text = viewAllProductData.shipping!.first.height ?? '';
      } else {
        showInfoSnackBar(viewAllProductData.message!);
      }
    });
    // } catch (e) {}
    update();
    change(null, status: RxStatus.success());
  }

  activeWarehouse() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeWarehouse, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      // print(value);
      if (value['status']) {
      } else {
        print('error');
      }
    });
    // change(ActiveWarehouseData, status: RxStatus.success());
  }

  addImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      PlatformFile? file = result?.files.first;

      imageFile = File(file?.path ?? '');

      change(imageFile);
    } else {
      // User canceled the picker
      showFailureSnackBar('Image not selected');
    }
  }

  void showContainer(int index) {
    visibleContainer[index] = !visibleContainer[index];
    update();
    change(visibleContainer, status: RxStatus.success());
  }

  void createVariation() {}
}
