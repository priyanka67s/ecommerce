import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:wcart_vendor/features/presentation/widgets/toast/app_toast.dart';
import 'package:wcart_vendor/http/http_repository.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/addinventory_model.dart';
import 'package:wcart_vendor/model/selected_store_locations.dart';
import 'package:wcart_vendor/model/selectedwarehuse_model.dart';
import 'package:wcart_vendor/model/viewproduct_model.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/singleton.dart';
import 'package:wcart_vendor/util/string_resources.dart';

class InventoryController extends GetxController with StateMixin {
  AddInventoryModel addInventoryData = AddInventoryModel();
  ActiveWareHouseModel activeWarehouseData = ActiveWareHouseModel();
  List<SelectedWarehouseModel> selectedWarehouseData = [];
  ViewProductModel viewAllProductData = ViewProductModel();
  List<Map<String, dynamic>> variationInventoryList = [];
  TextEditingController productSkuController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController includePinCodeController = TextEditingController();
  TextEditingController excludePinCodeController = TextEditingController();
  TextEditingController shippingCostController = TextEditingController();
  TextEditingController weightUnitController = TextEditingController();
  TextEditingController unitTypeController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  //!varitation controller
  List<VariationControllerSet> variationControllers = [];
  //!removeable controller
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController quantityController1 = TextEditingController();
  TextEditingController storeTitleController = TextEditingController();

  //!dropdown controller
  MultiSelectController<String> locationController =
      MultiSelectController<String>();

  TextEditingController shippingStatusController = TextEditingController();
  TextEditingController inventorySkuCodeController = TextEditingController();

  final TextEditingController controllerWidth = TextEditingController();
  final TextEditingController controllerHeight = TextEditingController();
  final TextEditingController controllerLength = TextEditingController();
  StoreLocationResponse storeLocationsData = StoreLocationResponse();
  String? storeTitleValue;

  final TextEditingController controllerWeight1 = TextEditingController();

  List<String> weightDropDownList = ["KG", 'GMS', "LBS"];
  String weightValue = 'KG';
  // TextEditingController skuCode = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    debugPrint(Get.arguments.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.arguments['fromScreen'] == StringResources.addInventory) {
        getSimpleProduct2Data(Get.arguments['productId']);
      }
    });
  }

  List selectedActiveWarehouse = [];

  addInventory(
      int? vID,
      String? vSkuCode,
      String? shippingCost,
      String? length,
      String? width,
      String? height,
      String? price,
      String? saleprice,
      String? weight) async {
    change(null, status: RxStatus.loading());
    final requestBody = vID != null
        ? {
            'productid': viewAllProductData.product?[0].productid.toString(),
            "vendorid": Singleton.instance.vendorId,
            "servicekey": Singleton.instance.serviceKey,
            'vid': vID.toString(),
            'price': price,
            'saleprice': saleprice,
            'varsku': vSkuCode.toString(),
            'sku': viewAllProductData.product![0].sku ?? "",
            'shippingcost': shippingCost ?? shippingCostController.text,
            "include_pincodes": "",
            "exclude_pincodes": "",
            'weight_unit': "1",
            'unit_type': unitTypeController.text,
            'weight': weight ?? weightController.text,
            'length': length ?? controllerLength.text,
            'width': width ?? controllerWidth.text,
            'height': height ?? controllerHeight.text,

            'quantity':
                quantityController.text.isEmpty ? "1" : quantityController.text,
            'low_stock_limit':
                quantityController.text.isEmpty ? "1" : quantityController.text,
          }
        : {
            "vendorid": Singleton.instance.vendorId,
            "servicekey": Singleton.instance.serviceKey,
            'productid': viewAllProductData.product?[0].productid.toString(),
            'sku': productSkuController.text,
            'quantity':
                quantityController.text.isEmpty ? "1" : quantityController.text,
            'shippingcost': shippingCostController.text,
            'weight_unit': "1",
            'unit_type': unitTypeController.text,
            'weight': controllerWeight1.text,
            'length': controllerLength.text,
            'width': controllerWidth.text,
            'height': controllerHeight.text,
            'low_stock_limit':
                quantityController1.text.isEmpty
                ? "1"
                : quantityController1.text,
            'shipping_status': "1",        
               
          };
    await HttpClint.urlEncoded(
            vID == null ? HttpUrl.addInventory : HttpUrl.updateProducts,
            body: requestBody)
        .then((value) {

      if (value['status']) {
        if (vID == null) {
          clearCache();
          Get.toNamed(Routes.metaDetailsStep3, arguments: {
            'fromScreen': StringResources.addMetaDetails,
            'productID': "${viewAllProductData.product?[0].productid}",
          })!
              .then((value) {
            if (value ?? false) {
              getSimpleProduct2Data(Get.arguments['productId']);
            }
          });
        }
        // Get.toNamed(MobileAddMetaProduct.routeName);
        debugPrint(value['data'].toString());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

  //! create combination api call
  createCombination() async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.createCombination, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
      "pid": Get.arguments['productId'],
      "store_staff_id": "0",
    }).then((value) {
      debugPrint(value.toString());
      if (value['status']) {
        showSuccessSnackBar(
          
          "Updated successfully",
        );
        getSimpleProduct2Data(Get.arguments['productId']);
        change(selectedWarehouseData, status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

  getSimpleProduct2Data(String argument) async {
    change(null, status: RxStatus.loading());
    // try {
    await HttpClint.urlEncoded(HttpUrl.viewAllProduct, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "productid": argument,
    }).then((value) {
      debugPrint(value.toString());
      print("--Muthuvel------");
      print(value);
      if (value['status']) {
        viewAllProductData = ViewProductModel.fromJson(value['data']);

        if (viewAllProductData.product![0].producttype == 1) {
          // Simple product — only one inventory
          productSkuController.text = viewAllProductData.product![0].sku ?? "";
          quantityController.text =
              viewAllProductData.shipping?.first.quantity?.toString() ?? '0';
          shippingCostController.text =
              viewAllProductData.shipping?.first.shippingcost?.toString() ??
                  '0';
          controllerWeight1.text =
              viewAllProductData.shipping?.first.weight?.toString() ?? '0';
          weightController.text =
              viewAllProductData.shipping?.first.weight?.toString() ?? '0';
          controllerLength.text =
              viewAllProductData.shipping?.first.length?.toString() ?? '0';
          controllerWidth.text =
              viewAllProductData.shipping?.first.width?.toString() ?? '0';
          controllerHeight.text =
              viewAllProductData.shipping?.first.height?.toString() ?? '0';
        } else {
          // Variable product
          variationControllers.clear();
          viewAllProductData.wcvariations?.forEach((variation) {
            VariationControllerSet variationSet = VariationControllerSet();
            variationSet.skuController.text = variation.varsku ?? '';
            variationSet.quantityController.text =
                variation.quantity?.toString() ?? '0';
            variationSet.shippingCostController.text =
                variation.shippingcost?.toString() ?? '0';
            variationSet.weightController.text =
                variation.weight?.toString() ?? '0';
            variationSet.lengthController.text =
                variation.length?.toString() ?? '0';
            variationSet.widthController.text =
                variation.width?.toString() ?? '0';
            variationSet.heightController.text =
                variation.height?.toString() ?? '0';
            variationSet.priceController.text =
                variation.price?.toString() ?? '0';
            variationSet.salePriceController.text =
                variation.saleprice?.toString() ?? '0';
            variationControllers.add(variationSet);
          });
        }

        debugPrint('sku ${viewAllProductData.product?[0].sku}');
        if (viewAllProductData.product?[0].producttype == 1) {
          multiSelectedWarehouse(viewAllProductData.product?[0].sku ?? "");
        } else {
          viewAllProductData.wcvariations!.forEach((action) {
            multiSelectedWarehouse(action.sku ?? "");
          });
        }
      } else {
        showInfoSnackBar(viewAllProductData.message!);
      }
    });
    // } catch (e) {}
    change(null, status: RxStatus.success());
  }

  multiSelectedWarehouse(String skuCode) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.selectedWarehouse, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      "productid": Get.arguments['productId'],
      "sku_code": skuCode,
    }).then((value) {
      print("muthu---------");
      if (value['status']) {
        if (viewAllProductData.product![0].producttype == 1) {
          if (selectedWarehouseData.isEmpty) {
            selectedWarehouseData
                .add(SelectedWarehouseModel.fromJson(value['data']));
          } else {
            selectedWarehouseData[0] =
                SelectedWarehouseModel.fromJson(value['data']);
          }
        } else {
          selectedWarehouseData
              .add(SelectedWarehouseModel.fromJson(value['data']));
        }
        for (var element in selectedWarehouseData[0].selectedWarehouse!) {
          debugPrint("term Id ${element.warehouseId}");
        }
        change(selectedWarehouseData, status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

  //! inventory Location update
  inventoryLocationUpdate(bool isTrack, bool isSell) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.inventoryLocationUpdate, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
      "store_staff_id": "0",
      "productid": Get.arguments['productId'],
      "track_quantity": isTrack ? "1" : "0",
      "sell_out_of_stock": isSell ? "1" : "0",
    }).then((value) {
      debugPrint(value.toString());
      if (value['status']) {
        showSuccessSnackBar(
          
          "Updated successfully",
        );
        change(selectedWarehouseData, status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

//! add Locations
  addLocations(String locationId, String skuCode) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.inventoryLocationAdd, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
      "productid": Get.arguments['productId'],
      "sku_code": productSkuController.text.isEmpty
          ? skuCode
          : productSkuController.text,
      "inventory_location": locationId,
    }).then((value) {
      debugPrint(value.toString());
      if (value['status']) {
        multiSelectedWarehouse(productSkuController.text.isEmpty
            ? skuCode
            : productSkuController.text);
        showSuccessSnackBar(
          
          "Updated successfully",
        );
        change(selectedWarehouseData, status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

  //! remove Locations
  removeLocations(
      String locationId, String locationName, String skuCode) async {
    change(null, status: RxStatus.loading());
    await HttpClint.urlEncoded(HttpUrl.inventoryLocationRemove, body: {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey ?? "",
      "productid": Get.arguments['productId'],
      "sku_code": productSkuController.text,
      "inventory_location": locationName,
      "warehouse_id": locationId
    }).then((value) {
      debugPrint(value.toString());
      if (value['status']) {
        multiSelectedWarehouse(skuCode);
        showSuccessSnackBar(          
          "Updated successfully",
        );
        change(selectedWarehouseData, status: RxStatus.success());
      } else {
        print('error');
      }
    });
    change(selectedWarehouseData, status: RxStatus.success());
  }

  void clearCache() {
    // Clear text fields
    productSkuController.clear();
    quantityController.clear();
    includePinCodeController.clear();
    excludePinCodeController.clear();
    shippingCostController.clear();
    weightUnitController.clear();
    unitTypeController.clear();
    weightController.clear();
    lengthController.clear();
    widthController.clear();
    heightController.clear();
    shippingStatusController.clear();
    inventorySkuCodeController.clear();
    controllerWidth.clear();
    controllerHeight.clear();
    controllerLength.clear();
    controllerWeight1.clear();
  }

  Future<bool> getStoreList(final String warehouseId) async {
    change(null, status: RxStatus.loading());

    try {
      final value =
          await HttpClint.urlEncoded(HttpUrl.selectedStoreLocation, body: {
        "vendorid": Singleton.instance.vendorId ?? "",
        "servicekey": Singleton.instance.serviceKey ?? "",
        "productid": Get.arguments['productId'],
        "sku_code": productSkuController.text,
        "warehouse_id": warehouseId
      });

      if (value['status']) {
        debugPrint(value.toString());
        storeLocationsData = StoreLocationResponse.fromJson(value['data']);
        change(storeLocationsData, status: RxStatus.success());
        return true;
      } else {
        print('error');
        change(storeLocationsData, status: RxStatus.success());
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      change(storeLocationsData, status: RxStatus.success());
      return false;
    }
    
  }

  void addStoreLocation(String productId) async {
    change(null, status: RxStatus.loading());

    try {
      final storeName = storeTitleValue.toString();
      final warehouseId = storeLocationsData.listOfStoreLocation!
          .firstWhere((e) => e.locationTitle == storeName)
          .warehouseId;
      final storeLocationId = storeLocationsData.listOfStoreLocation!
          .firstWhere((e) => e.locationTitle == storeName)
          .storeLocationId;
      final value = await HttpClint.urlEncoded(HttpUrl.storeLocationAdd, body: {
        "vendorid": Singleton.instance.vendorId ?? "",
        "servicekey": Singleton.instance.serviceKey ?? "",
        "store_staff_id": "0",
        "productid": productId,
        "sku_code": productSkuController.text,
        "warehouse_id": warehouseId.toString(),
        "store_location_id": storeLocationId.toString(),
        "available_quantity": quantityController1.text
      });
      debugPrint(value.toString());
      if (value['status']) {
        debugPrint(value.toString());
        Get.back();
        change(storeLocationsData, status: RxStatus.success());
      } else {
        print('error');
        change(storeLocationsData, status: RxStatus.success());
      }
    } catch (e) {
      print('Exception: $e');
      change(storeLocationsData, status: RxStatus.success());
    }
  }

  int expandedVariationId = -1; // -1 means none expanded
  int expandedSubVariationId = -1;

  void toggleVariation(int vid) {
    if (expandedVariationId == vid) {
      expandedVariationId = -1; // collapse if already open
    } else {
      expandedVariationId = vid; // expand this one
    }
    update(); // triggers GetBuilder to rebuild
  }

  void toggleSubVariation(int vid) {
    if (expandedSubVariationId == vid) {
      expandedSubVariationId = -1; // collapse if already open
    } else {
      expandedSubVariationId = vid; // expand this one
    }
    update(); // triggers GetBuilder to rebuild
  }
}

//controller class
class VariationControllerSet {
  TextEditingController skuController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController shippingCostController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
}
