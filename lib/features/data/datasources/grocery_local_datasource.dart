import 'dart:convert';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/features/data/model/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class GroceryLocalDataSource {
  Future<GroceryModel> getLastGrocery();
  Future<List<GroceryModel>> getLastGroceryList();
  Future<void> cacheGrocery(GroceryModel groceryToCache);
  Future<void> cacheGroceryList(List<GroceryModel> groceryListToCache);
}

const CACHED_GROCERY = 'CACHED_GROCERY';
const CACHED_GROCERY_LIST = 'CACHED_GROCERY_LIST';

class GroceryLocalDataSourceImpl implements GroceryLocalDataSource {
  final SharedPreferences sharedPreferences;

  GroceryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GroceryModel> getLastGrocery() {
    final jsonString = sharedPreferences.getString(CACHED_GROCERY);
    if (jsonString != null) {
      return Future.value(GroceryModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException("Error occurred while accessing cache.");
    }
  }

  @override
  Future<List<GroceryModel>> getLastGroceryList() {
    final jsonString = sharedPreferences.getString(CACHED_GROCERY_LIST);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return Future.value(
          jsonList.map((jsonItem) => GroceryModel.fromJson(jsonItem)).toList());
    } else {
      throw CacheException("Error occurred while accessing cache.");
    }
  }

  @override
  Future<void> cacheGrocery(GroceryModel groceryToCache) {
    return sharedPreferences.setString(
      CACHED_GROCERY,
      json.encode(groceryToCache.toJson()),
    );
  }

  @override
  Future<void> cacheGroceryList(List<GroceryModel> groceryListToCache) {
    final List<String> jsonList =
        groceryListToCache.map((grocery) => json.encode(grocery.toJson())).toList();
    return sharedPreferences.setString(CACHED_GROCERY_LIST, json.encode(jsonList));
  }
}
