import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/core/usecases/auth/usecases.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/domain/repository/grocery_repositry.dart';



class GetGrocery implements UseCase<Grocery, String> {
  final GroceryRepository repository;

  GetGrocery(this.repository);

  @override
  Future<Either<Failure, Grocery>> call(String id) async {
    return await repository.getGrocery(id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
