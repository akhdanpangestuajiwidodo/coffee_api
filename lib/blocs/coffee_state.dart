import 'package:coffee_api/models/coffee_model.dart';
import 'package:equatable/equatable.dart';

class CoffeeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCoffeeState extends CoffeeState {}

class LoadingCoffeeState extends CoffeeState {}

class HasDataCoffeeState extends CoffeeState {
  final List<CoffeeModel> coffeeList;

  HasDataCoffeeState(this.coffeeList);

  @override
  List<Object?> get props => [coffeeList];
}

class ErrorCoffeeState extends CoffeeState {
  final String message;

  ErrorCoffeeState(this.message);

  @override
  List<Object?> get props => [message];
}
