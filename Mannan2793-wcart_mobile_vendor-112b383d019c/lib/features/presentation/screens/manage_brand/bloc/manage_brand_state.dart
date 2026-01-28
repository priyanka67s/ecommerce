part of 'manage_brand_bloc.dart';

@immutable
sealed class ManageBrandState {}

final class ManageBrandInitial extends ManageBrandState {}
final class ManageBrandLoading extends ManageBrandState {}
final class ManageBrandLoaded extends ManageBrandState {
  final ViewBrandModel viewBrandModel;

  ManageBrandLoaded({required this.viewBrandModel});
}
final class ManageBrandFailure extends ManageBrandState {
  final String errorMessage;

  ManageBrandFailure({required this.errorMessage});
}
