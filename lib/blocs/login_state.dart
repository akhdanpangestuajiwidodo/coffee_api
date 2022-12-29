import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLogin;

  LoginState(this.isLogin);

  @override
  List<Object?> get props => [];
}

class InitialLoginState extends LoginState {
  InitialLoginState():super(false);
}

class AddPinLoginState extends LoginState {
  AddPinLoginState(isLogin):super(isLogin);
}