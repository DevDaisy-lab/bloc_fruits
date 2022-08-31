import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocfruits/bloc/cart_bloc.dart';

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var priceStyle = Theme.of(context).textTheme.headline4;
    var textTheme3 = Theme.of(context).textTheme.headline3;

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state is CartLoading) {
                return CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Text('\$${state.totalPrice}', style: priceStyle);
              }
              return Text('Something went wrong!');
            }),
            SizedBox(width: 25),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text(
                'BUY',
                style: textTheme3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
