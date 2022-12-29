import 'package:coffee_api/blocs/login_bloc.dart';
import 'package:coffee_api/blocs/login_event.dart';
import 'package:coffee_api/blocs/login_state.dart';
import 'package:coffee_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state.isLogin == true) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wrong Pin'),
              ),
            );
          }
        },
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _pinController,
                              decoration: const InputDecoration(
                                hintText: 'PIN',
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null && value.length != 4
                                    ? "Should 4 number"
                                    : null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: ElevatedButton(
                                onPressed: () {
                                  _authenticatedWithPin(context);
                                },
                                child: const Text('Sign In'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }

  void _authenticatedWithPin(context) {
    if (_formKey.currentState!.validate()) {
      print('pin ${_pinController.text}');
      BlocProvider.of<LoginBloc>(context)
          .add(InputLoginEvent(int.parse(_pinController.text)));
    }
  }
}
