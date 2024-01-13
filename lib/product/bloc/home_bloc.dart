import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/models/category_model.dart';
import 'package:photo_gallery/models/most_popular_model.dart';
import 'package:photo_gallery/utils/helpers/internet_connection.dart';
import 'package:photo_gallery/utils/helpers/snackbar_helper.dart';
import 'package:photo_gallery/utils/states.dart';

import '../../di/interjection_service.dart';
import '../../network/api_client.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<MostPopular>(_onMostPopularToState);
    on<Category>(_onCategoryToState);
    on<Select>(_onSelectToState);
  }

  //Home aage data face
  void _onMostPopularToState(MostPopular event, Emitter<HomeState> emit) async {
    final connectivityResult = await InternetConnection.isConnectedToInternet();

    if (connectivityResult) {
      emit(state.copyWith(status: Status.loading, visible: true));

      final _restClient = di.get<RestClient>();
      var jsonData = await _restClient.getProductRecent();

      try {
        if (jsonData != null) {
          // emit(state.copyWith(visible: false));
          // MostPopularModel userData = MostPopularModel.fromJson(jsonData);
          List<dynamic> data = jsonData['data'];

          var popularDataList =
              await (data as List).map((e) => Datum.fromJson(e)).toList();

          emit(
            state.copyWith(
              visible: false,
              status: Status.success,
              users: popularDataList,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: Status.error,
              visible: false,
            ),
          );
        }
      } catch (e) {
        log('$e');
      }
    } else {
      SnackbarHelper.showSnackBar(
        'Internet fail',
      );

      emit(
        state.copyWith(
          status: Status.error,
          visible: false,
        ),
      );
    }
  }

  //Category data face
  void _onCategoryToState(Category event, Emitter<HomeState> emit) async {
    final connectivityResult = await InternetConnection.isConnectedToInternet();

    if (connectivityResult) {
      emit(state.copyWith(status: Status.loading, visible: true));

      final _restClient = di.get<RestClient>();

      var jsonData = await _restClient.getCollectionCategory();

      try {
        if (jsonData != null) {
          // emit(state.copyWith(visible: false));

          var categoryModels = await (jsonData as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList();

          emit(
            state.copyWith(
              visible: false,
              status: Status.success,
              categoryModels: categoryModels,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: Status.error,
              visible: false,
            ),
          );
        }
      } catch (e) {
        log('$e');
      }
    } else {
      SnackbarHelper.showSnackBar(
        'Internet fail',
      );

      emit(
        state.copyWith(
          status: Status.error,
          visible: false,
        ),
      );
    }
  }

  void _onSelectToState(Select event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        selectIndex: event.index,
      ),
    );
  }
}
