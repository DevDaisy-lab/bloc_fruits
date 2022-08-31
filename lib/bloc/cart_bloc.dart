import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/fruit.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddFruit>(_onAddFruit);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoaded());
  }

  void _onAddFruit(AddFruit event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded)
      emit(CartLoaded(
        fruits: List.from(state.fruits)..add(event.fruit),
      ));
  }

  //CartState get initialState => CartLoading();

  // Stream<CartState> mapEventToState(
  //   CartEvent event,
  // ) async* {
  //   if (event is LoadCart) {
  //     yield* _mapLoadCartToState();
  //   } else if (event is AddFruit) {
  //     yield* _mapAddFruitToState(event);
  //   }
  // }

  // Stream<CartState> _mapLoadCartToState() async* {
  //   yield CartLoading();
  //   try {
  //     await Future.delayed(Duration(seconds: 1));
  //     yield CartLoaded(fruits: []);
  //   } catch (_) {
  //     yield CartError();
  //   }
  // }

  // Stream<CartState> _mapAddFruitToState(AddFruit event) async* {
  //   final currentState = state;
  //   if (currentState is CartLoaded) {
  //     try {
  //       yield CartLoaded(
  //         fruits: List.from(currentState.fruits)..add(event.fruit),
  //       );
  //     } catch (_) {
  //       yield CartError();
  //     }
  //   }
  // }
}
