import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tagihan_listrik_inquiry.g.dart';

@JsonSerializable()
class TagihanListrikInquiry {
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
  final TagihanListrikDesc desc;

  TagihanListrikInquiry({
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
    this.desc = const TagihanListrikDesc(),
  });

  factory TagihanListrikInquiry.fromJson(Map<String, dynamic> json) =>
      _$TagihanListrikInquiryFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanListrikInquiryToJson(this);

  TagihanListrikInquiry copyWith({
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
    TagihanListrikDesc? desc,
  }) {
    return TagihanListrikInquiry(
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
}

@JsonSerializable()
class TagihanListrikDesc extends Equatable {
  @JsonKey(name: 'tarif')
  final String tarif;
  @JsonKey(name: 'daya')
  final int daya;
  @JsonKey(name: 'lembar_tagihan')
  final String lembarTagihan;
  @JsonKey(name: 'tagihan')
  final Tagihan tagihan;

  const TagihanListrikDesc({
    this.tarif = "",
    this.daya = 0,
    this.lembarTagihan = "",
    this.tagihan = const Tagihan(detail: []),
  });

  factory TagihanListrikDesc.fromJson(Map<String, dynamic> json) =>
      _$TagihanListrikDescFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanListrikDescToJson(this);

  TagihanListrikDesc copyWith({
    String? tarif,
    int? daya,
    String? lembarTagihan,
    Tagihan? tagihan,
  }) {
    return TagihanListrikDesc(
      tarif: tarif ?? this.tarif,
      daya: daya ?? this.daya,
      lembarTagihan: lembarTagihan ?? this.lembarTagihan,
      tagihan: tagihan ?? this.tagihan,
    );
  }

  @override
  List<Object?> get props => [
        tarif,
        daya,
        lembarTagihan,
        tagihan,
      ];
}

@JsonSerializable()
class Tagihan extends Equatable {
  @JsonKey(name: 'detail')
  final List<TagihanListrikDetail> detail;

  const Tagihan({
    this.detail = const <TagihanListrikDetail>[],
  });

  factory Tagihan.fromJson(Map<String, dynamic> json) =>
      _$TagihanFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanToJson(this);

  Tagihan copyWith({
    List<TagihanListrikDetail>? detail,
  }) {
    return Tagihan(
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object?> get props => [detail];
}

@JsonSerializable()
class TagihanListrikDetail extends Equatable {
  @JsonKey(name: 'periode')
  final String periode;
  @JsonKey(name: 'nilai_tagihan')
  final String nilaiTagihan;
  @JsonKey(name: 'admin')
  final String admin;
  @JsonKey(name: 'denda')
  final String denda;
  @JsonKey(name: 'total')
  final int total;

  const TagihanListrikDetail({
    this.periode = "",
    this.nilaiTagihan = "",
    this.admin = "",
    this.denda = "",
    this.total = 0,
  });

  factory TagihanListrikDetail.fromJson(Map<String, dynamic> json) =>
      _$TagihanListrikDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanListrikDetailToJson(this);

  TagihanListrikDetail copyWith({
    String? periode,
    String? nilaiTagihan,
    String? admin,
    String? denda,
    int? total,
  }) {
    return TagihanListrikDetail(
      periode: periode ?? this.periode,
      nilaiTagihan: nilaiTagihan ?? this.nilaiTagihan,
      admin: admin ?? this.admin,
      denda: denda ?? this.denda,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [
        periode,
        nilaiTagihan,
        admin,
        denda,
        total,
      ];
}
