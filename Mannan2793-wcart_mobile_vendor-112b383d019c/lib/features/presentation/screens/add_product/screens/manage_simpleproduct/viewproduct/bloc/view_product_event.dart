part of 'view_product_bloc.dart';

@immutable
sealed class ViewProductEvent {}

final class GetAllProductEvent extends ViewProductEvent {}

final class FetchMoreProductEvent extends ViewProductEvent {}
