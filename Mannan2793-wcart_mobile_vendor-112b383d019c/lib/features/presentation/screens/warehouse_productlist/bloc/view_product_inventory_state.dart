part of 'view_product_inventory_bloc.dart';

@immutable
sealed class ViewProductInventoryState {}

final class ViewProductInventoryInitial extends ViewProductInventoryState {}

final class ViewProductInventoryLoaded extends ViewProductInventoryState {
  final ViewInventoryModel viewInventoryModel;
  ViewProductInventoryLoaded({required this.viewInventoryModel});
}
final class ViewProductInventoryLoading extends ViewProductInventoryState {}
final class ViewProductInventoryFailure extends ViewProductInventoryState {
  final String failureMessage;

  ViewProductInventoryFailure({required this.failureMessage});
}
