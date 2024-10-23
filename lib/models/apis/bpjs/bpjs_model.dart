import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bpjs_model.g.dart';

@JsonSerializable()
class BpjsModel extends Equatable {
  @JsonKey(name: 'tr_id')
  final int trId;
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'hp')
  final String hp;
  @JsonKey(name: 'tr_name')
  final String trName;
  @JsonKey(name: 'period')
  final String period;
  @JsonKey(name: 'nominal')
  final int nominal;
  @JsonKey(name: 'admin')
  final int admin;
  @JsonKey(name: 'ref_id')
  final String refId;
  @JsonKey(name: 'response_code')
  final String responseCode;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'selling_price')
  final int sellingPrice;
  @JsonKey(name: 'desc')
  final BpjsModelDesc desc;

  const BpjsModel({
    this.trId = 0,
    this.code = "",
    this.hp = "",
    this.trName = "",
    this.period = "",
    this.nominal = 0,
    this.admin = 0,
    this.refId = "",
    this.responseCode = "",
    this.message = "",
    this.price = 0,
    this.sellingPrice = 0,
    this.desc = const BpjsModelDesc(),
  });

  factory BpjsModel.fromJson(Map<String, dynamic> json) =>
      _$BpjsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BpjsModelToJson(this);

  BpjsModel copyWith({
    int? trId,
    String? code,
    String? hp,
    String? trName,
    String? period,
    int? nominal,
    int? admin,
    String? refId,
    String? responseCode,
    String? message,
    int? price,
    int? sellingPrice,
    BpjsModelDesc? desc,
  }) {
    return BpjsModel(
      trId: trId ?? this.trId,
      code: code ?? this.code,
      hp: hp ?? this.hp,
      trName: trName ?? this.trName,
      period: period ?? this.period,
      nominal: nominal ?? this.nominal,
      admin: admin ?? this.admin,
      refId: refId ?? this.refId,
      responseCode: responseCode ?? this.responseCode,
      message: message ?? this.message,
      price: price ?? this.price,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      desc: desc ?? this.desc,
    );
  }

  @override
  List<Object?> get props => [
        trId,
        code,
        hp,
        trName,
        period,
        nominal,
        admin,
        refId,
        responseCode,
        message,
        price,
        sellingPrice,
        desc,
      ];
}

@JsonSerializable()
class BpjsModelDesc extends Equatable {
  @JsonKey(name: 'kode_cabang')
  final String kodeCabang;
  @JsonKey(name: 'nama_cabang')
  final String namaCabang;
  @JsonKey(name: 'sisa_pembayaran')
  final String sisaPembayaran;
  @JsonKey(name: 'jumlah_peserta')
  final String jumlahPeserta;

  const BpjsModelDesc({
    this.kodeCabang = "",
    this.namaCabang = "",
    this.sisaPembayaran = "",
    this.jumlahPeserta = "",
  });

  factory BpjsModelDesc.fromJson(Map<String, dynamic> json) =>
      _$BpjsModelDescFromJson(json);

  Map<String, dynamic> toJson() => _$BpjsModelDescToJson(this);

  BpjsModelDesc copyWith({
    String? kodeCabang,
    String? namaCabang,
    String? sisaPembayaran,
    String? jumlahPeserta,
  }) {
    return BpjsModelDesc(
      kodeCabang: kodeCabang ?? this.kodeCabang,
      namaCabang: namaCabang ?? this.namaCabang,
      sisaPembayaran: sisaPembayaran ?? this.sisaPembayaran,
      jumlahPeserta: jumlahPeserta ?? this.jumlahPeserta,
    );
  }

  @override
  List<Object?> get props => [];
}
