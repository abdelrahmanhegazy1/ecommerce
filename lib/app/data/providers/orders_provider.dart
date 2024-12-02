import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/order_model.dart';

class OrdersProvider {
  Future<List<OrderModel>> getOrders() async {
    final String ordersString = await rootBundle.loadString('assets/jsons/orders.json');
    final List<OrderModel> orders = json.decode(ordersString).map<OrderModel>((item) => OrderModel.fromJson(item)).toList();
    return orders;
  }
}