import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';
import 'package:wcart_vendor/model/ordercounttotal_model.dart';

class TotalOrderCountUseCase
    implements UseCase<OrderCountReportModel, TotalOrderCountUseCaseParams> {
  final Repository repository;

  TotalOrderCountUseCase({required this.repository});
  @override
  Future<Either<Failure, OrderCountReportModel>> call(
      TotalOrderCountUseCaseParams params) async {
    return await repository.totalOrderCount(
      selectedPeriodCount: params.selectedPeriodCount,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class TotalOrderCountUseCaseParams {
  final String? selectedPeriodCount;
  final String? startDate;
  final String? endDate;

  TotalOrderCountUseCaseParams({
    required this.selectedPeriodCount,
    required this.startDate,
    required this.endDate,
  });
}
