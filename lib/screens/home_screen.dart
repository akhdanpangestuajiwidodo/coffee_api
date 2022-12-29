import 'package:coffee_api/blocs/coffee_bloc.dart';
import 'package:coffee_api/blocs/coffee_state.dart';
import 'package:coffee_api/widgets/card_coffee_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          if (state is LoadingCoffeeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HasDataCoffeeState) {
            state.coffeeList.sort((a,b) => a.id.compareTo(b.id));
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return CardCoffeeWidget(state.coffeeList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: state.coffeeList.length,
            );
          }
          if (state is ErrorCoffeeState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
