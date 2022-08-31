import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'list.dart';

@immutable
class CartModel extends Equatable {
  final ListModel _list;
  final List<int> _fruitIds;

  CartModel(this._list, CartModel previous)
      : assert(_list != null),
        _fruitIds = previous._fruitIds;

  @override
  List<Object> get props => [_list, _fruitIds];
}
