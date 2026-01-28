part of 'add_desk_top_pos_bloc.dart';

@immutable
sealed class AddDeskTopPosState {}

final class AddDeskTopPosInitial extends AddDeskTopPosState {}

final class AddDeskTopPosLoading extends AddDeskTopPosState {}

final class FetchCustomerDataLoaded extends AddDeskTopPosState {
  final SearchCustomersModel searchCustomersModel;

  FetchCustomerDataLoaded({required this.searchCustomersModel});
}

final class FetchCustomerDataFailure extends AddDeskTopPosState {
  final String failureMessage;

  FetchCustomerDataFailure({required this.failureMessage});
}

final class FetchActiveWarehouseLoaded extends AddDeskTopPosState {
  final ActiveWareHouseModel activeWareHouseModel;

  FetchActiveWarehouseLoaded({required this.activeWareHouseModel});
}

final class FetchActiveWarehouseFailure extends AddDeskTopPosState {
  final String failureMessage;

  FetchActiveWarehouseFailure({required this.failureMessage});
}

final class FetchStoreProductInventoryLoaded extends AddDeskTopPosState {
  final AllStoreProductInventoryModel allStoreProductInventoryModel;

  FetchStoreProductInventoryLoaded(
      {required this.allStoreProductInventoryModel});
}

final class FetchStoreProductInventoryFailure extends AddDeskTopPosState {
  final String failureMessage;

  FetchStoreProductInventoryFailure({required this.failureMessage});
}

final class FetchInventoryCategoryLoaded extends AddDeskTopPosState {
  final AllCategoryListModel inventoryCategoryModel;

  FetchInventoryCategoryLoaded({required this.inventoryCategoryModel});
}

final class FetchInventoryCategoryFailure extends AddDeskTopPosState {
  final String failureMessage;

  FetchInventoryCategoryFailure({required this.failureMessage});
}

final class SearchListener extends AddDeskTopPosState {
  final String searchQuery;

  SearchListener({required this.searchQuery});
}

//! add to cart
final class AddToPOSCartLoaded extends AddDeskTopPosState {
  final Map<String, dynamic> addToPOSCartModel;

  AddToPOSCartLoaded({required this.addToPOSCartModel});
}

final class AddToPOSCartFailure extends AddDeskTopPosState {
  final String failureMessage;

  AddToPOSCartFailure({required this.failureMessage});
}

final class ViewCartPosLoaded extends AddDeskTopPosState {
  final ViewCartPosModel viewCartPosModel;

  ViewCartPosLoaded({required this.viewCartPosModel});
}

final class ViewCartPosFailure extends AddDeskTopPosState {
  final String failureMessage;

  ViewCartPosFailure({required this.failureMessage});
}

final class RemoveCartPosLoaded extends AddDeskTopPosState {
  final Map<String, dynamic> removePosCartModel;

  RemoveCartPosLoaded({required this.removePosCartModel});
}

final class RemoveCartPosFailure extends AddDeskTopPosState {
  final String failureMessage;

  RemoveCartPosFailure({required this.failureMessage});
}

final class UpdateCartPosLoaded extends AddDeskTopPosState {
  final Map<String, dynamic> updatePosCartModel;

  UpdateCartPosLoaded({required this.updatePosCartModel});
}

final class UpdateCartPosFailure extends AddDeskTopPosState {
  final String failureMessage;

  UpdateCartPosFailure({required this.failureMessage});
}
