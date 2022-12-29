import 'package:coffee_api/blocs/coffe_event.dart';
import 'package:coffee_api/blocs/coffee_state.dart';
import 'package:coffee_api/models/coffee_model.dart';
import 'package:coffee_api/repositories/coffee_remote_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeRemoteDataRepository _coffeeRemoteDataRepository;
  CoffeeBloc(this._coffeeRemoteDataRepository):super(InitialCoffeeState()) {
    on<GetCoffeEvent>((event, emit) async{
     try{
       final result = await _coffeeRemoteDataRepository.getCoffeeList();
       if(result == null) {
         emit(ErrorCoffeeState('No Has Data'));
       }else{
         emit(HasDataCoffeeState(result));
       }
      }catch(e){
        emit(ErrorCoffeeState(e.toString()));
      }
    });
  }
}