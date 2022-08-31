import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Fruit extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int price = 15;

  Fruit(this.id, this.name, this.image);

  @override
  List get props => [id, name, image, price];
}
