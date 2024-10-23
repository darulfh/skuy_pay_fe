class TopUp {
  final String? bankCode;

  TopUp({
    required this.bankCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_code': bankCode,
    };
  }
}

class TopUpR {
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String userId;
  final String vaNumber;
  final String vaStatus;
  final String bankCode;
  final double amount;
  final int? expirationTime;
  final String? usernameDisplay;

  TopUpR({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.vaNumber,
    required this.vaStatus,
    required this.bankCode,
    this.amount = 0,
    this.expirationTime,
    this.usernameDisplay,
  });

  factory TopUpR.fromJson(Map<String, dynamic> json) {
    return TopUpR(
      id: json['data']['id'] ?? "",
      createdAt: DateTime.parse(json['data']['CreatedAt']),
      updatedAt: DateTime.parse(json['data']['UpdatedAt']),
      deletedAt: json['data']['DeletedAt'],
      userId: json['data']['user_id'],
      vaNumber: json['data']['va_number'],
      vaStatus: json['data']['va_status'],
      bankCode: json['data']['bank_code'],
      amount: json['data']['amount'].toDouble(),
      expirationTime: json['data']['expiration_time'],
      usernameDisplay: json['data']['username_display'],
    );
  }
}
