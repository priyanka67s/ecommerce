import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/listbrand_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class ManageBrandUseCase implements UseCase<ViewBrandModel, String> {
  final Repository repository;

  ManageBrandUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ViewBrandModel>> call(String params) async{
    return await repository.getBrandsData();
  }
}