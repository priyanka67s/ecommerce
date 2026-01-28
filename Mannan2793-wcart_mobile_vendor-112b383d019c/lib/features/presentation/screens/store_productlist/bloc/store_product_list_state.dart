part of 'store_product_list_bloc.dart';

@immutable
sealed class StoreProductListState {}

final class StoreProductListInitial extends StoreProductListState {}

final class StoreProductListLoaded extends StoreProductListState {
  final StoreBasedProductModel storeBasedProductModel;

  StoreProductListLoaded({required this.storeBasedProductModel});
}

final class StoreProductListLoading extends StoreProductListState {}

final class StoreProductListFailure extends StoreProductListState {
  final String message;
  StoreProductListFailure({required this.message});
}
