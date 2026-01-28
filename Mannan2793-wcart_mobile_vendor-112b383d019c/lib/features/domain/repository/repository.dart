import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'package:wcart_vendor/features/data/model/listbrand_model.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/features/data/model/manageproduct_model.dart';
import 'package:wcart_vendor/features/data/model/addattribute_model.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';

import '../../../model/vendorsales_category_model.dart';
import '../../data/model/settings_models.dart';
import '../../data/model/viewcartpos_model.dart';

abstract interface class Repository {
  Future<Either<Failure, VendorModel>> getHomePageData();
  Future<Either<Failure, AppSettings>> getSettingsData();
  //! manage Products
  Future<Either<Failure, ManageProductModel>> getManageProductData();
  Future<Either<Failure, ViewTagsModel>> getTagsData();
  Future<Either<Failure, ViewBrandModel>> getBrandsData();
  Future<Either<Failure, ListCategoryModel>> getCategoryData();
  Future<Either<Failure, ViewAttributesModel>> getAttributesModel();
  //! add attribute
  Future<Either<Failure, AddAttributeModel>> addAttributeData(
      String attributeName, String? id);

  //! View Orders Data
  Future<Either<Failure, ViewOrderModel>> viewOrdersData();

  //! View Warehouse Data
  Future<Either<Failure, ViewWarehouseModel>> viewWarehouseModel();

  //! remove warehouse
  Future<Either<Failure, Map<String, dynamic>>> removeWarehouseData({
    required String warehouseId,
    required int index,
  });

  Future<Either<Failure, ViewInventoryModel>> viewInventoryProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  });

  Future<Either<Failure, ViewStoreLocationModel>> viewStoreLocationData();

  Future<Either<Failure, StoreBasedProductModel>> viewStoreProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  });

  Future<Either<Failure, OrderCountReportModel>> totalOrderCount({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  });

  //! POS Repositories
  Future<Either<Failure, SearchCustomersModel>> searchCustomer({
    required final String searchQuery,
  });
  Future<Either<Failure, ActiveWareHouseModel>> getActiveWarehouseData();

  Future<Either<Failure, AllStoreProductInventoryModel>>
      getAllStoreProductInventoryData({
    required String? warehouseId,
    required String? categoryId,
  });

  Future<Either<Failure, AllCategoryListModel>> getInventoryCategoryList();

  Future<Either<Failure, Map<String, dynamic>>> addToPOSCart({
    required String productId,
    required String attribute,
    required String warehouseId,
    required String skucode,
    required String storeid,
    required String userId,
  });

  Future<Either<Failure, ViewCartPosModel>> viewCartData({
    required String warehouseId,
    required String userId,
  });

  Future<Either<Failure, Map<String, dynamic>>> removePosCart({
    required String cartId,
    required int index,
    required String warehouseId,
    required String userId,
  });
  Future<Either<Failure, Map<String, dynamic>>> updatePosCart({
    required String quantity,
    required String cartId,
    required String warehouseId,
    required String userId,
  });

  Future<Either<Failure, VendorSalesByCategoryModel>> salesByCategoryReport({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  });
}
