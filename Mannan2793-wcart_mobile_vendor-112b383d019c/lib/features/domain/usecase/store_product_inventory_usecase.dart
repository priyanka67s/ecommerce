import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/allstoreproductinventory_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class StoreProductInventoryUseCase
    implements
        UseCase<AllStoreProductInventoryModel,
            StoreProductInventoryUseCaseParams> {
  final Repository repository;

  StoreProductInventoryUseCase({required this.repository});

  @override
  Future<Either<Failure, AllStoreProductInventoryModel>> call(
      StoreProductInventoryUseCaseParams params) async {
    return await repository.getAllStoreProductInventoryData(
      warehouseId: params.warehouseId,
      categoryId: params.categoryId,
    );
  }
}

class StoreProductInventoryUseCaseParams {
  final String warehouseId;
  final String categoryId;

  StoreProductInventoryUseCaseParams({
    required this.warehouseId,
    required this.categoryId,
  });
}
