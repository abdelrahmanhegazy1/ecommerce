import 'package:ecommerce_stats/app/data/models/graph_model.dart';
import 'package:ecommerce_stats/app/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/enums/filter_date_enum.dart';
import '../controllers/graph_metrics_controller.dart';

class GraphMetricsView extends GetView<GraphMetricsController> {
  const GraphMetricsView({super.key});
  @override
  Widget build(BuildContext context) {
    print('${controller.orders[0].registered}');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Graph Metrics View'),
          centerTitle: true,
        ),
        body: Obx(() {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Number of Orders Per Month'),
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: controller.filterDate.value.name),
                      
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(text: 'Number of Orders'),
                      minimum: 0,

                    ),
                    series: <CartesianSeries>[
                      ColumnSeries<GraphModel, String>(
                        dataSource: controller.graph.value,
                        xValueMapper: (GraphModel data, _) => data.name, // Month
                        yValueMapper: (GraphModel data, _) => data.value, // Number of Orders
                        color: Colors.deepOrange[400] ,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(enable: true),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: FilterDateEnum.values.map((FilterDateEnum value){
                          return InkWell(
                            onTap: (){
                              controller.changeFilterDate(value);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: controller.filterDate.value == value ? Colors.deepOrange[600] : Colors.grey[300],
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.h, horizontal: 8.w),
                              child: Text(
                                'By ${value.name}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Lufga',
                                    color: controller.filterDate.value == value ? Colors.white : Colors.black),
                              ),
                            ),
                          );
                        }).toList()
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
