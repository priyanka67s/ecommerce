import 'package:fpdart/fpdart.dart';

import '../../../config/core/error/failure.dart';
import '../../../config/core/usecase/usercase.dart';
import '../repository/repository.dart';

class UpdatePosCartUsecase implements UseCase<Map<String, dynamic>, UpdatePosCartUseCaseParams> {
  final Repository repository;

  UpdatePosCartUsecase({required this.repository});
  
  @override
  Future<Either<Failure, Map<String, dynamic>>> call(UpdatePosCartUseCaseParams params) async {
    return await repository.updatePosCart(quantity: params.quantity, cartId: params.cartId, warehouseId: params.warehouseId, userId: params.userId);
  }
}

class UpdatePosCartUseCaseParams {
  final String quantity;
  final String cartId;
  final String warehouseId;
  final String userId;

  UpdatePosCartUseCaseParams({required this.quantity, required this.cartId, required this.warehouseId, required this.userId});
  
}
