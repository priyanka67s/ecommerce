import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/domain/usecase/total_order_count_usecase.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';
part 'sales_by_date_event.dart';
part 'sales_by_date_state.dart';

class SalesByDateBloc extends Bloc<SalesByDateEvent, SalesByDateState> {
  final TotalOrderCountUseCase _totalOrderCountUseCase;
  SalesByDateBloc({required TotalOrderCountUseCase totalOrderCountUseCase})
      : _totalOrderCountUseCase = totalOrderCountUseCase,
        super(SalesByDateInitial()) {
    on<ViewTotalOrderCountEvent>(_viewTotalOrderCountEvent);
    on<SelectFilterEvent>(_selectFilterEvent);
  }

  FutureOr<void> _viewTotalOrderCountEvent(
      ViewTotalOrderCountEvent event, Emitter<SalesByDateState> emit) async {
    emit(SalesByDateLoading());
    final viewTotalOrderCountResponse = await _totalOrderCountUseCase(
      TotalOrderCountUseCaseParams(
        selectedPeriodCount: event.selectedPeriodCount,
        startDate: event.startDate,
        endDate: event.endDate,
      ),
    );
    viewTotalOrderCountResponse.fold(
      (onFailure) => emit(
        SalesByDateFailure(
          message: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        SalesByDateLoaded(
          orderCountReportModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _selectFilterEvent(
      SelectFilterEvent event, Emitter<SalesByDateState> emit) async {
    emit(
      SelectFilterState(
        selectedFilter: event.value,
      ),
    );
  }
}
