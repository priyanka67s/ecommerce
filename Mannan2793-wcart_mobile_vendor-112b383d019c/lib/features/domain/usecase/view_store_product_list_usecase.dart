import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/storebasedproduct_model.dart';

class ViewStoreProductListUseCase
    implements
        UseCase<StoreBasedProductModel, ViewStoreProductListUseCaseParams> {
  final Repository repository;

  ViewStoreProductListUseCase({required this.repository});

  @override
  Future<Either<Failure, StoreBasedProductModel>> call(
      ViewStoreProductListUseCaseParams params) async {
    return await repository.viewStoreProductList(
      filter: params.filter,
      filterBy: params.filterBy,
      order: params.order,
      orderby: params.orderby,
      storeLocationId: params.storeLocationId,
    );
  }
}

class ViewStoreProductListUseCaseParams {
  final String? filter;
  final String? filterBy;
  final String? order;
  final String? orderby;
  final int? storeLocationId;

  ViewStoreProductListUseCaseParams({
    required this.filter,
    required this.filterBy,
    required this.order,
    required this.orderby,
    required this.storeLocationId,
  });
}
