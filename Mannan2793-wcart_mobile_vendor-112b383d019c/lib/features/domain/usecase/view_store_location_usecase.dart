import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/viewstorelocation_model.dart';

class ViewStoreLocationUseCase implements UseCase<ViewStoreLocationModel, String> {
  final Repository repository;

  ViewStoreLocationUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ViewStoreLocationModel>> call(String params) async{
    return await repository.viewStoreLocationData();
  }
}