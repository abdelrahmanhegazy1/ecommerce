import 'package:ecommerce_stats/app/data/models/order_model.dart';
import 'package:ecommerce_stats/app/data/providers/orders_provider.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class NumericMetricsController extends GetxController with StateMixin<List<OrderModel>>{
  //TODO: Implement NumericMetricsController

  RxList<OrderModel> orders = <OrderModel>[].obs;
  OrdersProvider ordersProvider = Get.find<OrdersProvider>();

  final count = 0.obs;
  String average = '0.0';
  int numberOfReturned = 0; 
  @override
  void onInit() {
    super.onInit();
    getOrdersList();
  }



  void getOrdersList()async{
    try{
      change(null, status: RxStatus.loading());
      orders.value = await ordersProvider.getOrders();
      calculateAverage();
      calculateNumberOfReturned(); 
      change(orders, status: RxStatus.success());
      print(orders.length);
    }
    catch(e){
      change(null, status: RxStatus.error("Failed to load orders"));
      print('error $e');
    }
  }

  void calculateNumberOfReturned() {
    for(int i = 0; i < orders.length; i++){
      if(orders[i].status == 'RETURNED') numberOfReturned++;
    }  
  }

  void calculateAverage() {
    if (orders.isEmpty) average= '0.0';

    final total = orders.fold(0.0, (sum, order) {
      final parsedPrice = double.parse(order.price.replaceAll(',', '').replaceAll('\$', ''));
      return sum + parsedPrice;
    });

    double averageOrders = total / orders.length;
    average = formatCurrency(averageOrders);
  }

  String formatCurrency(double amount) {
    final formattedAmount = amount.toStringAsFixed(2);
    return '\$${formattedAmount.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},')}';
  }


  void navigateToGraphMetrics() {
    Get.toNamed(Routes.GRAPH_METRICS,arguments: orders);
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
