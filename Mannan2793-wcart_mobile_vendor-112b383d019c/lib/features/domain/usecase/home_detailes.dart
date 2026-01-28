import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/home_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class GetHomePageDataUseCase implements UseCase<VendorModel, String> {
  final Repository repository;
  GetHomePageDataUseCase(this.repository);
  @override
  Future<Either<Failure, VendorModel>> call(String params) async{
    return await repository.getHomePageData();
  }
}