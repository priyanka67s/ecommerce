import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/vieworder_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class ViewOrderUseCase implements UseCase<ViewOrderModel, String> {
  final Repository repository;

  ViewOrderUseCase({required this.repository});
  
  
  @override
  Future<Either<Failure, ViewOrderModel>> call(String params) async{
    return await repository.viewOrdersData();
  }
}