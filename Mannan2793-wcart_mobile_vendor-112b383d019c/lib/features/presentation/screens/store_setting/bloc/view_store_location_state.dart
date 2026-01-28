part of 'view_store_location_bloc.dart';

@immutable
sealed class ViewStoreLocationState {}

final class ViewStoreLocationInitial extends ViewStoreLocationState {}
final class ViewStoreLocationLoading extends ViewStoreLocationState {}
final class ViewStoreLocationLoaded extends ViewStoreLocationState {
  final ViewStoreLocationModel viewStoreLocationModel;

  ViewStoreLocationLoaded({required this.viewStoreLocationModel});
}
final class ViewStoreLocationFailure extends ViewStoreLocationState {
  final String errorMessage;

  ViewStoreLocationFailure({required this.errorMessage});
}
