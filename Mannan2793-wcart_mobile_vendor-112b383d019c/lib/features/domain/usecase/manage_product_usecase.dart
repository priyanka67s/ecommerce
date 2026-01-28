import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/manageproduct_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class ManageProductUseCase implements UseCase<ManageProductModel, String> {
  final Repository repository;

  ManageProductUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ManageProductModel>> call(String params) async{
    return await repository.getManageProductData();
  }
}