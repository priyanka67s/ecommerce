part of 'view_warehouse_bloc.dart';

@immutable
sealed class ViewWarehouseEvent {}

final class ViewWarehouseDataEvent extends ViewWarehouseEvent {}

final class RemoveWarehouseEvent extends ViewWarehouseEvent {
  final String warehouseId;
  final int index;

  RemoveWarehouseEvent({
    required this.warehouseId,
    required this.index,
  });
}
