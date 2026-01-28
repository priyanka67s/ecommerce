part of 'add_desk_top_pos_bloc.dart';

@immutable
sealed class AddDeskTopPosEvent {}

final class FetchCustomerDataEvent extends AddDeskTopPosEvent {
  final String searchQuery;

  FetchCustomerDataEvent({required this.searchQuery});
}

final class FetchActiveWarehouseEvent extends AddDeskTopPosEvent {}

final class FetchStoreProductInventoryEvent extends AddDeskTopPosEvent {
  final String warehouseId;
  final String categoryId;

  FetchStoreProductInventoryEvent({
    required this.warehouseId,
    required this.categoryId,
  });
}

final class FetchInventoryCategoryEvent extends AddDeskTopPosEvent {}

final class SearchListenerEvent extends AddDeskTopPosEvent {
  final String searchQuery;

  SearchListenerEvent({required this.searchQuery});
}

final class AddToCartPOSEvent extends AddDeskTopPosEvent {
  final String productId;
  final String attribute;
  final String warehouseId;
  final String skucode;
  final String storeid;
  final String userId;

  AddToCartPOSEvent({
    required this.productId,
    required this.attribute,
    required this.warehouseId,
    required this.skucode,
    required this.storeid,
    required this.userId,
  });
}

class ViewCartEvent extends AddDeskTopPosEvent {
  final String warehouseId;
  final String userId;

  ViewCartEvent({
    required this.warehouseId,
    required this.userId,
  });
}

class RemoveCartEvent extends AddDeskTopPosEvent {
  final String cartId;
  final int index;
  final String warehouseId;
  final String userId;

  RemoveCartEvent({
    required this.cartId,
    required this.index,
    required this.warehouseId,
    required this.userId,
  });
}

class UpdateCartEvent extends AddDeskTopPosEvent {
  final String quantity;
  final String cartId;
  final String warehouseId;
  final String userId;

  UpdateCartEvent({
    required this.quantity,
    required this.cartId,
    required this.warehouseId,
    required this.userId,
  });
}
