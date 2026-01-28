part of 'sales_category_bloc.dart';

@immutable
sealed class SalesCategoryState {}

final class SalesCategoryInitial extends SalesCategoryState {}


final class SalesCategoryLoaded extends SalesCategoryState{
  final  VendorSalesByCategoryModel vendorSalesCategoryData;

  SalesCategoryLoaded({required this.vendorSalesCategoryData});
}


final class SalesCategoryLoading extends SalesCategoryState {}


final class SalesCategoryFailure extends SalesCategoryState {
  final String error;

  SalesCategoryFailure({required this.error});
}