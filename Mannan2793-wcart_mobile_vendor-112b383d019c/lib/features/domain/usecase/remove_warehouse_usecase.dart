import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class RemoveWarehouseUseCase
    implements UseCase<Map<String, dynamic>, RemoveWarehouseUseCaseParams> {
  final Repository repository;

  RemoveWarehouseUseCase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
    RemoveWarehouseUseCaseParams params,
  ) async {
    return await repository.removeWarehouseData(
      warehouseId: params.warehouseId,
      index: params.index,
    );
  }
}

class RemoveWarehouseUseCaseParams {
  final String warehouseId;
  final int index;
  RemoveWarehouseUseCaseParams({
    required this.warehouseId,
    required this.index,
  });
}
