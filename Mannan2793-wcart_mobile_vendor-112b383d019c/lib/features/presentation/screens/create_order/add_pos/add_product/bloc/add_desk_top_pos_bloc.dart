import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/features/domain/usecase/active_warehouse_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/add_to_cart_pos_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/inventory_category_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/remove_cart_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/search_customer_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/update_pos_cart_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_cart_usecase.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';

import '../../../../../../data/model/allstoreproductinventory_model.dart';
import '../../../../../../data/model/viewcartpos_model.dart';
import '../../../../../../domain/usecase/store_product_inventory_usecase.dart';

part 'add_desk_top_pos_event.dart';
part 'add_desk_top_pos_state.dart';

class AddDeskTopPosBloc extends Bloc<AddDeskTopPosEvent, AddDeskTopPosState> {
  final SearchCustomerUseCase _searchCustomerUseCase;
  final ActiveWarehouseUseCase _activeWarehouseUseCase;
  final StoreProductInventoryUseCase _storeProductInventoryUseCase;
  final InventoryCategoryUseCase _inventoryCategoryUseCase;
  final AddToCartPosUseCase _addToCartPosUseCase;
  final ViewCartUseCase _viewCartUseCase;
  final RemoveCartUseCase _removeCartUseCase;
  final UpdatePosCartUsecase _updatePosCartUsecase;
  AddDeskTopPosBloc({
    required SearchCustomerUseCase searchCustomerUseCase,
    required ActiveWarehouseUseCase activeWarehouseUseCase,
    required StoreProductInventoryUseCase storeProductInventoryUseCase,
    required InventoryCategoryUseCase inventoryCategoryUseCase,
    required AddToCartPosUseCase addToCartPosUseCase,
    required ViewCartUseCase viewCartUseCase,
    required RemoveCartUseCase removeCartUseCase,
    required UpdatePosCartUsecase updatePosCartUsecase,
  })  : _searchCustomerUseCase = searchCustomerUseCase,
        _activeWarehouseUseCase = activeWarehouseUseCase,
        _storeProductInventoryUseCase = storeProductInventoryUseCase,
        _inventoryCategoryUseCase = inventoryCategoryUseCase,
        _addToCartPosUseCase = addToCartPosUseCase,
        _viewCartUseCase = viewCartUseCase,
        _removeCartUseCase = removeCartUseCase,
        _updatePosCartUsecase = updatePosCartUsecase,
        super(AddDeskTopPosInitial()) {
    on<FetchCustomerDataEvent>(_fetchCustomerDataEvent);
    on<FetchActiveWarehouseEvent>(_fetchActiveWarehouseEvent);
    on<FetchStoreProductInventoryEvent>(_fetchStoreProductInventoryEvent);
    on<FetchInventoryCategoryEvent>(_fetchInventoryCategoryEvent);
    on<SearchListenerEvent>(_searchListenerEvent);
    on<AddToCartPOSEvent>(_addToCartPOSEvent);
    on<ViewCartEvent>(_viewCartEvent);
    on<RemoveCartEvent>(_removeCartEvent);
    on<UpdateCartEvent>(_updateCartEvent);
  }

  FutureOr<void> _fetchCustomerDataEvent(
    FetchCustomerDataEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final startTime = DateTime.now(); // Start time
    final customerResponse = await _searchCustomerUseCase(event.searchQuery);
    final endTime = DateTime.now(); // End time
    final duration = endTime.difference(startTime); // Time taken

    print('BLoc API call duration: ${duration.inMilliseconds} ms');    
    customerResponse.fold(
      (onFailure) => emit(
        FetchCustomerDataFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        FetchCustomerDataLoaded(
          searchCustomersModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _fetchActiveWarehouseEvent(
    FetchActiveWarehouseEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final warehouseResponse = await _activeWarehouseUseCase("");
    warehouseResponse.fold(
      (onFailure) => emit(
        FetchActiveWarehouseFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        FetchActiveWarehouseLoaded(
          activeWareHouseModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _fetchStoreProductInventoryEvent(
    FetchStoreProductInventoryEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final storeProductInventoryResponse = await _storeProductInventoryUseCase(
      StoreProductInventoryUseCaseParams(
        warehouseId: event.warehouseId,
        categoryId: event.categoryId,
      ),
    );
    storeProductInventoryResponse.fold(
      (onFailure) => emit(
        FetchStoreProductInventoryFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        FetchStoreProductInventoryLoaded(
          allStoreProductInventoryModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _fetchInventoryCategoryEvent(
    FetchInventoryCategoryEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final inventoryCategoryResponse = await _inventoryCategoryUseCase("");
    inventoryCategoryResponse.fold(
      (onFailure) => emit(
        FetchInventoryCategoryFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        FetchInventoryCategoryLoaded(
          inventoryCategoryModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _searchListenerEvent(
      SearchListenerEvent event, Emitter<AddDeskTopPosState> emit) async {
    emit(SearchListener(searchQuery: event.searchQuery));
  }

  FutureOr<void> _addToCartPOSEvent(
      AddToCartPOSEvent event, Emitter<AddDeskTopPosState> emit) async {
    final addToCartResponse = await _addToCartPosUseCase(
      AddToCartPosUseCaseParams(
        productId: event.productId,
        attribute: event.attribute,
        warehouseId: event.warehouseId,
        skucode: event.skucode,
        storeid: event.storeid,
        userId: event.userId,
      ),
    );
    addToCartResponse.fold(
      (onFailure) => emit(
        AddToPOSCartFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        AddToPOSCartLoaded(
          addToPOSCartModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _viewCartEvent(
    ViewCartEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final viewCartResponse = await _viewCartUseCase(
      ViewCartUseCaseParams(
        warehouseId: event.warehouseId,
        userId: event.userId,
      ),
    );
    viewCartResponse.fold(
      (onFailure) => emit(
        ViewCartPosFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewCartPosLoaded(
          viewCartPosModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _removeCartEvent(
    RemoveCartEvent event,
    Emitter<AddDeskTopPosState> emit,
  ) async {
    final removeCartResponse = await _removeCartUseCase(
      RemoveCartUseCaseParams(
        cartId: event.cartId,
        index: event.index,
        warehouseId: event.warehouseId,
        userId: event.userId,
      ),
    );
    removeCartResponse.fold(
      (onFailure) => emit(
        RemoveCartPosFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        RemoveCartPosLoaded(
          removePosCartModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _updateCartEvent(
      UpdateCartEvent event, Emitter<AddDeskTopPosState> emit) async {
    final updateCartResponse = await _updatePosCartUsecase(
      UpdatePosCartUseCaseParams(
        quantity: event.quantity,
        cartId: event.cartId.toString(),
        warehouseId: event.warehouseId,
        userId: event.userId,
      ),
    );
    updateCartResponse.fold(
      (onFailure) => emit(
        UpdateCartPosFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        UpdateCartPosLoaded(
          updatePosCartModel: onSuccess,
        ),
      ),
    );
  }
}
