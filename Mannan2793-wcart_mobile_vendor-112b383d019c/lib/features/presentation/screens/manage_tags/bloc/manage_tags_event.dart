part of 'manage_tags_bloc.dart';

@immutable
sealed class ManageTagsEvent {}


final class GetTagsDataEvent extends ManageTagsEvent {}