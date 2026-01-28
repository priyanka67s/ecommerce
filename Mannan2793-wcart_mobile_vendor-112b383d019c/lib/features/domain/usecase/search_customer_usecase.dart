import 'package:fpdart/fpdart.dart';
import 'package:wcart_vendor/config/core/error/failure.dart';
import 'package:wcart_vendor/config/core/usecase/usercase.dart';
import 'package:wcart_vendor/features/data/model/searchcustomer_model.dart';
import 'package:wcart_vendor/features/domain/repository/repository.dart';

class SearchCustomerUseCase implements UseCase<SearchCustomersModel, String> {
  final Repository repository;

  SearchCustomerUseCase({required this.repository});
  
  @override
  Future<Either<Failure, SearchCustomersModel>> call(String params) async{
    return await repository.searchCustomer(searchQuery: params);
  }
}