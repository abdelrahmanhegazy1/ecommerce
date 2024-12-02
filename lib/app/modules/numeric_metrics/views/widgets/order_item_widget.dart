import 'package:ecommerce_stats/app/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;
  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.h),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.r,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            order.buyer,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Lufga',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: order.status == 'ORDERED'
                                ? Colors.green.withOpacity(0.5)
                                : order.status == 'DELIVERED'
                                    ? Colors.yellow.withOpacity(0.5)
                                    : Colors.red.withOpacity(0.5),
                          ),
                          child: Text(
                            order.status.capitalizeFirst!,
                            style: TextStyle(fontSize: 12.sp,fontFamily: 'Lufga',),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      order.price,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          fontFamily: 'Lufga',
                          decorationThickness: 10,
                          decorationColor: Colors.red.withOpacity(0.2)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(order.registered)
                  ],
                ),
              )
            ],
          ),
        ),
        PositionedDirectional(
          top: 0,
          start: 0,
          bottom: 0,
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(order.picture), fit: BoxFit.fitHeight),
                      borderRadius: BorderRadius.circular(48.r)),
                ),
              ),
              const Spacer()
            ],
          ),
        )
      ],
    );
  }
}
