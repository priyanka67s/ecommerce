part of 'manage_category_bloc.dart';

@immutable
sealed class ManageCategoryEvent {}


final class GetCategoryDataEvent extends ManageCategoryEvent {}