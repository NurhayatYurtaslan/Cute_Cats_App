part of 'cat_bloc.dart';

sealed class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

//CatInitial
class CatInitial extends CatState {}

//CatLoaded
class CatLoaded extends CatState {

  final List<Cat> cats;

  const CatLoaded({required this.cats});

  @override
  List<Object> get props => [cats];
}

