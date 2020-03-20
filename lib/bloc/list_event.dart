part of 'list_bloc.dart';

@immutable
abstract class MyListEvent extends Equatable {
  const MyListEvent();
}

class LoadMyList extends MyListEvent {
  @override
  List<Object> get props => [];
}
