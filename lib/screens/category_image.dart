import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_gallery/product/bloc/home_bloc.dart';
import 'package:photo_gallery/utils/const_string.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({super.key});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    final double itemHeight = 48.h;
    final double itemWidth = 108.w;

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current.status != previous.status ||
          current.categoryModels != previous.categoryModels,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Most Popular',   style: TextStyle(
                //   color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18, ),),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.r),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.categoryModels.length,
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: itemWidth / itemHeight,
                      crossAxisSpacing: 5.r,
                      mainAxisSpacing: 5.r,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var _img =
                          "${ConstString.collectionsImageDir}${state.categoryModels[index].cover_photo}";
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.network(
                          _img,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
