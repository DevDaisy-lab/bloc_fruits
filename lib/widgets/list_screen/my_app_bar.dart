import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme1 = Theme.of(context).textTheme.display4;

    return SliverAppBar(
      backgroundColor: Colors.indigo[400],
      title: Text(
        'The List of Fruits',
        style: textTheme1,
      ),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}
