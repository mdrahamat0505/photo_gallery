part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.message = '',
    this.visible = false,
    this.users = const [],
    this.categoryModels = const [],
  });

  final Status status;
  final String message;
  final bool visible;
  final List<Datum> users;
  final List<CategoryModel> categoryModels;

  HomeState copyWith({
    Status? status,
    String? message,
    bool? visible,
    List<Datum>? users,
    List<CategoryModel>? categoryModels,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      visible: visible ?? this.visible,
      users: users ?? this.users,
      categoryModels: categoryModels ?? this.categoryModels,
    );
  }

  @override
  List<Object?> get props => [status, message, users, visible, categoryModels];
}
