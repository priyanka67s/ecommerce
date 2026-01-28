import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/addattribute_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class AddAttributeUsecase implements UseCase<AddAttributeModel, AddAttributeUseCaseParams> {
  final Repository repository;
  AddAttributeUsecase({required this.repository});
  @override
  Future<Either<Failure, AddAttributeModel>> call(AddAttributeUseCaseParams params) async{
    return await repository.addAttributeData(params.attributeName, params.id);
  }
}

class AddAttributeUseCaseParams{
final String attributeName;
final String? id;

AddAttributeUseCaseParams({required this.attributeName, this.id});
}