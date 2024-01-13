import 'package:dio/dio.dart';

import '../network/api_client.dart';
import '../services/local_storage.dart';
import '../services/local_storage_imple.dart';
import '../utils/const_string.dart';
import 'interjection_service.dart';

Future<void> popularProductModule() async {
  di.registerLazySingleton<LocalStorage>(() => LocalStorageImple());
  // final local = GetStorage();
  // final _localStorage = di.get<LocalStorage>();
  // String? token = _localStorage.getToken();

  di.registerLazySingleton<RestClient>(
    () => RestClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: "https://wallpaper71.coder71.com/api/",
        ),
      ),
    ),
  );
}
