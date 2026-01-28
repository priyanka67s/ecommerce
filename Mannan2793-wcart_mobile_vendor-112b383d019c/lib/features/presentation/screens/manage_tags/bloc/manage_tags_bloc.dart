import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_tag_usecase.dart';

part 'manage_tags_event.dart';
part 'manage_tags_state.dart';

class ManageTagsBloc extends Bloc<ManageTagsEvent, ManageTagsState> {
  final ManageTagUseCase _manageTagUseCase;
  ManageTagsBloc({required ManageTagUseCase manageTagUseCase})
      : _manageTagUseCase = manageTagUseCase,
        super(ManageTagsInitial()) {
    on<GetTagsDataEvent>(_getTagDataEvent);
  }

  FutureOr<void> _getTagDataEvent(
    GetTagsDataEvent event,
    Emitter<ManageTagsState> emit,
  ) async {
    emit(ManageTagsLoading());
    final manageTagsResponse = await _manageTagUseCase("");
    manageTagsResponse.fold(
      (onFailure) => emit(
        ManageTagsFailure(
          errorMessage: onFailure.message,
        ),
      ),
      (onSuccess) => emit(
        ManageTagsLoaded(
          viewTagsModel: onSuccess,
        ),
      ),
    );
  }
}
