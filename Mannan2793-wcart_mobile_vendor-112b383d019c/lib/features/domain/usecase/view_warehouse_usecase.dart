import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/viewwarehouse_model.dart';

class ViewWarehouseUsCase implements UseCase<ViewWarehouseModel, String> {
  final Repository repository;

  ViewWarehouseUsCase({required this.repository});

  
  
  @override
  Future<Either<Failure, ViewWarehouseModel>> call(String params) async{
    return await repository.viewWarehouseModel();
  }
}