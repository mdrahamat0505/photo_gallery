part of 'home_bloc.dart';




class HomeEvent extends Equatable {


   @override
   List<Object?> get props => [MostPopular,Category];
 }

class MostPopular extends HomeEvent {}
class Category extends HomeEvent {}