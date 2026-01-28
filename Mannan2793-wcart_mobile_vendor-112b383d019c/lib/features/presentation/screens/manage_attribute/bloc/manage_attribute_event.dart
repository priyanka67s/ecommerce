part of 'manage_attribute_bloc.dart';

@immutable
sealed class ManageAttributeEvent {}

final class GetAttributeDataEvent extends ManageAttributeEvent {
  final bool isLoading;

  GetAttributeDataEvent({required this.isLoading});
}

final class EditAttributeEvent extends ManageAttributeEvent {
  final Attributes attributes;
  final int selectedIndex;

  EditAttributeEvent({required this.attributes, required this.selectedIndex});
}

final class ClearAttributeEvent extends ManageAttributeEvent {}

final class AddAttributeEvent extends ManageAttributeEvent {
  final String attributeName;
  final String? id;

  AddAttributeEvent({required this.attributeName, this.id});
}
