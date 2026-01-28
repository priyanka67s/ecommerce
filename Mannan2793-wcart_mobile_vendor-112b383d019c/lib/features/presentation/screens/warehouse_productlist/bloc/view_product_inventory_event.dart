part of 'view_product_inventory_bloc.dart';

@immutable
sealed class ViewProductInventoryEvent {}

final class ViewProductInventoryDataEvent extends ViewProductInventoryEvent {
  final String? filter;
  final String? filterBy;
  final String? order;
  final String? orderby;
  final int? storeLocationId;

  ViewProductInventoryDataEvent({
    required this.filter,
    required this.filterBy,
    required this.order,
    required this.orderby,
    required this.storeLocationId,
  });
}
