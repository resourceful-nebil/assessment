import 'package:dartz/dartz.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/core/usecases/auth/usecases.dart';
import 'package:evaluation_app/core/usecases/no_param_use_cases.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/domain/repository/grocery_repositry.dart';

class GetAllGroceries
    implements NoParamsUseCase<Future<Either<Failure, List<Grocery>>>> {
  final GroceryRepository repository;

  GetAllGroceries(this.repository);

  @override
  Future<Either<Failure, List<Grocery>>> call() async {
    return await repository.getAllGroceries();
  }
}
