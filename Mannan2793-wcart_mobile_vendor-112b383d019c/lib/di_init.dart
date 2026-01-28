import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wcart_vendor/features/data/data_source/remote_data_source.dart';
import 'package:wcart_vendor/features/data/repository/repo_impl.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/features/domain/usecase/active_warehouse_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/add_attribute_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/add_to_cart_pos_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/home_detailes.dart';
import 'package:wcart_vendor/features/domain/usecase/inventory_category_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_attribute_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_brand_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_category_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_product_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_tag_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/remove_cart_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/remove_warehouse_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/sales_category_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/search_customer_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/store_product_inventory_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/total_order_count_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/update_pos_cart_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_cart_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_inventory_product_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_order_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_store_location_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_store_product_list_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_warehouse_usecase.dart';
import 'package:wcart_vendor/features/presentation/screens/add_product/screens/manage_simpleproduct/viewproduct/bloc/view_product_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/create_order/add_pos/add_product/bloc/add_desk_top_pos_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/home__page/bloc/home_page_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_attribute/bloc/manage_attribute_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_brand/bloc/manage_brand_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_categories/bloc/manage_category_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/bloc/manage_tags_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_warehouse/bloc/view_warehouse_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/order/bloc/view_order_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/store_productlist/bloc/store_product_list_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/store_setting/bloc/view_store_location_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/vendor_report/sale_by_date/bloc/sales_by_date_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/warehouse_productlist/bloc/view_product_inventory_bloc.dart';
import 'package:wcart_vendor/util/preference_helper.dart';

import 'features/presentation/screens/vendor_report/sales_by_category/bloc/sales_category_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  _initAuth();
  serviceLocator
      .registerLazySingleton<PreferenceHelper>(() => PreferenceHelper());
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
}

void _initAuth() {
  //Remote Data store
  serviceLocator
    ..registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    //repository
    ..registerFactory<Repository>(
      () => RepoImpl(
        serviceLocator(),
      ),
    )
    //usecase
    ..registerFactory(
      () => GetHomePageDataUseCase(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ManageProductUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ManageTagUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ManageBrandUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ManageCategoryUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ManageAttributeUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => AddAttributeUsecase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewOrderUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewWarehouseUsCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => RemoveWarehouseUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewInventoryProductUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewStoreLocationUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewStoreProductListUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => TotalOrderCountUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SearchCustomerUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ActiveWarehouseUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => StoreProductInventoryUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => InventoryCategoryUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddToCartPosUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => ViewCartUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => RemoveCartUseCase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UpdatePosCartUsecase(
        repository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => SalesCategoryUseCase(
        repository: serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(
      () => HomePageBloc(getHomePageDataUseCase: serviceLocator()),
    )
    ..registerLazySingleton(
      () => ViewProductBloc(
        manageProductUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ManageTagsBloc(
        manageTagUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ManageBrandBloc(
        manageBrandUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ManageCategoryBloc(
        manageCategoryUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ManageAttributeBloc(
        manageAttributeUseCase: serviceLocator(),
        addAttributeUsecase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ViewOrderBloc(
        viewOrderUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ViewWarehouseBloc(
        viewWarehouseUseCase: serviceLocator(),
        removeWarehouseUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ViewProductInventoryBloc(
        viewInventoryProductUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => ViewStoreLocationBloc(
        viewStoreLocationUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => StoreProductListBloc(
        viewStoreProductListUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SalesByDateBloc(
        totalOrderCountUseCase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AddDeskTopPosBloc(
        searchCustomerUseCase: serviceLocator(),
        activeWarehouseUseCase: serviceLocator(),
        storeProductInventoryUseCase: serviceLocator(),
        inventoryCategoryUseCase: serviceLocator(),
        addToCartPosUseCase: serviceLocator(),
        viewCartUseCase: serviceLocator(),
        removeCartUseCase: serviceLocator(),
        updatePosCartUsecase: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SalesCategoryBloc(
        salesCategoryUseCase: serviceLocator(),
      ),
    );
}
