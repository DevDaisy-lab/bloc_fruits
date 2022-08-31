import 'package:flutter/material.dart';

import '/models/fruit.dart';

import 'add_button.dart';

class MyListFruit extends StatelessWidget {
  final Fruit fruit;

  const MyListFruit(this.fruit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme2 = Theme.of(context).textTheme.headline2;
    return SizedBox(
      height: 90,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo),
                ),
                child: Image.asset(
                  fruit.image!,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 80,
                child: Text(
                  fruit.name!,
                  style: textTheme2,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              AddButton(fruit: fruit),
            ],
          ),
        ),
      ),
    );
  }
}
