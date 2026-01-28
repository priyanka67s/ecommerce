import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class AddToCartPosUseCase
    implements UseCase<Map<String, dynamic>, AddToCartPosUseCaseParams> {
  final Repository repository;

  AddToCartPosUseCase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      AddToCartPosUseCaseParams params) async {
    return await repository.addToPOSCart(
      productId: params.productId,
      attribute: params.attribute,
      warehouseId: params.warehouseId,
      skucode: params.skucode,
      storeid: params.storeid,
      userId: params.userId,
    );
  }
}

class AddToCartPosUseCaseParams {
  final String productId;
  final String attribute;
  final String warehouseId;
  final String skucode;
  final String storeid;
  final String userId;

  AddToCartPosUseCaseParams({
    required this.productId,
    required this.attribute,
    required this.warehouseId,
    required this.skucode,
    required this.storeid,
    required this.userId,
  });
}
