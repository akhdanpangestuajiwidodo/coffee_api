import 'package:coffee_api/blocs/login_event.dart';
import 'package:coffee_api/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<InputLoginEvent>(
      (event, emit) => {
        if (event.pin == 2022)
          {emit(AddPinLoginState(true))}
        else
          {emit(AddPinLoginState(false))}
      },
    );
  }
}
