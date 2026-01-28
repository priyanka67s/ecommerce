part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}
final class HomePageLoading extends HomePageState {}
final class HomePageLoaded extends HomePageState{
  final VendorModel dashboardData;
  HomePageLoaded({required this.dashboardData});  
}
final class HomePageFailure extends HomePageState{
  final String errorMessage;

  HomePageFailure({required this.errorMessage});
}

final class DashboardDataLoaded extends HomePageState {
  final String userCount;
  final String orderValue;
  final String orderCount;
  final String productCount;
  final VendorModel dashboardData;
  final List<PieData> pieData;
  DashboardDataLoaded(
      this.pieData, this.userCount, this.orderCount, this.productCount,
      {required this.dashboardData, required this.orderValue});
}

//! pie cart Model
class PieData {
  PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
