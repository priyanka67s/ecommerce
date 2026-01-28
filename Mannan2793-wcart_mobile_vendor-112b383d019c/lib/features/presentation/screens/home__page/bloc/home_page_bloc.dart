import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'package:wcart_vendor/features/domain/usecase/home_detailes.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetHomePageDataUseCase _getHomePageDataUseCase;
  HomePageBloc({required GetHomePageDataUseCase getHomePageDataUseCase}) :
  _getHomePageDataUseCase= getHomePageDataUseCase,
   super(HomePageInitial()) {
    on<FetchHomePageData>(_fetchHomePageData);
  }

  FutureOr<void> _fetchHomePageData(FetchHomePageData event, Emitter<HomePageState> emit)async {
    emit(HomePageLoading());
    try {
      final  dashboardData = await _getHomePageDataUseCase("");
      dashboardData.fold(
          (onfailure) => emit(HomePageFailure(errorMessage: onfailure.message)),
          (onSuccess) async {
        if (onSuccess.status == true) {
          emit(DashboardDataLoaded(
              getPieData(onSuccess),
              (onSuccess.userCount ?? 0).toString(),
              (onSuccess.ordersCount ?? 0).toString(),
              (onSuccess.productCount ?? 0).toString(),
              dashboardData: onSuccess,
              orderValue: (onSuccess.orderValue ?? "0").toString()));
        } else {
          (DashboardDataLoaded([], "0", "0", "0",
              orderValue: "0", dashboardData: onSuccess));
        }
      });
    } catch (e) {
      emit(HomePageFailure(errorMessage: e.toString()));
    }
  }
  
  List<PieData> getPieData(VendorModel dashboardData) {
    List<PieData> pieData = [];
    int totalQuantitySold = 0;
    for (var element in dashboardData.salesByCategory!.take(5)) {
      totalQuantitySold += element.quantitySold ?? 0;
    }
    for (var element in dashboardData.salesByCategory!.take(5)) {
      // Calculate percentage out of 100
      double percentage = totalQuantitySold > 0
          ? ((element.quantitySold ?? 0) / totalQuantitySold) * 100
          : 0;

      // Round to 1 decimal place
      percentage = double.parse(percentage.toStringAsFixed(1));

      pieData.add(PieData(
          element.termName.toString(), percentage, '${percentage.round()}%'));
    }
    return pieData;
  }
}
