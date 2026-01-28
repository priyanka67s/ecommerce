import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/addattribute_model.dart';
import 'package:wcart_vendor/features/domain/usecase/add_attribute_usecase.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_attribute_usecase.dart';
import 'package:wcart_vendor/model/viewattribute_model.dart';
part 'manage_attribute_event.dart';
part 'manage_attribute_state.dart';

class ManageAttributeBloc
    extends Bloc<ManageAttributeEvent, ManageAttributeState> {
  final ManageAttributeUseCase _manageAttributeUseCase;
  final AddAttributeUsecase _addAttributeUsecase;
  ManageAttributeBloc(
      {required ManageAttributeUseCase manageAttributeUseCase,
      required AddAttributeUsecase addAttributeUsecase})
      : _manageAttributeUseCase = manageAttributeUseCase,
        _addAttributeUsecase = addAttributeUsecase,
        super(ManageAttributeInitial()) {
    on<GetAttributeDataEvent>(_getAttributeDataEvent);
    on<EditAttributeEvent>(_editAttributeEvent);
    on<ClearAttributeEvent>(_clearAttributeEvent);
    on<AddAttributeEvent>(_addAttributeEvent);
  }

  FutureOr<void> _getAttributeDataEvent(
      GetAttributeDataEvent event, Emitter<ManageAttributeState> emit) async {
    if (event.isLoading == true) {
      emit(ManageAttributeLoading());
    }

    final manageAttributeResponse = await _manageAttributeUseCase("");
    manageAttributeResponse.fold(
      (onFailure) => emit(
        ManageAttributeFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ManageAttributeLoaded(
          manageAttributeModel: onSuccess,
        ),
      ),
    );
  }

  FutureOr<void> _editAttributeEvent(
      EditAttributeEvent event, Emitter<ManageAttributeState> emit) {
    emit(
      AttributeEditedState(
        attributeName: event.attributes.attributename ?? '',
        attributeSlug: event.attributes.attributeslug ?? '',
        selectedIndex: event.selectedIndex,
      ),
    );
  }

  FutureOr<void> _clearAttributeEvent(
      ClearAttributeEvent event, Emitter<ManageAttributeState> emit) async {
    emit(AttributeClearedState());
  }

  FutureOr<void> _addAttributeEvent(
      AddAttributeEvent event, Emitter<ManageAttributeState> emit) async {
    emit(ManageAttributeLoading());
    final manageAttributeResponse = await _addAttributeUsecase(
        AddAttributeUseCaseParams(
            attributeName: event.attributeName, id: event.id));
    manageAttributeResponse.fold(
      (onFailure) => emit(
        ManageAttributeFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        AddAttributeLoadedState(
          addAttributeModel: onSuccess,
        ),
      ),
    );
  }
}
