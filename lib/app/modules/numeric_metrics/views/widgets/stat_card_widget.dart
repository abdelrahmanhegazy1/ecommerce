import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCardWidget extends StatelessWidget {
  final String value;
  final String title;
  final Color color;
  const StatCardWidget(
      {super.key, required this.value, required this.title, this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Container(
        //height: 100.h,
        decoration: BoxDecoration(
            color: color,
            gradient: LinearGradient(colors: [color, color.withOpacity(0.3)]),
            borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lufga'),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lufga'),
            )
          ],
        ),
        ),
    );
  }
}
