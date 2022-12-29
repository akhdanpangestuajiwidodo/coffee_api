import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InputLoginEvent extends LoginEvent {
  final int pin;

  InputLoginEvent(this.pin);

  @override
  List<Object?> get props => [];
}
