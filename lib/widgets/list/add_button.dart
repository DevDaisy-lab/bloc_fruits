import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocfruits/models/fruit.dart';

import 'package:blocfruits/bloc/cart_bloc.dart';

class AddButton extends StatelessWidget {
  final Fruit fruit;

  const AddButton({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme1 = Theme.of(context).textTheme.headline1;

    //BlocBuilder is a Flutter widget which requires a Bloc and a builder function.
    //BlocBuilder handles building the widget in response to new states.
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return Platform.isIOS
              ? CupertinoButton(
                  onPressed: state.fruits.contains(fruit)
                      ? null
                      : () => BlocProvider.of<CartBloc>(context)
                          .add(AddFruit(fruit)),
                  child: state.fruits.contains(fruit)
                      ? const Icon(
                          Icons.check,
                          color: Colors.indigo,
                          semanticLabel: 'Added',
                        )
                      : Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.indigo,
                          child: Text(
                            'add fruit',
                            style: textTheme1,
                          ),
                        ),
                )
              : FlatButton(
                  onPressed: state.fruits.contains(fruit)
                      ? null

                      //BlocProvider is a Flutter widget which provides a bloc (CartBloc)
                      // to its children via BlocProvider.of<T>(context).
                      : () => BlocProvider.of<CartBloc>(context)
                          .add(AddFruit(fruit)),
                  splashColor: Theme.of(context).primaryColor,
                  child: state.fruits.contains(fruit)
                      ? Icon(Icons.check,
                          color: Colors.indigo, semanticLabel: 'Added')
                      : Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.indigo[400],
                          child: Text(
                            'add fruit',
                            style: textTheme1,
                          ),
                        ),
                );
        }
        return Text('Something went wrong!');
      },
    );
  }
}
