import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/viewinventory_model.dart';

class ViewInventoryProductUseCase
    implements UseCase<ViewInventoryModel, ViewInventoryProductUseCaseParams> {
  final Repository repository;

  ViewInventoryProductUseCase({required this.repository});

  @override
  Future<Either<Failure, ViewInventoryModel>> call(
      ViewInventoryProductUseCaseParams params) async {
    return await repository.viewInventoryProductList(
      filter: params.filter,
      filterBy: params.filterBy,
      order: params.order,
      orderby: params.orderby,
      storeLocationId: params.storeLocationId,
    );
  }
}

class ViewInventoryProductUseCaseParams {
  final String? filter;
  final String? filterBy;
  final String? order;
  final String? orderby;
  final int? storeLocationId;

  ViewInventoryProductUseCaseParams(
      {required this.filter,
      required this.filterBy,
      required this.order,
      required this.orderby,
      required this.storeLocationId});
}
