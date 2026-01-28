import 'package:fpdart/fpdart.dart';

import '../../../config/core/error/failure.dart';
import '../../../config/core/usecase/usercase.dart';
import '../repository/repository.dart';

class RemoveCartUseCase
    implements UseCase<Map<String, dynamic>, RemoveCartUseCaseParams> {
  final Repository repository;

  RemoveCartUseCase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      RemoveCartUseCaseParams params) async {
    return await repository.removePosCart(
      cartId: params.cartId,
      index: params.index,
      warehouseId: params.warehouseId,
      userId: params.userId,
    );
  }
}

class RemoveCartUseCaseParams {
  final String cartId;
  final int index;
  final String warehouseId;
  final String userId;

  RemoveCartUseCaseParams({
    required this.cartId,
    required this.index,
    required this.warehouseId,
    required this.userId,
  });
}
