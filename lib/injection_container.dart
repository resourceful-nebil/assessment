import 'dart:async';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:evaluation_app/features/data/datasources/grocery_local_datasource.dart';
import 'package:evaluation_app/features/data/datasources/grocery_remote_datasource.dart';
import 'package:evaluation_app/features/data/repository/grocery_repository_impl.dart';
import 'package:evaluation_app/features/domain/repository/grocery_repositry.dart';
import 'package:evaluation_app/features/domain/usecase/get_all_groceries.dart';
import 'package:evaluation_app/features/domain/usecase/get_grocery.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/connections/network_info.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  locator.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  locator.registerLazySingleton<http.Client>(() => http.Client());

  // Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // Grocery Data sources
  locator.registerLazySingleton<GroceryLocalDataSource>(
      () => GroceryLocalDataSourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<GroceryRemoteDataSource>(() =>
      GroceryRemoteDataSourceImpl(client: locator(), localDataSource: locator()));

  // Grocery Repository
  locator.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));

  // Grocery Use cases
  locator.registerLazySingleton<GetAllGroceries>(
      () => GetAllGroceries(locator()));
  locator.registerLazySingleton<GetGrocery>(() => GetGrocery(locator()));

  // Grocery Bloc
  locator.registerFactory<GroceryBloc>(
    () => GroceryBloc(
      getAllGroceriesUseCase: locator(),
      getGroceryUseCase: locator(),
    ),
  );
}
