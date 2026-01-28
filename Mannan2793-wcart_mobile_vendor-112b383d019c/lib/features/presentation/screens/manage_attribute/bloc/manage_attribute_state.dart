part of 'manage_attribute_bloc.dart';

@immutable
sealed class ManageAttributeState {}

final class ManageAttributeInitial extends ManageAttributeState {}

final class ManageAttributeLoaded extends ManageAttributeState {
  final ViewAttributesModel manageAttributeModel;

  ManageAttributeLoaded({required this.manageAttributeModel});  
}

final class ManageAttributeLoading extends ManageAttributeState {}

final class ManageAttributeFailure extends ManageAttributeState {
  final String failureMessage;

  ManageAttributeFailure({required this.failureMessage});
}

final class AttributeEditedState extends ManageAttributeState {
  final String attributeName;
  final String attributeSlug;
  final int selectedIndex;

  AttributeEditedState({
    required this.attributeName,
    required this.attributeSlug,
    required this.selectedIndex,
  });
}

final class AttributeClearedState extends ManageAttributeState {}

//! add attribute State
final class AddAttributeLoadedState extends ManageAttributeState {
  final AddAttributeModel addAttributeModel;

  AddAttributeLoadedState({required this.addAttributeModel});
}
