import 'package:json_annotation/json_annotation.dart';

part 'hair.g.dart';

@JsonSerializable()
class Hair {
  String? color;
  String? type;


  Hair({this.color, this.type});

  Hair fromJson(Map<String, dynamic> json) {
    return _$HairFromJson(json);
  }

  factory Hair.fromJson(Map<String, dynamic> json) {
    return _$HairFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HairToJson(this);
  }
}
