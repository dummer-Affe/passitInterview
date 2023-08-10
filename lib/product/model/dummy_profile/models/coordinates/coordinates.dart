import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  double? lat;
  double? lng;


  Coordinates({this.lat, this.lng});

  Coordinates fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return _$CoordinatesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CoordinatesToJson(this);
  }
}
