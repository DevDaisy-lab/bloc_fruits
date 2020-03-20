import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_bloc.dart';

import '../widgets/list_screen/my_app_bar.dart';
import '../widgets/list_screen/my_fruit_item.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
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
      ),
    );
  }
}
