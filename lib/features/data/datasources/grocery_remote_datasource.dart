import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:evaluation_app/core/errors/exception.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/features/data/datasources/grocery_local_datasource.dart';
import 'package:evaluation_app/features/data/model/grocery_model.dart';
import 'package:http/http.dart' as http;

abstract class GroceryRemoteDataSource {
  Future<GroceryModel> getGrocery(String id);
  Future<Either<Failure, List<GroceryModel>>> getAllGroceries();
}

class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;
  final GroceryLocalDataSource localDataSource;
  final baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';

  GroceryRemoteDataSourceImpl(
      {required this.client, required this.localDataSource});

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final response = await client.get(
      Uri.parse(
          'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'];
      return GroceryModel.fromJson(responseData);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<GroceryModel>>> getAllGroceries() async {
    try {
      final url = Uri.parse(baseUrl);
      final response =
          await client.get(url, headers: {'Content-Type': 'application/json'});
      print('${response.statusCode} suuuuuuuuu');
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final List<GroceryModel> products = (responseData['data'] as List)
            .map((json) => GroceryModel.fromJson(json))
            .toList();
        return Right(products);
      } else {
        return Left(ServerFailure(
            'Failed to fetch products. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(ServerFailure('An error occurred: ${e.toString()}'));
    }
  }
}
