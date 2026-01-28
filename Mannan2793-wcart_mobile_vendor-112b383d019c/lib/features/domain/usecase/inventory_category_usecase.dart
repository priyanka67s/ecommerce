import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/all_category_list_model.dart';

class InventoryCategoryUseCase implements UseCase<AllCategoryListModel, String> {
  final Repository repository;

  InventoryCategoryUseCase({required this.repository});
  
  @override
  Future<Either<Failure, AllCategoryListModel>> call(String params) async{
    return await repository.getInventoryCategoryList();
  }
}