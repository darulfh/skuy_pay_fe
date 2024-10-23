import 'package:json_annotation/json_annotation.dart';
part 'token_listrik_pay.g.dart';

@JsonSerializable()
class TokenListrikPay {
  @JsonKey(name: 'ref_id')
  final String refId;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'product_code')
  final String productCode;
  @JsonKey(name: 'customer_id')
  final String customerId;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'balance')
  final int balance;
  @JsonKey(name: 'tr_id')
  final int trId;
  @JsonKey(name: 'rc')
  final String rc;

  TokenListrikPay({
    this.refId = "",
    this.status = 0,
    this.productCode = "",
    this.customerId = "",
    this.price = 0,
    this.message = "",
    this.balance = 0,
    this.trId = 0,
    this.rc = "",
  });

  factory TokenListrikPay.fromJson(Map<String, dynamic> json) =>
      _$TokenListrikPayFromJson(json);

  Map<String, dynamic> toJson() => _$TokenListrikPayToJson(this);

  TokenListrikPay copyWith({
    String? refId,
    int? status,
    String? productCode,
    String? customerId,
    int? price,
    String? message,
    int? balance,
    int? trId,
    String? rc,
  }) {
    return TokenListrikPay(
      refId: refId ?? this.refId,
      status: status ?? this.status,
      productCode: productCode ?? this.productCode,
      customerId: customerId ?? this.customerId,
      price: price ?? this.price,
      message: message ?? this.message,
      balance: balance ?? this.balance,
      trId: trId ?? this.trId,
      rc: rc ?? this.rc,
    );
  }
}
