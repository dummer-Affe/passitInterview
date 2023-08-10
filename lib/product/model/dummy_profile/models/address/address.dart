import 'package:json_annotation/json_annotation.dart';

import '../coordinates/coordinates.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressToJson(this);
  }
}
