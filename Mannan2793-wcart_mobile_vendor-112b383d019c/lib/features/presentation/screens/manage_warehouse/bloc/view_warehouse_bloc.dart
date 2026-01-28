import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/domain/usecase/remove_warehouse_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/view_warehouse_usecase.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';

part 'view_warehouse_event.dart';
part 'view_warehouse_state.dart';

class ViewWarehouseBloc extends Bloc<ViewWarehouseEvent, ViewWarehouseState> {
  final ViewWarehouseUsCase _viewWarehouseUseCase;
  final RemoveWarehouseUseCase _removeWarehouseUseCase;
  ViewWarehouseBloc({
    required ViewWarehouseUsCase viewWarehouseUseCase,
    required RemoveWarehouseUseCase removeWarehouseUseCase,
  })  : _viewWarehouseUseCase = viewWarehouseUseCase,
        _removeWarehouseUseCase = removeWarehouseUseCase,
        super(ViewWarehouseInitial()) {
    on<ViewWarehouseEvent>(_viewWarehouseEvent);
    on<RemoveWarehouseEvent>(_removeWarehouseEvent);
  }

  FutureOr<void> _viewWarehouseEvent(
      ViewWarehouseEvent event, Emitter<ViewWarehouseState> emit) async {
    emit(ViewWarehouseLoading());
    final viewWarehouseResponse = await _viewWarehouseUseCase("");
    viewWarehouseResponse.fold(
      (onFailure) => emit(
        ViewWarehouseFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewWarehouseLoaded(
          onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _removeWarehouseEvent(
      RemoveWarehouseEvent event, Emitter<ViewWarehouseState> emit) async {
    final removeWarehouseResponse = await _removeWarehouseUseCase(
      RemoveWarehouseUseCaseParams(
        warehouseId: event.warehouseId,
        index: event.index,
      ),
    );
    removeWarehouseResponse.fold(
      (onFailure) => emit(
        RemoveWarehouseFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        RemoveWarehouseLoaded(
          onSuccess,
        ),
      ),
    );
  }
}
