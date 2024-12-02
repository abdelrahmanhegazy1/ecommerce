import 'package:ecommerce_stats/app/data/models/graph_model.dart';
import 'package:ecommerce_stats/app/data/models/order_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/enums/filter_date_enum.dart';

class GraphMetricsController extends GetxController {
  //TODO: Implement GraphMetricsController
  List<OrderModel> orders = [];
  final count = 0.obs;
  Rx<FilterDateEnum> filterDate = FilterDateEnum.month.obs;
  RxList<GraphModel> graph = <GraphModel>[].obs;
  @override
  void onInit() {
    orders = Get.arguments ?? [];
    changeFilterDate(FilterDateEnum.month);
    print(orders);
    super.onInit();
  }

  void changeFilterDate(FilterDateEnum value) {
    filterDate.value = value;
    switch (value) {
      case FilterDateEnum.month:
        filterByDate(FilterDateEnum.month);
        break;
      case FilterDateEnum.year:
        filterByDate(FilterDateEnum.year);
        break;
      case FilterDateEnum.day:
        filterByDate(FilterDateEnum.day);
        break;
      default:
        break;
    }
  }

  void filterByDate(FilterDateEnum filterDate) {
    graph.clear();
    Map<String, int> ordersPerMonth = {};

    for (var order in orders) {
      DateTime registered = DateTime.parse(order.registered);

      String monthKey = DateFormat(filterDate == FilterDateEnum.month
              ? 'yyyy-MM'
              : filterDate == FilterDateEnum.year
                  ? 'yyyy'
                  : 'yyyy-MM-dd')
          .format(registered);

      ordersPerMonth.update(
        monthKey,
        (count) => count + 1,
        ifAbsent: () => 1,
      );
    }

    graph.value = ordersPerMonth.entries.map((entry) {
      return GraphModel(
        name: entry.key,
        value: entry.value.toDouble(),
      );
    }).toList();
    sortGraphDataByDate(graph.value);
  }

  void sortGraphDataByDate(List<GraphModel> graphData) {
    graphData.sort((a, b) {
      DateTime dateA = DateFormat('yyyy-MM').parse(a.name);
      DateTime dateB = DateFormat('yyyy-MM').parse(b.name);
      return dateA.compareTo(dateB); // Ascending order
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
