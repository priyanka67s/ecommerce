part of 'view_order_bloc.dart';

@immutable
sealed class ViewOrderEvent {}

final class ViewOrderDataEvent extends ViewOrderEvent {}
