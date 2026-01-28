import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/domain/usecase/sales_category_usecase.dart';
import '../../../../../../model/vendorsales_category_model.dart';
part 'sales_category_event.dart';
part 'sales_category_state.dart';

class SalesCategoryBloc extends Bloc<SalesCategoryEvent, SalesCategoryState> {
  final SalesCategoryUseCase _salesCategoryUseCase;
  SalesCategoryBloc({
    required SalesCategoryUseCase salesCategoryUseCase,
  })  : _salesCategoryUseCase = salesCategoryUseCase,
        super(SalesCategoryInitial()) {
    on<FetchSalesCategoryEvent>(_fetchSalesCategoryEvent);
  }

  FutureOr<void> _fetchSalesCategoryEvent(
    FetchSalesCategoryEvent event,
    Emitter<SalesCategoryState> emit,
  ) async {
    emit(SalesCategoryLoading());
    try {
      final result = await _salesCategoryUseCase(
        SalesCategoryUseCaseParams(
          selectedPeriodCount: event.selectedPeriodCount,
          startDate: event.startDate,
          endDate: event.endDate,
        ),
      );

      result.fold(
        (failure) => emit(
          SalesCategoryFailure(error: failure.message),
        ),
        (vendorSalesCategoryData) => emit(
          SalesCategoryLoaded(vendorSalesCategoryData: vendorSalesCategoryData),
        ),
      );
    } catch (e) {
      emit(
        SalesCategoryFailure(
          error: e.toString(),
        ),
      );
    }
  }
}
