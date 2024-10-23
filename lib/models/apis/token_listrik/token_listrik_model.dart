import 'package:equatable/equatable.dart';

class TokenListrikModel extends Equatable {
  final String name;
  final double price;
  final double admin;
  final String code;
  final bool isSelect;

  const TokenListrikModel({
    this.name = "",
    this.price = 0,
    this.admin = 1000,
    this.code = "",
    this.isSelect = false,
  });

  TokenListrikModel copyWith({
    String? name,
    double? price,
    double? admin,
    String? code,
    bool? isSelect,
  }) {
    return TokenListrikModel(
      name: name ?? this.name,
      price: price ?? this.price,
      admin: admin ?? this.admin,
      code: code ?? this.code,
      isSelect: isSelect ?? this.isSelect,
    );
  }

  @override
  List<Object?> get props => [
        name,
        price,
        admin,
        code,
        isSelect,
      ];

  @override
  bool get stringify => true;
}
