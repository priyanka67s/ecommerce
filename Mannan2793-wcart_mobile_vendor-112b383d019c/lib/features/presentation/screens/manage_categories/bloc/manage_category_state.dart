part of 'manage_category_bloc.dart';

@immutable
sealed class ManageCategoryState {}

final class ManageCategoryInitial extends ManageCategoryState {}

final class ManageCategoryLoading extends ManageCategoryState {

}

final class ManageCategoryLoaded extends ManageCategoryState {
  final ListCategoryModel listCategoryModel;

  ManageCategoryLoaded({required this.listCategoryModel});  
}

final class ManageCategoryFailure extends ManageCategoryState {
  final String failureMessage;

  ManageCategoryFailure({required this.failureMessage});
}
