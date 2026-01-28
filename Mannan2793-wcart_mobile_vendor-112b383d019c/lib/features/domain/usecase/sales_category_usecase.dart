import 'package:fpdart/fpdart.dart';

import '../../../config/core/error/failure.dart';
import '../../../config/core/usecase/usercase.dart';
import '../../../model/vendorsales_category_model.dart';
import '../repository/repository.dart';

class SalesCategoryUseCase
    implements UseCase<VendorSalesByCategoryModel, SalesCategoryUseCaseParams> {
  final Repository repository;

  SalesCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, VendorSalesByCategoryModel>> call(
      SalesCategoryUseCaseParams params) async {
    return await repository.salesByCategoryReport(
        selectedPeriodCount: params.selectedPeriodCount,
        startDate: params.startDate,
        endDate: params.endDate);
  }
}

class SalesCategoryUseCaseParams {
  final String? selectedPeriodCount;
  final String? startDate;
  final String? endDate;

  SalesCategoryUseCaseParams({
    required this.selectedPeriodCount,
    required this.startDate,
    required this.endDate,
  });
}
