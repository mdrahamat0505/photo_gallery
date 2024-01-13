import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/utils/const_string.dart';
import 'package:photo_gallery/utils/size_utils.dart';
import 'package:photo_gallery/widget/product_image_card.dart';

import '../product/bloc/home_bloc.dart';
import '../utils/states.dart';
import '../widget/custom_toast.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;
    final double itemHeight = 138.h;
    final double itemWidth = 65.w;

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current.status != previous.status || current.users != previous.users,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: RefreshIndicator(
            displacement: 250,
            // backgroundColor: Colors.white,
            // color: Colors.green,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 1000));
              log('Test');
              context.read<HomeBloc>().add(MostPopular());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.r),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.users.length,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: itemWidth / itemHeight,
                        crossAxisSpacing: 10.r,
                        mainAxisSpacing: 10.r,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var img =
                            "${ConstString.productImageDir}${state.users[index].photo}";
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
