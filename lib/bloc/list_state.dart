part of 'list_bloc.dart';

@immutable
abstract class ListState extends Equatable {
  const ListState();
}

class ListLoading extends ListState {
  @override
  List<Object> get props => [];
}

class ListLoaded extends ListState {
  final ListModel myList;

  const ListLoaded(this.myList);

  @override
  List<Object> get props => [myList];
}

class ListError extends ListState {
  @override
  List<Object> get props => [];
}
