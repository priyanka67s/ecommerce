part of 'sales_by_date_bloc.dart';

@immutable
sealed class SalesByDateEvent {}

final class ViewTotalOrderCountEvent extends SalesByDateEvent {
  final String? selectedPeriodCount;
  final String? startDate;
  final String? endDate;

  ViewTotalOrderCountEvent({required this.selectedPeriodCount, required this.startDate, required this.endDate});
  
}

final class SelectFilterEvent extends SalesByDateEvent {
  final String value;

  SelectFilterEvent({required this.value});
}