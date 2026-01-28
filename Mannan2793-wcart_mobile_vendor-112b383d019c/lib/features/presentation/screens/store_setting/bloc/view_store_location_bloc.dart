import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/domain/usecase/view_store_location_usecase.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';

part 'view_store_location_event.dart';
part 'view_store_location_state.dart';

class ViewStoreLocationBloc extends Bloc<ViewStoreLocationEvent, ViewStoreLocationState> {
  final ViewStoreLocationUseCase _viewStoreLocationUseCase;
  ViewStoreLocationBloc({
  required ViewStoreLocationUseCase viewStoreLocationUseCase
  }) :
  _viewStoreLocationUseCase= viewStoreLocationUseCase, super(ViewStoreLocationInitial()) {
    on<ViewStoreLocationDataEvent>(_viewStoreLocationDataEvent);
    
  }

  FutureOr<void> _viewStoreLocationDataEvent(ViewStoreLocationDataEvent event, Emitter<ViewStoreLocationState> emit,) async{
    emit(ViewStoreLocationLoading());
    final viewStoreLocationResponse = await _viewStoreLocationUseCase("");
    viewStoreLocationResponse.fold(
      (onFailure) => emit(
        ViewStoreLocationFailure(
          errorMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ViewStoreLocationLoaded(
          viewStoreLocationModel: onSuccess,
        ),
      ),
    );
  }
}
