import 'package:coffee_api/blocs/coffe_event.dart';
import 'package:coffee_api/blocs/coffee_bloc.dart';
import 'package:coffee_api/repositories/coffee_remote_data_repository.dart';
import 'package:coffee_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(
            create: (BuildContext context) =>
                CoffeeBloc(CoffeeRemoteDataRepository())..add(GetCoffeEvent())),
      ],
      child: MaterialApp(
        title: 'Coffee Api',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        routes: _router,
      ),
    );
  }

  Map<String, WidgetBuilder> get _router => {
        HomeScreen.routeName: (_) => const HomeScreen(),
      };
}
