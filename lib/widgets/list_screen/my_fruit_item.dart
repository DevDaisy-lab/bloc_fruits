import 'package:flutter/material.dart';

import 'package:blocfruits/models/fruit_skeleton.dart';

import 'my_add_button.dart';

class MyListFruit extends StatelessWidget {
  final Fruit fruit;

  const MyListFruit(this.fruit, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Image.asset(fruit.image),
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Text(fruit.name, style: textTheme),
            ),
            SizedBox(width: 25),
            AddButton(fruit: fruit),
          ],
        ),
      ),
    );
  }
}
