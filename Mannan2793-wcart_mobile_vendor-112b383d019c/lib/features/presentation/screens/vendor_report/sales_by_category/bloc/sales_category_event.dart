part of 'sales_category_bloc.dart';

@immutable
sealed class SalesCategoryEvent {}


final class FetchSalesCategoryEvent extends SalesCategoryEvent {
  final String? selectedPeriodCount;
  final String? startDate;
  final String? endDate;

  FetchSalesCategoryEvent({
    required this.selectedPeriodCount,
    required this.startDate,
    required this.endDate,
  });
}