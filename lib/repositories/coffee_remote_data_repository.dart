import 'dart:convert';

import 'package:coffee_api/interfaces/coffee_interface.dart';
import 'package:coffee_api/models/coffee_model.dart';
import 'package:http/http.dart' as http;

class CoffeeRemoteDataRepository implements CoffeeInterface {
  static const BASE_URL = 'https://api.sampleapis.com/coffee/hot';

  @override
  Future<List<CoffeeModel>?> getCoffeeList() async {
    final result = await http.get(Uri.parse(BASE_URL));
    if (result.statusCode == 200) {
      List resultItems = json.decode(result.body);
      return resultItems.map((coffee) => CoffeeModel.fromJson(coffee)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
