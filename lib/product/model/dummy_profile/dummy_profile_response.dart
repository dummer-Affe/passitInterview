import 'package:json_annotation/json_annotation.dart';

import 'models/address/address.dart';
import 'models/bank/bank.dart';
import 'models/company/company.dart';
import 'models/hair/hair.dart';

part 'dummy_profile_response.g.dart';

@JsonSerializable()
class DummyProfileResponse {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  DummyProfileResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.maidenName,
      this.age,
      this.gender,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.birthDate,
      this.image,
      this.bloodGroup,
      this.height,
      this.weight,
      this.eyeColor,
      this.hair,
      this.domain,
      this.ip,
      this.address,
      this.macAddress,
      this.university,
      this.bank,
      this.company,
      this.ein,
      this.ssn,
      this.userAgent});

  DummyProfileResponse fromJson(Map<String, dynamic> json) {
    return _$DummyProfileResponseFromJson(json);
  }

  factory DummyProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$DummyProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DummyProfileResponseToJson(this);
  }
}
