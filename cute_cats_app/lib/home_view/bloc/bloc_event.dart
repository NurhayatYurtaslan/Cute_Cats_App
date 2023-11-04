part of 'bloc_bloc.dart';

sealed class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

class LoadCatCoutner extends CatEvent {}

class AddCat extends CatEvent {
  final Cat cat;

  const AddCat(this.cat);

  @override
  List<Object> get props => [cat];
}

class RemoveCat extends CatEvent {
    final Cat cat;

  const RemoveCat(this.cat);

  @override
  List<Object> get props => [cat];
}