import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/list_model.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  @override
  ListState get initialState => ListLoading();

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    if (event is LoadList) {
      yield* _mapLoadListToState();
    }
  }

  Stream<ListState> _mapLoadListToState() async* {
    yield ListLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500));
      yield ListLoaded(ListModel());
    } catch (_) {
      yield ListError();
    }
  }
}
