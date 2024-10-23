import 'package:json_annotation/json_annotation.dart';

part 'token_listrik_inquiry.g.dart';

@JsonSerializable()
class TokenListrikInquiry {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'customer_id')
  final String customerId;
  @JsonKey(name: 'meter_no')
  final String meterNo;
  @JsonKey(name: 'subscriber_id')
  final String subscriberId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'segment_power')
  final String segmentPower;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'rc')
  final String rc;

  TokenListrikInquiry({
    this.status = "",
    this.customerId = "",
    this.meterNo = "",
    this.subscriberId = "",
    this.name = "",
    this.segmentPower = "",
    this.message = "",
    this.rc = "",
  });

  factory TokenListrikInquiry.fromJson(Map<String, dynamic> json) =>
      _$TokenListrikInquiryFromJson(json);

  Map<String, dynamic> toJson() => _$TokenListrikInquiryToJson(this);

  TokenListrikInquiry copyWith({
    String? status,
    String? customerId,
    String? meterNo,
    String? subscriberId,
    String? name,
    String? segmentPower,
    String? message,
    String? rc,
  }) {
    return TokenListrikInquiry(
      status: status ?? this.status,
      customerId: customerId ?? this.customerId,
      meterNo: meterNo ?? this.meterNo,
      subscriberId: subscriberId ?? this.subscriberId,
      name: name ?? this.name,
      segmentPower: segmentPower ?? this.segmentPower,
      message: message ?? this.message,
      rc: rc ?? this.rc,
    );
  }
}
