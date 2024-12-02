import 'package:ecommerce_stats/app/data/providers/orders_provider.dart';
import 'package:get/get.dart';

import '../controllers/numeric_metrics_controller.dart';

class NumericMetricsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NumericMetricsController>(
      () => NumericMetricsController(),
    );
    Get.lazyPut<OrdersProvider>(() => OrdersProvider());
  }
}
