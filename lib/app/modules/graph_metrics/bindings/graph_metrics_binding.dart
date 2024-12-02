import 'package:get/get.dart';

import '../controllers/graph_metrics_controller.dart';

class GraphMetricsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphMetricsController>(
      () => GraphMetricsController(),
    );
  }
}
