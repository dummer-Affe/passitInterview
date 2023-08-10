import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank(
      {this.cardExpire,
      this.cardNumber,
      this.cardType,
      this.currency,
      this.iban});

  Bank fromJson(Map<String, dynamic> json) {
    return _$BankFromJson(json);
  }

  factory Bank.fromJson(Map<String, dynamic> json) {
    return _$BankFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BankToJson(this);
  }
}
