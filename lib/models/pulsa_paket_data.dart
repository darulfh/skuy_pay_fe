class PulsaPaketDataResponse {
  List<PulsaPaketdataData>? data;
  Metadata? metadata;

  PulsaPaketDataResponse({this.data, this.metadata});

  PulsaPaketDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PulsaPaketdataData>[];
      json['data'].forEach((v) {
        data!.add(PulsaPaketdataData.fromJson(v));
      });
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class PulsaPaketdataData {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final double price;
  final String description;

  late String phone62 = '';
  late double adminFee = 0.0;
  late DateTime createdAt;
  late bool isSelected = false;

  PulsaPaketdataData({
    required this.id,
    this.phone62 = "",
    required this.name,
    required this.type,
    required this.code,
    required this.provider,
    required this.price,
    required this.description,
  }) : adminFee = 0.0 {
    createdAt = DateTime.now();
  }

  PulsaPaketdataData copyWith({
    String? id,
    String? phone62,
    String? name,
    String? type,
    String? code,
    String? provider,
    double? price,
    String? description,
  }) =>
      PulsaPaketdataData(
        id: id ?? this.id,
        phone62: phone62 ?? this.phone62,
        name: name ?? this.name,
        type: type ?? this.type,
        code: code ?? this.code,
        provider: provider ?? this.provider,
        price: price ?? this.price,
        description: description ?? this.description,
      );

  factory PulsaPaketdataData.fromJson(Map<String, dynamic> json) =>
      PulsaPaketdataData(
        id: json["id"],
        // phone62: json["phone62"],
        name: json["name"],
        type: json["type"],
        code: json["code"],
        provider: json["provider"],
        price: json["price"].toDouble(),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone62": phone62,
        "name": name,
        "type": type,
        "code": code,
        "provider": provider,
        "price": price,
        "description": description,
      };
}

class Metadata {
  int? status;
  String? message;

  Metadata({this.status, this.message});

  Metadata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
