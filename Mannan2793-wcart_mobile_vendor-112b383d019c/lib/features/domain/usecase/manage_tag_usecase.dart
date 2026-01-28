import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/listtags_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class ManageTagUseCase implements UseCase<ViewTagsModel, String> {
  final Repository repository;

  ManageTagUseCase({required this.repository});
  
  @override
  Future<Either<Failure, ViewTagsModel>> call(String params) async{
    return await repository.getTagsData();
  }
}