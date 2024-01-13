part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [MostPopular, Category, Select];
}

class MostPopular extends HomeEvent {}

class Category extends HomeEvent {}

class Select extends HomeEvent {
  Select({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}
