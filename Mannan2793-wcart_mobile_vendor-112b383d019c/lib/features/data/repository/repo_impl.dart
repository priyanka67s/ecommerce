import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/error/server_excption.dart';
import 'package:wcart_vendor/features/data/data_source/remote_data_source.dart';
import 'package:wcart_vendor/features/data/model/addattribute_model.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/features/data/model/listbrand_model.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/features/data/model/manageproduct_model.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/features/data/model/settings_models.dart';
import 'package:wcart_vendor/features/data/model/viewcartpos_model.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';
import 'package:wcart_vendor/model/vendorsales_category_model.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';

class RepoImpl implements Repository {
  final RemoteDataSource remoteDatastore;

  RepoImpl(this.remoteDatastore);
  @override
  Future<Either<Failure, VendorModel>> getHomePageData() async {
    try {
      final VendorModel homePageData = await remoteDatastore.getHomePageData();
      return Right(homePageData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ManageProductModel>> getManageProductData() async {
    try {
      final ManageProductModel manageProductData =
          await remoteDatastore.getManageProductData();
      return Right(manageProductData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ViewTagsModel>> getTagsData() async {
    try {
      final viewTagsModelData = await remoteDatastore.getTagsData();
      return Right(viewTagsModelData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ViewBrandModel>> getBrandsData() async {
    try {
      final viewBrandModelData = await remoteDatastore.getBrandsData();
      return Right(viewBrandModelData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ListCategoryModel>> getCategoryData() async {
    try {
      final viewBrandModelData = await remoteDatastore.getCategoryData();
      return Right(viewBrandModelData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ViewAttributesModel>> getAttributesModel() async {
    try {
      final viewAttributesData = await remoteDatastore.getAttributesModel();
      return Right(viewAttributesData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, AddAttributeModel>> addAttributeData(
      String attributeName, String? id) async {
    try {
      final addAttributeData =
          await remoteDatastore.addAttributeData(attributeName, id);
      return Right(addAttributeData);
    } on ServerException catch (e) {
      return left(Failure(e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, ViewOrderModel>> viewOrdersData() async {
    try {
      final viewOrderData = await remoteDatastore.viewOrdersData();
      return Right(viewOrderData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ViewWarehouseModel>> viewWarehouseModel() async {
    try {
      final viewWarehouseData = await remoteDatastore.viewWarehouseModel();
      return Right(viewWarehouseData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removeWarehouseData({
    required String warehouseId,
    required int index,
  }) async {
    try {
      final viewWarehouseData = await remoteDatastore.removeWarehouse(
          warehouseId: warehouseId, index: index);
      return Right(viewWarehouseData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ViewInventoryModel>> viewInventoryProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  }) async {
    try {
      final viewWarehouseData = await remoteDatastore.viewInventoryProductList(
        filter: filter,
        filterBy: filterBy,
        order: order,
        orderby: orderby,
        storeLocationId: storeLocationId,
      );
      return Right(viewWarehouseData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ViewStoreLocationModel>>
      viewStoreLocationData() async {
    try {
      final viewStoreLocationData =
          await remoteDatastore.viewStoreLocationData();
      return Right(viewStoreLocationData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, StoreBasedProductModel>> viewStoreProductList({
    required String? filter,
    required String? filterBy,
    required String? order,
    required String? orderby,
    required int? storeLocationId,
  }) async {
    try {
      final viewStoreLocationData = await remoteDatastore.viewStoreProductList(
        filter: filter,
        filterBy: filterBy,
        order: order,
        orderby: orderby,
        storeLocationId: storeLocationId,
      );
      return Right(viewStoreLocationData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, OrderCountReportModel>> totalOrderCount({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  }) async {
    try {
      final viewStoreLocationData = await remoteDatastore.totalOrderCount(
        selectedPeriodCount: selectedPeriodCount,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(viewStoreLocationData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SearchCustomersModel>> searchCustomer({
    required String searchQuery,
  }) async {
    try {
      final searchQueryData = await remoteDatastore.searchCustomer(
        searchQuery: searchQuery,
      );
      return Right(searchQueryData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ActiveWareHouseModel>> getActiveWarehouseData() async {
    try {
      final getActiveWarehouseData =
          await remoteDatastore.getActiveWarehouseData();
      return Right(getActiveWarehouseData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AllStoreProductInventoryModel>>
      getAllStoreProductInventoryData({
    required String? warehouseId,
    required String? categoryId,
  }) async {
    try {
      final getProductData = await remoteDatastore.getStoreProductInventoryData(
        warehouseId: warehouseId,
        categoryId: categoryId,
      );
      return Right(getProductData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AllCategoryListModel>>
      getInventoryCategoryList() async {
    try {
      final getCategoryData = await remoteDatastore.getInventoryCategoryList();
      return Right(getCategoryData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addToPOSCart({
    required String productId,
    required String attribute,
    required String warehouseId,
    required String skucode,
    required String storeid,
    required String userId,
  }) async {
    try {
      final getCategoryData = await remoteDatastore.addToPOSCart(
        productId: productId,
        attribute: attribute,
        warehouseId: warehouseId,
        skucode: skucode,
        storeid: storeid,
        userId: userId,
      );
      return Right(getCategoryData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ViewCartPosModel>> viewCartData({
    required String warehouseId,
    required String userId,
  }) async {
    try {
      final viewCartData = await remoteDatastore.viewCartData(
        warehouseId: warehouseId,
        userId: userId,
      );
      return Right(viewCartData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removePosCart({
    required String cartId,
    required int index,
    required String warehouseId,
    required String userId,
  }) async {
    try {
      final viewCartData = await remoteDatastore.removePosCart(
        cartId: cartId,
        index: index,
        warehouseId: warehouseId,
        userId: userId,
      );
      return Right(viewCartData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updatePosCart({
    required String quantity,
    required String cartId,
    required String warehouseId,
    required String userId,
  }) async {
    try {
      final viewCartData = await remoteDatastore.updatePosCart(
        quantity: quantity,
        cartId: cartId,
        warehouseId: warehouseId,
        userId: userId,
      );
      return Right(viewCartData);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VendorSalesByCategoryModel>> salesByCategoryReport({
    required String? selectedPeriodCount,
    required String? startDate,
    required String? endDate,
  }) async {
    try {
      final viewSalesByCategoryReport =
          await remoteDatastore.salesByCategoryReport(
        selectedPeriodCount: selectedPeriodCount,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(viewSalesByCategoryReport);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppSettings>> getSettingsData() async {
    try {
      final viewSalesByCategoryReport = await remoteDatastore.getSettingsData();
      return Right(viewSalesByCategoryReport);
    } on ServerException catch (e) {
      return left(
        Failure(
          e.message.toString(),
        ),
      );
    }
  }
}
