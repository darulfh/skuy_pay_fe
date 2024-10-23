// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagihan_listrik_inquiry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagihanListrikInquiry _$TagihanListrikInquiryFromJson(
        Map<String, dynamic> json) =>
    TagihanListrikInquiry(
      trId: (json['tr_id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? "",
      hp: json['hp'] as String? ?? "",
      trName: json['tr_name'] as String? ?? "",
      period: json['period'] as String? ?? "",
      nominal: (json['nominal'] as num?)?.toInt() ?? 0,
      admin: (json['admin'] as num?)?.toInt() ?? 0,
      refId: json['ref_id'] as String? ?? "",
      responseCode: json['response_code'] as String? ?? "",
      message: json['message'] as String? ?? "",
      price: (json['price'] as num?)?.toInt() ?? 0,
      sellingPrice: (json['selling_price'] as num?)?.toInt() ?? 0,
      desc: json['desc'] == null
          ? const TagihanListrikDesc()
          : TagihanListrikDesc.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagihanListrikInquiryToJson(
        TagihanListrikInquiry instance) =>
    <String, dynamic>{
      'tr_id': instance.trId,
      'code': instance.code,
      'hp': instance.hp,
      'tr_name': instance.trName,
      'period': instance.period,
      'nominal': instance.nominal,
      'admin': instance.admin,
      'ref_id': instance.refId,
      'response_code': instance.responseCode,
      'message': instance.message,
      'price': instance.price,
      'selling_price': instance.sellingPrice,
      'desc': instance.desc,
    };

TagihanListrikDesc _$TagihanListrikDescFromJson(Map<String, dynamic> json) =>
    TagihanListrikDesc(
      tarif: json['tarif'] as String? ?? "",
      daya: (json['daya'] as num?)?.toInt() ?? 0,
      lembarTagihan: json['lembar_tagihan'] as String? ?? "",
      tagihan: json['tagihan'] == null
          ? const Tagihan(detail: [])
          : Tagihan.fromJson(json['tagihan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TagihanListrikDescToJson(TagihanListrikDesc instance) =>
    <String, dynamic>{
      'tarif': instance.tarif,
      'daya': instance.daya,
      'lembar_tagihan': instance.lembarTagihan,
      'tagihan': instance.tagihan,
    };

Tagihan _$TagihanFromJson(Map<String, dynamic> json) => Tagihan(
      detail: (json['detail'] as List<dynamic>?)
              ?.map((e) =>
                  TagihanListrikDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <TagihanListrikDetail>[],
    );

Map<String, dynamic> _$TagihanToJson(Tagihan instance) => <String, dynamic>{
      'detail': instance.detail,
    };

TagihanListrikDetail _$TagihanListrikDetailFromJson(
        Map<String, dynamic> json) =>
    TagihanListrikDetail(
      periode: json['periode'] as String? ?? "",
      nilaiTagihan: json['nilai_tagihan'] as String? ?? "",
      admin: json['admin'] as String? ?? "",
      denda: json['denda'] as String? ?? "",
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TagihanListrikDetailToJson(
        TagihanListrikDetail instance) =>
    <String, dynamic>{
      'periode': instance.periode,
      'nilai_tagihan': instance.nilaiTagihan,
      'admin': instance.admin,
      'denda': instance.denda,
      'total': instance.total,
    };
