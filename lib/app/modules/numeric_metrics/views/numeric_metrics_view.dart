import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/numeric_metrics_controller.dart';
import 'widgets/order_item_widget.dart';
import 'widgets/stat_card_widget.dart';

class NumericMetricsView extends GetView<NumericMetricsController> {
  const NumericMetricsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Numeric Metrics',
          style: TextStyle(fontFamily: 'Lufga'),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
      ),
      body: controller.obx((orders) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: StatCardWidget(
                          title: 'Average Price',
                          value: controller.average,
                          color: Colors.red[800]!,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: StatCardWidget(
                          title: 'Total Orders',
                          value: controller.orders.length.toString(),
                          color: Colors.green[700]!,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  StatCardWidget(
                    title: 'Number Of Returned',
                    value: controller.numberOfReturned.toString(),
                    color: Colors.blue[600]!,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Graph Insights',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Lufga'),
              ),
              SizedBox(
                height: 8.h,
              ),
              Bounceable(
                onTap: () {
                  controller.navigateToGraphMetrics();
                },
                child: Container(
                  width: Get.width,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            FadeInImage(
                              image: AssetImage('assets/images/graph.png'),
                              placeholder: AssetImage('assets/images/graph.png'),
                              height: 40.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Flexible(
                              child: Text(
                                'Visualize orders by year, month, or day💰',
                                style: TextStyle(
                                  fontFamily: 'Lufga',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'View Now',
                            style: TextStyle(
                                fontFamily: 'Lufga',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blue,
                            size: 15.r,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'My Orders',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Lufga'),
              ),
              SizedBox(
                height: 8.h,
              ),
              Expanded(
                child: FadeInUp(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: orders?.length ?? 0,
                    itemBuilder: (context, index) {
                      return OrderItemWidget(
                        order: orders![index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
