class OrderModel {
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final String registered;

  const OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json['id'],
    isActive: json['isActive'],
    price: json['price'],
    company: json['company'],
    picture: json['picture'],
    buyer: json['buyer'],
    tags: List<String>.from(json['tags']),
    status: json['status'],
    registered: json['registered'],
  );
}