import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/listcategory_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class ManageCategoryUseCase implements UseCase<ListCategoryModel, String> {
  final Repository repository;
  ManageCategoryUseCase({required this.repository});
  @override
  Future<Either<Failure, ListCategoryModel>> call(String params) async{
    return await repository.getCategoryData();
  }
}