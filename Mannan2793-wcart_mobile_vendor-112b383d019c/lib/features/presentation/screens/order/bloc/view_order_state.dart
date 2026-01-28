part of 'view_order_bloc.dart';

@immutable
sealed class ViewOrderState {}

final class ViewOrderInitial extends ViewOrderState {}

final class ViewOrderDataLoaded extends ViewOrderState {
  final ViewOrderModel viewOrderModel;

  ViewOrderDataLoaded({required this.viewOrderModel});
}
final class ViewOrderDataLoading extends ViewOrderState {}
final class ViewOrderDataFailure extends ViewOrderState{
  final String message;
  ViewOrderDataFailure({required this.message});
}
