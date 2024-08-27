import 'package:equatable/equatable.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';

abstract class GroceryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroceryInitialState extends GroceryState {}

class GroceryLoadingState extends GroceryState {}

class GroceriesLoadedState extends GroceryState {
  final List<Grocery> groceries;

  GroceriesLoadedState(this.groceries);

  @override
  List<Object?> get props => [groceries];
}

class GroceryLoadedState extends GroceryState {
  final Grocery grocery;

  GroceryLoadedState({required this.grocery});

  @override
  List<Object?> get props => [grocery];
}

class GroceryErrorState extends GroceryState {
  final String message;

  GroceryErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
