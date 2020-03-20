import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocfruits/models/fruit_skeleton.dart';

import 'package:blocfruits/bloc/cart_bloc.dart';

class AddButton extends StatelessWidget {
  final Fruit fruit;

  const AddButton({Key key, @required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.display2;

    //BlocBuilder is a Flutter widget which requires a Bloc and a builder function.
    //BlocBuilder handles building the widget in response to new states.
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return FlatButton(
            onPressed: state.fruits.contains(fruit)
                ? null

                //BlocProvider is a Flutter widget which provides a bloc (CartBloc)
                // to its children via BlocProvider.of<T>(context).
                : () => BlocProvider.of<CartBloc>(context).add(AddFruit(fruit)),
            splashColor: Theme.of(context).primaryColor,
            child: state.fruits.contains(fruit)
                ? Icon(Icons.check, semanticLabel: 'Added')
                : Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.indigo[400],
                    child: Text(
                      'add fruit',
                      style: textTheme,
                    ),
                  ),
          );
        }
        return Text('Something went wrong!');
      },
    );
  }
}
