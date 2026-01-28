part of 'manage_tags_bloc.dart';

@immutable
sealed class ManageTagsState {}

final class ManageTagsInitial extends ManageTagsState {}

final class ManageTagsLoading extends ManageTagsState {}
final class ManageTagsLoaded extends ManageTagsState {
  final ViewTagsModel viewTagsModel;

  ManageTagsLoaded({required this.viewTagsModel});

}
final class ManageTagsFailure extends ManageTagsState {
  final String errorMessage;

  ManageTagsFailure({required this.errorMessage});
}
