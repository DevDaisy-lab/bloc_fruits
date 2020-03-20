import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/list_model.dart';

part 'list_event.dart';
part 'list_state.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  @override
  MyListState get initialState => MyListLoading();

  @override
  Stream<MyListState> mapEventToState(
    MyListEvent event,
  ) async* {
    if (event is LoadMyList) {
      yield* _mapLoadMyListToState();
    }
  }

  Stream<MyListState> _mapLoadMyListToState() async* {
    yield MyListLoading();
    try {
      await Future.delayed(Duration(milliseconds: 500));
      yield MyListLoaded(ListModel());
    } catch (_) {
      yield MyListError();
    }
  }
}
