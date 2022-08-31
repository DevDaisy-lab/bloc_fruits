import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocfruits/bloc/cart_bloc.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme4 = Theme.of(context).textTheme.headline4;

    //BlocBuilder is a Flutter widget which requires a Bloc and a builder function.
    // BlocBuilder handles building the widget in response to new states.
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return ListView.builder(
            itemCount: state.fruits.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: Text(
                state.fruits[index].name!,
                style: textTheme4,
              ),
            ),
          );
        }
        return Text('Something went wrong!');
      },
    );
  }
}
