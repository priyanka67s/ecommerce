part of 'store_product_list_bloc.dart';

@immutable
sealed class StoreProductListEvent {}

final class ViewStoreProductDataEvent extends StoreProductListEvent {
  final String? filter;
  final String? filterBy;
  final String? order;
  final String? orderby;
  final int? storeLocationId;

  ViewStoreProductDataEvent({
    required this.filter,
    required this.filterBy,
    required this.order,
    required this.orderby,
    required this.storeLocationId,
  });
}
