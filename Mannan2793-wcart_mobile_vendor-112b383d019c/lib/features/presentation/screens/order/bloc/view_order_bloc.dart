
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/domain/usecase/view_order_usecase.dart';

part 'view_order_event.dart';
part 'view_order_state.dart';

class ViewOrderBloc extends Bloc<ViewOrderEvent, ViewOrderState> {
  final ViewOrderUseCase _viewOrderUseCase;
  ViewOrderBloc({
    required ViewOrderUseCase viewOrderUseCase,
  }) : _viewOrderUseCase = viewOrderUseCase, super(ViewOrderInitial()) {
    on<ViewOrderDataEvent>(_viewOrderDataEvent);
  }

  FutureOr<void> _viewOrderDataEvent(ViewOrderDataEvent event, Emitter<ViewOrderState> emit,) async{
    emit(ViewOrderDataLoading());
    final viewOrderResponse = await _viewOrderUseCase("");
    viewOrderResponse.fold(
      (onFailure) => emit(
        ViewOrderDataFailure(
          message: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewOrderDataLoaded(
          viewOrderModel: onSuccess,
        ),
      ),
    );
  }
}
