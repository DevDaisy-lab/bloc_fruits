import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/list_bloc.dart';

import 'screens/my_list.dart';
import 'screens/my_cart.dart';

import './style/my_app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MyList);
    //MultiBlocProvider allows conveniently providing multiple objects.
    //MultiBlocProvider is a Flutter widget that merges multiple
    // BlocProvider widgets into one.
    return MultiBlocProvider(
      providers: [
        //BlocProvider widget, provides a ListBloc, to its children
        BlocProvider<ListBloc>(
          create: (context) => ListBloc()..add(LoadList()),
        ),
        //BlocProvider widget, provides a CartBloc,to its children
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(LoadCart()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State Management Flutter Bloc',
        theme: myAppTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyList(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
