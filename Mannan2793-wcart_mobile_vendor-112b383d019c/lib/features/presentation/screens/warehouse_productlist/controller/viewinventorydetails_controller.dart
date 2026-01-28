import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/viewwarehouseproduct_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewInventoryDetailsController extends GetxController with StateMixin {
  ViewWarehouseInventoryModel viewStoreInventoryData =
      ViewWarehouseInventoryModel();

  TextEditingController increaseQtyController = TextEditingController();
  TextEditingController increaseDescriptionController = TextEditingController();
  TextEditingController decreaseQtyController = TextEditingController();
  TextEditingController decreaseDescriptionController = TextEditingController();

  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    viewStoreInventory();
  }

  viewStoreInventory() async {
    print(
      Get.arguments['skuCode'],
    );
    print(
      Get.arguments['store_id'].toString(),
    );

    change(null, status: RxStatus.loading());
    print('screen status ---> ${status.isLoading}');
    HttpClint.urlEncoded(HttpUrl.viewStoreInventoryDetails, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": '',
      "sku_code": Get.arguments['skuCode'],
      "product_inventory_id": Get.arguments['store_id'].toString(),
    }).then((value) {
      print("--------------storeinventorydata");
      if (value['status']) {
        viewStoreInventoryData =
            ViewWarehouseInventoryModel.fromJson(value['data']);
        print(viewStoreInventoryData);
        change(viewStoreInventoryData);
      } else {
        print('error');
      }
    });
    change(viewStoreInventoryData, status: RxStatus.success());
  }

  increaseInventory(String sku, String productid) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.increaseInventory, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': '',
      "sku_code": sku,
      "product_inventory_id": productid,
      "activity_quantity": increaseQtyController.text,
      "activity_description": increaseDescriptionController.text,
    }).then((value) {
      print(value);
      if (value['status']) {
        showSuccessSnackBar(
          value['data']['message'],
        );
        Get.back();
      } else {
        print('error');
      }
    });
    change(null, status: RxStatus.success());
  }

  decreaseInventory(String sku, String productid) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.decreaseInventory, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': '',
      "sku_code": sku,
      "product_inventory_id": productid,
      "activity_quantity": decreaseQtyController.text,
      "activity_description": decreaseDescriptionController.text,
    }).then((value) {
      print(value);
      if (value['status']) {
        Get.back();
        showSuccessSnackBar(
          value['data']['message'],
        );
      } else {
        print('error');
      }
    });
  }
}
