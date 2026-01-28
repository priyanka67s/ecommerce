import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/listbrand_model.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_brand_usecase.dart';

part 'manage_brand_event.dart';
part 'manage_brand_state.dart';

class ManageBrandBloc extends Bloc<ManageBrandEvent, ManageBrandState> {
  final ManageBrandUseCase _manageBrandUseCase;
  ManageBrandBloc({
    required ManageBrandUseCase manageBrandUseCase,
  })  : _manageBrandUseCase = manageBrandUseCase,
        super(ManageBrandInitial()) {
    on<GetManageBrandEvent>(_getManageBrandEvent);
  }

  FutureOr<void> _getManageBrandEvent(
    GetManageBrandEvent event,
    Emitter<ManageBrandState> emit,
  ) async {
    emit(ManageBrandLoading());
    final manageBrandResponse = await _manageBrandUseCase("");
    manageBrandResponse.fold(
      (onFailure) => emit(
        ManageBrandFailure(
          errorMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ManageBrandLoaded(
          viewBrandModel: onSuccess,
        ),
      ),
    );
  }
}
