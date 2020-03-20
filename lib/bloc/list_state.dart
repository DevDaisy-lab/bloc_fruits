part of 'list_bloc.dart';

@immutable
abstract class MyListState extends Equatable {
  const MyListState();
}

class MyListLoading extends MyListState {
  @override
  List<Object> get props => [];
}

class MyListLoaded extends MyListState {
  final ListModel myList;

  const MyListLoaded(this.myList);

  @override
  List<Object> get props => [myList];
}

class MyListError extends MyListState {
  @override
  List<Object> get props => [];
}
