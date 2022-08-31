part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<Fruit> fruits;

  const CartLoaded({this.fruits = const <Fruit>[]});

  int get totalPrice =>
      fruits.fold(0, (total, current) => total + current.price);

  @override
  List<Object> get props => [fruits];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
