part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddFruit extends CartEvent {
  final Fruit fruit;

  const AddFruit(this.fruit);

  @override
  List<Object> get props => [fruit];
}
