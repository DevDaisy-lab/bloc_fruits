import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/list_bloc.dart';

import 'screens/list_screen.dart';
import 'screens/cart_screen.dart';

import './style/my_app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MultiBlocProvider allows conveniently providing multiple objects.
    //MultiBlocProvider is a Flutter widget that merges multiple
    // BlocProvider widgets into one.
    return MultiBlocProvider(
      providers: [
        //BlocProvider widget, provides a MyListBloc, in this case, to its children
        BlocProvider<MyListBloc>(
          create: (context) => MyListBloc()..add(LoadMyList()),
        ),
        //BlocProvider widget, provides a CartBloc, in this case, to its children
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(LoadCart()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'State Management Bloc',
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
