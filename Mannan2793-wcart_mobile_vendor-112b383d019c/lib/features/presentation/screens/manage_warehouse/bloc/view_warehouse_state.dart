part of 'view_warehouse_bloc.dart';

@immutable
sealed class ViewWarehouseState {}

final class ViewWarehouseInitial extends ViewWarehouseState {}

final class ViewWarehouseLoaded extends ViewWarehouseState {
  final ViewWarehouseModel viewWarehouseModel;
  ViewWarehouseLoaded(this.viewWarehouseModel);
}
final class ViewWarehouseLoading extends ViewWarehouseState {}
final class ViewWarehouseFailure extends ViewWarehouseState {
  final String failureMessage;

  ViewWarehouseFailure({required this.failureMessage});
}


//!remove warehouse State
final class RemoveWarehouseLoaded extends ViewWarehouseState {
  final Map<String, dynamic> viewWarehouseModel;
  RemoveWarehouseLoaded(this.viewWarehouseModel);
}

final class RemoveWarehouseFailure extends ViewWarehouseState {
  final String failureMessage;

  RemoveWarehouseFailure({required this.failureMessage});
}
