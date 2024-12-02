import 'package:get/get.dart';

import '../modules/graph_metrics/bindings/graph_metrics_binding.dart';
import '../modules/graph_metrics/views/graph_metrics_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/numeric_metrics/bindings/numeric_metrics_binding.dart';
import '../modules/numeric_metrics/views/numeric_metrics_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NUMERIC_METRICS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NUMERIC_METRICS,
      page: () => const NumericMetricsView(),
      binding: NumericMetricsBinding(),
    ),
    GetPage(
      name: _Paths.GRAPH_METRICS,
      page: () => const GraphMetricsView(),
      binding: GraphMetricsBinding(),
    ),
  ];
}
