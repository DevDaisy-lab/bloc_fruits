import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/list.dart';
import '../models/fruit.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListLoading()) {
    on<LoadList>(_onListLoad);
  }

  void _onListLoad(LoadList event, Emitter<ListState> emit) {
    emit(ListLoaded(ListModel()));
  }

  //ListState get initialState => ListLoading();

  // Stream<ListState> mapEventToState(
  //   ListEvent event,
  // ) async* {
  //   if (event is LoadList) {
  //     yield* _mapLoadListToState();
  //   }
  // }

  // Stream<ListState> _mapLoadListToState() async* {
  //   yield ListLoading();
  //   try {
  //     await Future.delayed(
  //       Duration(milliseconds: 500),
  //     );
  //     yield ListLoaded(
  //       ListModel(),
  //     );
  //   } catch (_) {
  //     yield ListError();
  //   }
  // }
}
