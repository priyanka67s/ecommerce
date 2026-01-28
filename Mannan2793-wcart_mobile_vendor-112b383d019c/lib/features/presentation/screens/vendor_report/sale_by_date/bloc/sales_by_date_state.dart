part of 'sales_by_date_bloc.dart';

@immutable
sealed class SalesByDateState {}

final class SalesByDateInitial extends SalesByDateState {}


final class SalesByDateLoading extends SalesByDateState {}
final class SalesByDateLoaded extends SalesByDateState {
  final OrderCountReportModel orderCountReportModel;

  SalesByDateLoaded({required this.orderCountReportModel});
}
final class SalesByDateFailure extends SalesByDateState{
  final String message;
  SalesByDateFailure({required this.message});
}

final class SelectFilterState extends SalesByDateState{
  final String selectedFilter;
  SelectFilterState({required this.selectedFilter});
}