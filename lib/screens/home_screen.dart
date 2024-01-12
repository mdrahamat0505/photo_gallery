import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/screens/home_image.dart';
import 'package:photo_gallery/values/app_colors.dart';
import 'package:photo_gallery/values/app_theme.dart';

import 'category_image.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // backgroundColor: Colors.deepPurpleAccent,
          centerTitle: false,
          toolbarHeight: 50.h,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30.r,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width.r,
                child: TabBar(
                  //
                  // indicator: UnderlineTabIndicator(
                  //   insets: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  // ),

                  // padding: EdgeInsets.symmetric(horizontal:0),
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                  labelPadding: EdgeInsets.symmetric(horizontal: 20.0.r),
                  //labelColor: Colors.black,
                  isScrollable: true,
                  indicatorWeight: 3.w,

                  //labelPadding: EdgeInsets.only(left: 0, right: 0),
                  tabs: [
                    Tab(
                      // iconMargin:  EdgeInsets.only(bottom: 10.0.r),
                      height: 40.h,
                      child: Text(
                        'HOME',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ),
                    Tab(
                      height: 40.h,
                      child: Text(
                        'CATEGORY',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ),
                    Tab(
                      height: 40.h,
                      child: Text(
                        'FAVORITES',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Text(
            'Wallpapers',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp),
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
        drawer: Drawer(),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeProduct(),
            CategoryProduct(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
