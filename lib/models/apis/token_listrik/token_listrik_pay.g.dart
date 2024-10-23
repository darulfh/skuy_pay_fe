// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_listrik_pay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenListrikPay _$TokenListrikPayFromJson(Map<String, dynamic> json) =>
    TokenListrikPay(
      refId: json['ref_id'] as String? ?? "",
      status: (json['status'] as num?)?.toInt() ?? 0,
      productCode: json['product_code'] as String? ?? "",
      customerId: json['customer_id'] as String? ?? "",
      price: (json['price'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? "",
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      trId: (json['tr_id'] as num?)?.toInt() ?? 0,
      rc: json['rc'] as String? ?? "",
    );

Map<String, dynamic> _$TokenListrikPayToJson(TokenListrikPay instance) =>
    <String, dynamic>{
      'ref_id': instance.refId,
      'status': instance.status,
      'product_code': instance.productCode,
      'customer_id': instance.customerId,
      'price': instance.price,
      'message': instance.message,
      'balance': instance.balance,
      'tr_id': instance.trId,
      'rc': instance.rc,
    };
