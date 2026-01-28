import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';

import '../../../config/core/error/failure.dart';
import '../../data/model/viewcartpos_model.dart';
import '../repository/repository.dart';

class ViewCartUseCase implements UseCase<ViewCartPosModel, ViewCartUseCaseParams> {
  final Repository repository;

  ViewCartUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ViewCartPosModel>> call(ViewCartUseCaseParams params) async{
    return await repository.viewCartData(warehouseId: params.warehouseId, userId: params.userId);
  }
}
final class ViewCartUseCaseParams {
  final String warehouseId;
  final String userId;
  ViewCartUseCaseParams({required this.warehouseId, required this.userId,});
}