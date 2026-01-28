import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

import '../../../model/viewattribute_model.dart';

class ManageAttributeUseCase implements UseCase<ViewAttributesModel, String> {
  final Repository repository;
  ManageAttributeUseCase({required this.repository});
  @override
  Future<Either<Failure, ViewAttributesModel>> call(String params) async {
    return await repository.getAttributesModel();
  }
}
