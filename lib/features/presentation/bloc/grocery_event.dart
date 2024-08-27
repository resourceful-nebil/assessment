import 'package:equatable/equatable.dart';

abstract class GroceryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAllGroceriesEvent extends GroceryEvent {}

class GetGroceryEvent extends GroceryEvent {
  final String groceryId;

  GetGroceryEvent({required this.groceryId});

  @override
  List<Object?> get props => [groceryId];
}
