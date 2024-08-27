import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:evaluation_app/core/connections/network_info.dart';
import 'package:evaluation_app/core/errors/exception.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/features/data/datasources/grocery_local_datasource.dart';
import 'package:evaluation_app/features/data/datasources/grocery_remote_datasource.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/domain/repository/grocery_repositry.dart';


class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;
  final GroceryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GroceryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Grocery>> getGrocery(String id) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected == true) {
      try {
        final remoteGrocery = await remoteDataSource.getGrocery(id);
        localDataSource.cacheGrocery(remoteGrocery);
        return Right(remoteGrocery);
      } on ServerException {
        return Left(ServerFailure("Error occurred while communicating with the server."));
      }
    } else {
      try {
        final localGrocery = await localDataSource.getLastGrocery();
        return Right(localGrocery);
      } on CacheException {
        return Left(ServerFailure("Error occurred while communicating with the server."));
      }
    }
  }

  @override
  Future<Either<Failure, List<Grocery>>> getAllGroceries() async {
        final isConnected = await networkInfo.isConnected;
    if (isConnected == true) {
      try {
        final result = await remoteDataSource.getAllGroceries();
        return result.fold(
          (failure) => left(failure),
          (models) => right(models.map((model) => model.toEntity()).toList()),
        );
      } on ServerException {
        return const Left(ServerFailure('An error has occurred'));
      } on SocketException {
        return const Left(
            ConnectionFailure('Failed to connect with the internet.'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection.'));
    }
  }
}
