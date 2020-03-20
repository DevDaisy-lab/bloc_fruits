part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();
}

class LoadList extends ListEvent {
  @override
  List<Object> get props => [];
}
