// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpjs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpjsModel _$BpjsModelFromJson(Map<String, dynamic> json) => BpjsModel(
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
          ? const BpjsModelDesc()
          : BpjsModelDesc.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BpjsModelToJson(BpjsModel instance) => <String, dynamic>{
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

BpjsModelDesc _$BpjsModelDescFromJson(Map<String, dynamic> json) =>
    BpjsModelDesc(
      kodeCabang: json['kode_cabang'] as String? ?? "",
      namaCabang: json['nama_cabang'] as String? ?? "",
      sisaPembayaran: json['sisa_pembayaran'] as String? ?? "",
      jumlahPeserta: json['jumlah_peserta'] as String? ?? "",
    );

Map<String, dynamic> _$BpjsModelDescToJson(BpjsModelDesc instance) =>
    <String, dynamic>{
      'kode_cabang': instance.kodeCabang,
      'nama_cabang': instance.namaCabang,
      'sisa_pembayaran': instance.sisaPembayaran,
      'jumlah_peserta': instance.jumlahPeserta,
    };
