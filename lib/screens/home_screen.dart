import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/components/loading_list_page.dart';
import 'package:photo_gallery/product/bloc/home_bloc.dart';
import 'package:photo_gallery/screens/home_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:photo_gallery/values/app_colors.dart';

import 'category_image.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late final TabController _tabController;

  @override
  void initState() {
    context.read<HomeBloc>().add(MostPopular());
    context.read<HomeBloc>().add(Category());
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      key: _formKey,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 42.h,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 28.r,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    current.selectIndex != previous.selectIndex,
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                      onTap: (index) {
                        context.read<HomeBloc>().add(
                              Select(index: index),
                            );
                      },
                      //
                      // indicator: UnderlineTabIndicator(
                      //   insets: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      // ),

                      // padding: EdgeInsets.symmetric(horizontal:0),
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.white,
                      labelPadding: EdgeInsets.symmetric(horizontal: 18.0.r),
                      //labelColor: Colors.black,
                      isScrollable: true,
                      indicatorWeight: 3.w,
                      unselectedLabelColor: Colors.white,

                      //labelPadding: EdgeInsets.only(left: 0, right: 0),
                      tabs: [
                        Tab(
                          // iconMargin:  EdgeInsets.only(bottom: 10.0.r),
                          height: 38.h,
                          child: Text(
                            'HOME',
                            style: TextStyle(
                                color: state.selectIndex == 0
                                    ? Colors.grey
                                    : Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                        Tab(
                          height: 38.h,
                          child: Text(
                            'CATEGORY',
                            style: TextStyle(
                                color: state.selectIndex == 1
                                    ? Colors.grey
                                    : Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                        Tab(
                          height: 38.h,
                          child: Text(
                            'FAVORITES',
                            style: TextStyle(
                                color: state.selectIndex == 2
                                    ? Colors.grey
                                    : Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          title: Text(
            'Wallpapers',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp),
          ),
          // leading: new IconButton(
          //   icon: new Icon(Icons.accessibility),
          //   onPressed: () {},
          // ),

          //leadingWidth: 20,
          titleSpacing: 20.r,
          // surfaceTintColor: AppColors.appbarColor,
          backgroundColor: AppColors.appbarColor,
          //  systemOverlayStyle: SystemUiOverlayStyle(
          //    statusBarColor: AppColors.appbarColor,
          //    statusBarBrightness: Brightness.dark,
          //    statusBarIconBrightness: Brightness.dark,
          //    systemNavigationBarIconBrightness: Brightness.dark,
          //    systemNavigationBarDividerColor: Colors.grey[50],
          //    systemNavigationBarColor: Colors.grey[50],
          //  ),
        ),
        //backgroundColor: AppColors.darkestBlue,
        drawer: const Drawer(),
        body: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => current.visible != previous.visible,
          builder: (context, state) {
            return state.visible == true
                ? const Center(
                    child: LoadingListPage(),
                  )
                : TabBarView(
                    controller: _tabController,
                    children: const [
                      HomeProduct(),
                      CategoryProduct(),
                      FavoritesScreen(),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
