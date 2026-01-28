import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/domain/usecase/view_inventory_product_usecase.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';

part 'view_product_inventory_event.dart';
part 'view_product_inventory_state.dart';

class ViewProductInventoryBloc
    extends Bloc<ViewProductInventoryEvent, ViewProductInventoryState> {
  final ViewInventoryProductUseCase _viewInventoryProductUseCase;
  ViewProductInventoryBloc(
      {required ViewInventoryProductUseCase viewInventoryProductUseCase})
      : _viewInventoryProductUseCase = viewInventoryProductUseCase,
        super(ViewProductInventoryInitial()) {
    on<ViewProductInventoryDataEvent>(_viewProductInventoryDataEvent);
  }

  FutureOr<void> _viewProductInventoryDataEvent(
    ViewProductInventoryDataEvent event,
    Emitter<ViewProductInventoryState> emit,
  ) async {
    emit(ViewProductInventoryLoading());
    final viewProductInventoryDataResponse = await _viewInventoryProductUseCase(
      ViewInventoryProductUseCaseParams(
        filter: event.filter,
        filterBy: event.filterBy,
        order: event.order,
        orderby: event.orderby,
        storeLocationId: event.storeLocationId,
      ),
    );
    viewProductInventoryDataResponse.fold(
      (failure) => emit(
        ViewProductInventoryFailure(
          failureMessage: failure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewProductInventoryLoaded(
          viewInventoryModel: onSuccess,
        ),
      ),
    );
  }
}
