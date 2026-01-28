import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wcart_vendor/features/domain/usecase/view_store_product_list_usecase.dart';

import '../../../../../model/storebasedproduct_model.dart';

part 'store_product_list_event.dart';
part 'store_product_list_state.dart';

class StoreProductListBloc extends Bloc<StoreProductListEvent, StoreProductListState> {
  final ViewStoreProductListUseCase _viewStoreProductListUseCase;
  StoreProductListBloc({
    required ViewStoreProductListUseCase viewStoreProductListUseCase,
  }) :_viewStoreProductListUseCase= viewStoreProductListUseCase, super(StoreProductListInitial()) {
    on<ViewStoreProductDataEvent>(_viewStoreProductDataEvent);
  }

  FutureOr<void> _viewStoreProductDataEvent(ViewStoreProductDataEvent event, Emitter<StoreProductListState> emit)async{
    emit(StoreProductListLoading());
    final viewStoreProductListResponse = await _viewStoreProductListUseCase(ViewStoreProductListUseCaseParams(filter: event.filter, filterBy: event.filterBy, order: event.order, orderby: event.orderby, storeLocationId: event.storeLocationId,),);
    viewStoreProductListResponse.fold(
      (onFailure) => emit(
        StoreProductListFailure(
          message: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        StoreProductListLoaded(
          storeBasedProductModel: onSuccess,
        ),
      ),
    );
  }
}
