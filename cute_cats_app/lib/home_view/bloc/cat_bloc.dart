// ignore: depend_on_referenced_packages
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:cute_cats_app/home_view/cat_view.dart';
import 'package:equatable/equatable.dart';
part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatBloc() : super(CatInitial()) {
    on<LoadCatCoutner>((event, emit) async {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      emit(const CatLoaded(cats: <Cat>[]));
    });
    on<AddCat>((event, emit) {
      if (state is CatLoaded) {
        final state = this.state as CatLoaded;
        emit(CatLoaded(cats: List.from(state.cats)..add(event.cat)));
      }
    });
    on<RemoveCat>((event, emit) {
      if (state is CatLoaded) {
        final state = this.state as CatLoaded;
        emit(CatLoaded(cats: List.from(state.cats)..remove(event.cat)));
      }
    });
  }
}
