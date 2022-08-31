import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_bloc.dart';

import '../widgets/list/fruit_item.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme4 = Theme.of(context).textTheme.headline4;
    final pageBody = CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        // BlocBuilder is a Flutter widget which requires
        // a Bloc and a builder function.
        // BlocBuilder handles building the widget in response to new states.
        BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ListLoaded) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => MyListFruit(
                    state.myList.getByPosition(index),
                  ),
                ),
              );
            }
            return Text('Something went wrong!');
          },
        ),
      ],
    );

    final myAppBar = AppBar(
      backgroundColor: Colors.indigo,
      title: Text(
        'The List of Fruits',
        style: textTheme4,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );

    final cupertinoAppbar = CupertinoNavigationBar(
      backgroundColor: Colors.indigoAccent,
      middle: const Text(
        'The List of Fruits',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      trailing: GestureDetector(
        child: const Icon(
          CupertinoIcons.shopping_cart,
          color: Colors.white,
        ),
        onTap: () => Navigator.pushNamed(context, '/cart'),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: cupertinoAppbar,
            child: pageBody,
          )
        : Scaffold(
            body: pageBody,
            appBar: myAppBar,
          );
  }
}
