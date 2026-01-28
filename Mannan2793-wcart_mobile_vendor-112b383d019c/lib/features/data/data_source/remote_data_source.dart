import 'package:dio/dio.dart';
import 'package:wcart_vendor/config/api_setup/api_response_handler.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'package:wcart_vendor/features/data/model/listbrand_model.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/features/data/model/manageproduct_model.dart';
import 'package:wcart_vendor/features/data/model/settings_models.dart';
import 'package:wcart_vendor/http/http_url.dart';
import 'package:wcart_vendor/features/data/model/addattribute_model.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/data/model/viewcartpos_model.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';
import 'package:wcart_vendor/singleton.dart';

import '../../../model/vendorsales_category_model.dart';

abstract interface class RemoteDataSource {
  //!Home Page Data APi
  Future<VendorModel> getHomePageData();
  //! get settings API
  Future<AppSettings> getSettingsData();

  //! manage Products
  Future<ManageProductModel> getManageProductData();
  Future<ViewTagsModel> getTagsData();
  Future<ViewBrandModel> getBrandsData();
  Future<ListCategoryModel> getCategoryData();
  Future<ViewAttributesModel> getAttributesModel();
  //! add Attribute
  Future<AddAttributeModel> addAttributeData(String attributeName, String? id);

  //! view Orders
  Future<ViewOrderModel> viewOrdersData();

//! warehouse selection
  Future<ViewWarehouseModel> viewWarehouseModel();
  Future<Map<String, dynamic>> removeWarehouse({
    required String warehouseId,
    required int index,
  });

  Future<ViewInventoryModel> viewInventoryProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  });
  Future<ViewStoreLocationModel> viewStoreLocationData();
  Future<StoreBasedProductModel> viewStoreProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  });

  Future<OrderCountReportModel> totalOrderCount({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  });

  //! POS APi'S
  Future<SearchCustomersModel> searchCustomer({
    required final String searchQuery,
  });
  // get warehouse data
  Future<ActiveWareHouseModel> getActiveWarehouseData();
  //get active warehouse data
  Future<AllStoreProductInventoryModel> getStoreProductInventoryData({
    required String? warehouseId,
    required String? categoryId,
  });
  Future<AllCategoryListModel> getInventoryCategoryList();
  Future<Map<String, dynamic>> addToPOSCart({
    required String productId,
    required String attribute,
    required String warehouseId,
    required String skucode,
    required String storeid,
    required String userId,
  });
  Future<Map<String, dynamic>> removePosCart({
    required String cartId,
    required int index,
    required String warehouseId,
    required String userId,
  });
  Future<Map<String, dynamic>> updatePosCart({
    required String quantity,
    required String cartId,
    required String warehouseId,
    required String userId,
  });

  Future<ViewCartPosModel> viewCartData({
    required String warehouseId,
    required String userId,
  });

  //! sales by category report
  Future<VendorSalesByCategoryModel> salesByCategoryReport({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  });

  
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl(this.dio);
  @override
  Future<VendorModel> getHomePageData() {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.homePage,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
          "store_staff_id": "0",
        },
      ),
      onSuccess: (data) => VendorModel.fromJson(data),
      onError: (message) => VendorModel(status: false),
    );
  }

  @override
  Future<ManageProductModel> getManageProductData() {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.manageProduct,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) => ManageProductModel.fromJson(data),
      onError: (message) => ManageProductModel(status: "false"),
    );
  }

  @override
  Future<ViewTagsModel> getTagsData() {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.manageTag,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) => ViewTagsModel.fromJson(data),
      onError: (message) => ViewTagsModel(status: "false"),
    );
  }

  @override
  Future<ViewBrandModel> getBrandsData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.manageBrand,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) => ViewBrandModel.fromJson(data),
      onError: (message) => ViewBrandModel(status: "false"),
    );
  }

  @override
  Future<ListCategoryModel> getCategoryData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewcategory,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) {
        return ListCategoryModel.fromJson(data);
      },
      onError: (message) => ListCategoryModel(status: "false"),
    );
  }

  @override
  Future<ViewAttributesModel> getAttributesModel() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewAttribute,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) {
        return ViewAttributesModel.fromJson(data);
      },
      onError: (message) => ViewAttributesModel(status: "false"),
    );
  }

  @override
  Future<AddAttributeModel> addAttributeData(String attributeName, String? id) {
    final addAttribute = {
      "vendorid": Singleton.instance.vendorId ?? "",
      "servicekey": Singleton.instance.serviceKey,
      'attributename': attributeName,
      'store_staff_id': '0'
    };
    if (id != null) {
      addAttribute['id'] = id;
    }
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.addAttribute,
        data: addAttribute,
      ),
      onSuccess: (data) => AddAttributeModel.fromJson(data),
      onError: (message) =>
          AddAttributeModel(status: "false", message: message),
    );
  }

  @override
  Future<ViewOrderModel> viewOrdersData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.manageOrder,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
        },
      ),
      onSuccess: (data) => ViewOrderModel.fromJson(data),
      onError: (message) => ViewOrderModel(status: "false"),
    );
  }

  @override
  Future<ViewWarehouseModel> viewWarehouseModel() {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewWarehouse,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
          "store_staff_id": '',
        },
      ),
      onSuccess: (data) => ViewWarehouseModel.fromJson(data),
      onError: (message) => ViewWarehouseModel(status: "false"),
    );
  }

  @override
  Future<Map<String, dynamic>> removeWarehouse({
    required String warehouseId,
    required int index,
  }) {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.removeWareHouseData,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
          "warehouse_id": warehouseId.toString(),
        },
      ),
      onSuccess: (data) {
        if (data['status'] == "true") {
          return {"status": "true", "index": index};
        } else {
          return {"status": "false", "message": data['message']};
        }
      },
      onError: (message) {
        return {"status": "true", "message": message};
      },
    );
  }

  @override
  Future<ViewInventoryModel> viewInventoryProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewInventory,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey ?? "",
          "order": order ?? "",
          "orderby": orderby ?? "",
          "filter": filter ?? '',
          "filterby": filterBy ?? '',
          "store_location_id": (storeLocationId ?? '').toString(),
        },
      ),
      onSuccess: (data) => ViewInventoryModel.fromJson(
        data,
      ),
      onError: (message) => ViewInventoryModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<ViewStoreLocationModel> viewStoreLocationData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewStoreLocation,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey,
          "store_staff_id": '',
        },
      ),
      onSuccess: (data) => ViewStoreLocationModel.fromJson(
        data,
      ),
      onError: (message) => ViewStoreLocationModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<StoreBasedProductModel> viewStoreProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.allStoreProductList,
        data: {
          "vendorid": Singleton.instance.vendorId ?? "",
          "servicekey": Singleton.instance.serviceKey,
          'store_staff_id': '',
          "order": order ?? "",
          "orderby": orderby ?? "",
          "filter": filter ?? '',
          "filterby": filterBy ?? '',
          "store_location_id": storeLocationId ?? '',
        },
      ),
      onSuccess: (data) => StoreBasedProductModel.fromJson(
        data,
      ),
      onError: (message) => StoreBasedProductModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<OrderCountReportModel> totalOrderCount({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.orderCountTotal,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
          'period': selectedPeriodCount ?? "",
          "store_staff_id": "",
          "startdate": startDate ?? "",
          "enddate": endDate ?? "",
        },
      ),
      onSuccess: (data) => OrderCountReportModel.fromJson(
        data,
      ),
      onError: (message) => OrderCountReportModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<SearchCustomersModel> searchCustomer({
    required String searchQuery,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.searchcustomer,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
          "search_term": searchQuery,
        },
      ),
      onSuccess: (data) => SearchCustomersModel.fromJson(
        data,
      ),
      onError: (message) => SearchCustomersModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<ActiveWareHouseModel> getActiveWarehouseData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.activeWarehouse,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
        },
      ),
      onSuccess: (data) => ActiveWareHouseModel.fromJson(
        data,
      ),
      onError: (message) => ActiveWareHouseModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<AllStoreProductInventoryModel> getStoreProductInventoryData({
    required String? warehouseId,
    required String? categoryId,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.activeStoreBasedInventories,
        data: {
          "vendorid": Singleton.instance.vendorId,
          "servicekey": Singleton.instance.serviceKey,
          "store_location_id": Singleton.instance.storeLocationId ?? "",
          "warehouse_id": warehouseId,
          "cat_id": categoryId,
        },
      ),
      onSuccess: (data) => AllStoreProductInventoryModel.fromJson(
        data,
      ),
      onError: (message) => AllStoreProductInventoryModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<AllCategoryListModel> getInventoryCategoryList() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.allCategoryList,
        data: {
          "vendorid": Singleton.instance.vendorId,
          "servicekey": Singleton.instance.serviceKey,
        },
      ),
      onSuccess: (data) => AllCategoryListModel.fromJson(
        data,
      ),
      onError: (message) => AllCategoryListModel(
        status: "false",
        message: message,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> addToPOSCart({
    required String productId,
    required String attribute,
    required String warehouseId,
    required String skucode,
    required String storeid,
    required String userId,
  }) {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.addToCart,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
          "user_id": userId,
          "warehouse_id": warehouseId,
          "store_id": storeid,
          "productid": productId,
          "sku_code": skucode,
          "quantity": "1",
          "cart_from":
              "2", //! tow means vendor, 3-> store staff, 0->user, 1-> admin
          "barcode": "",
        },
      ),
      onSuccess: (data) {
        return {
          "status": data['status'],
          "message": data['message'],
          "warehouseId": warehouseId,
          "userId": userId,
        };
      },
      onError: (message) {
        return {"status": "false", "message": message};
      },
    );
  }

  @override
  Future<ViewCartPosModel> viewCartData({
    required String warehouseId,
    required String userId,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.viewcart,
        data: {
          'vendorid': Singleton.instance.vendorId ?? '',
          'servicekey': Singleton.instance.serviceKey ?? '',
          "cart_from":
              "2", //! tow means vendor, 3-> store staff, 0->user, 1-> admin
          "user_id": userId,
          "warehouse_id":
              warehouseId, //! warehouseId temp hardcoded for static data
        },
      ),
      onSuccess: (data) => ViewCartPosModel.fromJson(data),
      onError: (message) => ViewCartPosModel(status: "false", message: message),
    );
  }

  @override
  Future<Map<String, dynamic>> removePosCart({
    required cartId,
    required int index,
    required String warehouseId,
    required String userId,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.removecart,
        data: {
          'vendorid': Singleton.instance.vendorId ?? '',
          'servicekey': Singleton.instance.serviceKey ?? '',
          "cart_from": "2",
          "user_id": userId,
          "warehouse_id": warehouseId,
          "cart_id": cartId,
        },
      ),
      onSuccess: (data) {
        return {
          "status": data['status'],
          "message": data['message'],
          "warehouseId": warehouseId,
          "userId": userId,
          "index": index
        };
      },
      onError: (message) {
        return {"status": "false", "message": message};
      },
    );
  }

  @override
  Future<Map<String, dynamic>> updatePosCart({
    required String quantity,
    required String cartId,
    required String warehouseId,
    required String userId,
  }) async {

    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.updatecart,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
          "cart_from": "2",
          "user_id": userId,
          "warehouse_id": warehouseId,
          'cart_id': cartId,
          "quantity": quantity.toString(),
        },
      ),
      onSuccess: (data) {
        return {
          "status": data['status'],
          "message": data['message'],
          "warehouseId": warehouseId,
          "userId": userId,
        };
      },
      onError: (message) {
        return {"status": "false", "message": message};
      },
    );
  }
  
  @override
  Future<VendorSalesByCategoryModel> salesByCategoryReport({
    String? selectedPeriodCount,
    String? startDate,
    String? endDate,
  }) async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.post(
        HttpUrl.appBaseUrl + HttpUrl.salesByCategory,
        data: {
          'vendorid': Singleton.instance.vendorId,
          'servicekey': Singleton.instance.serviceKey,
          'period': selectedPeriodCount ?? "",
          "store_staff_id": "",
          "startdate": startDate ?? "",
          "enddate": endDate ?? "",
        },
      ),
      onSuccess: (data) {
        return VendorSalesByCategoryModel.fromJson(data);
      },
      onError: (message) {
        return VendorSalesByCategoryModel(
          status: "false",
          message: message,
        );
      },
    );
  }
  
  @override
  Future<AppSettings> getSettingsData() async {
    return ApiResponseHandler.handleResponse(
      apiCall: () => dio.get(
        HttpUrl.appBaseUrl + HttpUrl.appSettings,
      ),
      onSuccess: (data) {
        return AppSettings.fromJson(data);
      },
      onError: (message) {
        return AppSettings(
          status: "false",
        );
      },
    );
  }
}
