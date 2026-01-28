import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/http/getx_repository.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activestorelocation_model.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/model/warehousereport_model.dart';
import 'package:wcart_vendor/singleton.dart';

class ViewOrderController extends GetxController with StateMixin {
  ApiClient apiClient = ApiClient();
  // Here we instance the Verify signup model
  // ViewOrderModel viewOrderData = ViewOrderModel();
  // WarehouseReportModel warehouseReportData = WarehouseReportModel();
  // ActiveWareHouseModel activeWareHouseData = ActiveWareHouseModel();
  ViewOrderModel viewOrderData = ViewOrderModel();
  ActiveStoreLocationModel activeStoreData = ActiveStoreLocationModel();
  var warehouseDropDownValue = ''.obs;
  var storeDropDownValue = ''.obs;
  var warehouseReportData =
      WarehouseReportModel().obs; // Reactive variable for report data
  var activeWareHouseData = ActiveWareHouseModel();
  var storeReportData = WarehouseReportModel().obs;
  // var warehouseDropDownValue;
  @override
  void onInit() {    
    super.onInit();
    
    viewWarehouseReport();
    activeWarehouse();
    activeStoreLocation();
    //!for Store settings
    storeLocationReport();
  }

  Future<void> activeWarehouse() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeWarehouse, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
    }).then((value) {
      if (value['status']) {
        activeWareHouseData = ActiveWareHouseModel.fromJson(value['data']);
      } else {
        print('error');
      }
      change(activeWareHouseData, status: RxStatus.success());
    });
  }

  Future<void> viewWarehouseReport() async {
    try {
      print(warehouseDropDownValue.value);
    change(null, status: RxStatus.loading());
    
    await HttpClint.urlEncoded(HttpUrl.manageOrder, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      "warehouse_id": warehouseDropDownValue.value,
      "cart_from": "3",
    }).then((value) {
      print(value);
      if (value['status']) {
        warehouseReportData.value =
            WarehouseReportModel.fromJson(value['data']);
      } else {
        print('error');
      }
      change(warehouseReportData.value, status: RxStatus.success());
      }); 
    } catch (e) {
      debugPrint("error$e");
      change(null, status: RxStatus.error(e.toString()));
    }    
  }

  void updateWarehouseDropDownValue(String newValue) {
    warehouseDropDownValue.value = newValue;
    viewWarehouseReport(); // Trigger report update when dropdown value changes
  }

//  --------------------    store      --------------------    \\
  Future<void> storeLocationReport() async {
    print(storeDropDownValue.value);
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.manageOrder, body: {
      'vendorid': Singleton.instance.vendorId ?? "",
      'servicekey': Singleton.instance.serviceKey,
      'store_location_id': storeDropDownValue.value,
      "warehouse_id": "",
      'cart_from': '',
      'store_staff_id': ''
    }).then((value) {
      print(value);
      if (value['status']) {
        storeReportData.value = WarehouseReportModel.fromJson(value['data']);
      } else {
        print('error');
      }
      change(storeReportData.value, status: RxStatus.success());
    });
  }

  void updateStoreDropDownValue(String newValue) {
    storeDropDownValue.value = newValue;
    storeLocationReport(); // Trigger report update when dropdown value changes
  }

  activeStoreLocation() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.activeStore, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
    }).then((value) {
      print(value);
      if (value['status']) {
        activeStoreData = ActiveStoreLocationModel.fromJson(value['data']);
      } else {
        print('error');
      }
    });
    change(activeStoreData, status: RxStatus.success());
  }
}
