import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/storeinventorydetails_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewStoreProductListController extends GetxController with StateMixin {
  StoreInventoryDetailsModel viewStoreInventoryData =
      StoreInventoryDetailsModel();

  TextEditingController increaseQtyController = TextEditingController();
  TextEditingController increaseDescriptionController = TextEditingController();
  TextEditingController decreaseQtyController = TextEditingController();
  TextEditingController decreaseDescriptionController = TextEditingController();

  @override
  void onInit() {
    print('-------Muthu-----');

    super.onInit();
    debugPrint('store_id ${Get.arguments!['store_id']}');
    debugPrint('skuCode ${Get.arguments!['skuCode']}');
    viewStoreProductInventory(
      Get.arguments['store_id'].toString(),
      Get.arguments['skuCode'].toString(),
    );
  }

  viewStoreProductInventory(String storeId, String skuCode) async {
    
    change(null, status: RxStatus.loading());
    print('screen status ---> ${status.isLoading}');
    
    HttpClint.urlEncoded(HttpUrl.viewStoreInventoryDetails, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "store_staff_id": '',
      "sku_code": skuCode,
      "store_inventory_id": storeId,
    }).then((value) {
      print("--------------storeinventorydata");
      if (value['status']) {
        viewStoreInventoryData =
            StoreInventoryDetailsModel.fromJson(value['data']);
        print(viewStoreInventoryData);
        change(viewStoreInventoryData);
      } else {
        print('error');
      }
    });
    change(viewStoreInventoryData, status: RxStatus.success());
  }

  Future<bool> increaseStoreInventory(String sku, String productid) async {
    bool isIncreased = false;
    print('muthuvel');
    change(null, status: RxStatus.loading());
    print(
      increaseQtyController.text,
    );
    print(
      increaseDescriptionController.text,
    );
    await HttpClint.urlEncoded(HttpUrl.increaseStoreBaseInventory, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': '',
      "sku_code": sku,
      "store_inventory_id": productid,
      "activity_quantity": increaseQtyController.text,
      "activity_description": increaseDescriptionController.text,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewStoreProductInventory(
          viewStoreInventoryData.viewInventory!.storeInventoryId.toString(),
          viewStoreInventoryData.viewInventory!.sku.toString(),
        );
        isIncreased = true;        
      } else {
        print('error');
      }
    });
    change(null, status: RxStatus.success());
    return isIncreased;
    
  }

  Future<bool> decreaseStoreInventory(String sku, String productid) async {
    bool isDecreased = false;
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.decreaseStoreBaseInventory, body: {
      "vendorid": Singleton.instance.vendorId,
      "servicekey": Singleton.instance.serviceKey,
      'store_staff_id': '',
      "sku_code": sku,
      "store_inventory_id": productid,
      "activity_quantity": decreaseQtyController.text,
      "activity_description": decreaseDescriptionController.text,
    }).then((value) {
      print(value);
      if (value['status']) {
        viewStoreProductInventory(
          viewStoreInventoryData.viewInventory!.storeInventoryId.toString(),
          viewStoreInventoryData.viewInventory!.sku.toString(),
        );
        isDecreased = true;
      } else {
        print('error');
      }
    });
    change(null, status: RxStatus.success());
    return isDecreased;
  }
}
