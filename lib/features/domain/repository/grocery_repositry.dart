import 'package:dartz/dartz.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';


abstract class GroceryRepository {
  Future<Either<Failure, Grocery>> getGrocery(String id);
  Future<Either<Failure, List<Grocery>>> getAllGroceries();
}
