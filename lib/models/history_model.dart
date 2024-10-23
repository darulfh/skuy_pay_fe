class Transaction {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final Map<String, dynamic> productDetail;
  final String description;
  final double discountPrice;
  final double adminFee;
  final double price;
  final int amount;
  final String phoneNumber;
  final String customerId;
  final double totalPrice;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.status,
    required this.productType,
    required this.productDetail,
    required this.description,
    required this.discountPrice,
    required this.adminFee,
    required this.price,
    required this.amount,
    required this.phoneNumber,
    required this.customerId,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: json['product_detail'],
      description: json['description'],
      discountPrice: json['discount_price'].toDouble(),
      adminFee: json['admin_fee'].toDouble(),
      price: json['price'].toDouble(),
      amount: (json['product_detail']['amount'] ?? 0.0).toInt(),
      totalPrice: json['total_price'].toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'] ?? '',
      phoneNumber: json['product_detail']['phone_number'] ?? '',
      customerId: json['product_detail']['customer_id'] ?? '',
    );
  }
}
