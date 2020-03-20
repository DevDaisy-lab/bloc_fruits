import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/fruit_skeleton.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => CartLoading();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is LoadCart) {
      yield* _mapLoadCartToState();
    } else if (event is AddFruit) {
      yield* _mapAddFruitToState(event);
    }
  }

  Stream<CartState> _mapLoadCartToState() async* {
    yield CartLoading();
    try {
      await Future.delayed(Duration(seconds: 1));
      yield CartLoaded(fruits: []);
    } catch (_) {
      yield CartError();
    }
  }

  Stream<CartState> _mapAddFruitToState(AddFruit event) async* {
    final currentState = state;
    if (currentState is CartLoaded) {
      try {
        yield CartLoaded(
          fruits: List.from(currentState.fruits)..add(event.fruit),
        );
      } catch (_) {
        yield CartError();
      }
    }
  }
}
