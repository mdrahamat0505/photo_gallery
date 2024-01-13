import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'di/interjection_service.dart' as dio;

// import 'di/interjection_service.dart' as dio;
import 'register_app.dart';

void main() async {
  dio.setupDio();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => ScreenUtilInit(
              designSize: const Size(360, 640),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return const RegisterApp();
              }) // Wrap your app
          ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
