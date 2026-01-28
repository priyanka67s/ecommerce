import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/manageproduct_model.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_product_usecase.dart';

part 'view_product_event.dart';
part 'view_product_state.dart';

class ViewProductBloc extends Bloc<ViewProductEvent, ViewProductState> {
  final ManageProductUseCase _manageProductUseCase;
  ViewProductBloc({
    required ManageProductUseCase manageProductUseCase,
  })  : _manageProductUseCase = manageProductUseCase,
        super(ViewProductInitial()) {
    on<GetAllProductEvent>(_getAllProductEvent);   
  }

  FutureOr<void> _getAllProductEvent(
      GetAllProductEvent event, Emitter<ViewProductState> emit) async {
    emit(ViewProductLoading());
    final getAllProductResponse = await _manageProductUseCase("");
    getAllProductResponse.fold(
      (onFailure) => emit(
        ViewProductFailure(
          errorMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewProductLoaded(
          manageProductModel: onSuccess,
        ),
      ),
    );
  }
}
