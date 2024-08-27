import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:evaluation_app/core/errors/failure.dart';
import 'package:evaluation_app/features/domain/entity/grocery.dart';
import 'package:evaluation_app/features/domain/usecase/get_all_groceries.dart';
import 'package:evaluation_app/features/domain/usecase/get_grocery.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllGroceries getAllGroceriesUseCase;
  final GetGrocery getGroceryUseCase;

  GroceryBloc({
    required this.getAllGroceriesUseCase,
    required this.getGroceryUseCase,
  }) : super(GroceryInitialState()) {
    on<LoadAllGroceriesEvent>(_onLoadAllGroceries);
    on<GetGroceryEvent>(_onGetGrocery);
  }

  Future<void> _onLoadAllGroceries(
    LoadAllGroceriesEvent event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoadingState());

    final failureOrGroceries = await getAllGroceriesUseCase();
    emit(failureOrGroceries.fold(
      (failure) => GroceryErrorState(_mapFailureToMessage(failure)),
      (groceries) => GroceriesLoadedState(groceries),
    ));
  }

  Future<void> _onGetGrocery(
    GetGroceryEvent event,
    Emitter<GroceryState> emit,
  ) async {
    emit(GroceryLoadingState());

    final Either<Failure, Grocery> failureOrGrocery =
        await getGroceryUseCase(event.groceryId);
    emit(failureOrGrocery.fold(
      (failure) => GroceryErrorState(_mapFailureToMessage(failure)),
      (grocery) => GroceryLoadedState(grocery: grocery),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    // Customize this based on your Failure types
    return 'An error occurred'; // Replace with your logic
  }
}
