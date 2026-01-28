import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/activewarehouse_model.dart';

class ActiveWarehouseUseCase implements UseCase<ActiveWareHouseModel, String> {
  final Repository repository;

  ActiveWarehouseUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ActiveWareHouseModel>> call(String params) async{
    return await repository.getActiveWarehouseData();
  }
}