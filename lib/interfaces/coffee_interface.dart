import 'package:coffee_api/models/coffee_model.dart';

abstract class CoffeeInterface {
  Future<List<CoffeeModel>> getCoffeeList();
}
