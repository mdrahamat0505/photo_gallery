import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/product/bloc/home_bloc.dart';

import 'routes.dart';
import 'utils/helpers/nevigation_helper.dart';
import 'utils/helpers/snackbar_helper.dart';
import 'values/app_routes.dart';
import 'values/app_strings.dart';
import 'values/app_theme.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.loginAndRegister,
        theme: AppTheme.themeData,
        initialRoute: AppRoutes.homeScreen,
        scaffoldMessengerKey: SnackbarHelper.key,
        navigatorKey: NavigationHelper.key,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
