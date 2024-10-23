// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_listrik_inquiry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenListrikInquiry _$TokenListrikInquiryFromJson(Map<String, dynamic> json) =>
    TokenListrikInquiry(
      status: json['status'] as String? ?? "",
      customerId: json['customer_id'] as String? ?? "",
      meterNo: json['meter_no'] as String? ?? "",
      subscriberId: json['subscriber_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      segmentPower: json['segment_power'] as String? ?? "",
      message: json['message'] as String? ?? "",
      rc: json['rc'] as String? ?? "",
    );

Map<String, dynamic> _$TokenListrikInquiryToJson(
        TokenListrikInquiry instance) =>
    <String, dynamic>{
      'status': instance.status,
      'customer_id': instance.customerId,
      'meter_no': instance.meterNo,
      'subscriber_id': instance.subscriberId,
      'name': instance.name,
      'segment_power': instance.segmentPower,
      'message': instance.message,
      'rc': instance.rc,
    };
