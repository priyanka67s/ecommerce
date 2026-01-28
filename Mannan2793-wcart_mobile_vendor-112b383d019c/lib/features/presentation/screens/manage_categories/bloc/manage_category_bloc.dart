import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/features/domain/usecase/manage_category_usecase.dart';

part 'manage_category_event.dart';
part 'manage_category_state.dart';

class ManageCategoryBloc
    extends Bloc<ManageCategoryEvent, ManageCategoryState> {
  final ManageCategoryUseCase _manageCategoryUseCase;
  ManageCategoryBloc({
    required ManageCategoryUseCase manageCategoryUseCase,
  })  : _manageCategoryUseCase = manageCategoryUseCase,
        super(ManageCategoryInitial()) {
    on<GetCategoryDataEvent>(_getCategoryDataEvent);
  }

  FutureOr<void> _getCategoryDataEvent(
      GetCategoryDataEvent event, Emitter<ManageCategoryState> emit) async {
    emit(ManageCategoryLoading());
    final manageCategoryResponse = await _manageCategoryUseCase("");
    manageCategoryResponse.fold(
      (onFailure) => emit(
        ManageCategoryFailure(
          failureMessage: onFailure.message,
        ),
      ),
      (onSuccess) {
        
        emit(
        ManageCategoryLoaded(
          listCategoryModel: onSuccess,
        ),
      );
      }
       ,
    );
  }
}
