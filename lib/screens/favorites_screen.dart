import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'FAVORITES SCREEN',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28.sp),
      ),
    );
  }
}
