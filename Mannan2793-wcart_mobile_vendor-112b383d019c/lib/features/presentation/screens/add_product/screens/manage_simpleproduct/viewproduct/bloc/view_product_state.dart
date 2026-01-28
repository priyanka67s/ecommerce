part of 'view_product_bloc.dart';

@immutable
sealed class ViewProductState {}

final class ViewProductInitial extends ViewProductState {}

final class ViewProductLoading extends ViewProductState {}
final class ViewProductLoaded extends ViewProductState {
  final ManageProductModel manageProductModel;

  ViewProductLoaded({required this.manageProductModel});
}
final class ViewProductFailure extends ViewProductState {
  final String errorMessage;

  ViewProductFailure({required this.errorMessage});
}



