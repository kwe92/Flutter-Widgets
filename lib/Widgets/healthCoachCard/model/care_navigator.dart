import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class CareNavigator {
  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;
  String? role;
  String? image;

  String? bio;
  @JsonKey(name: 'pk')
  int? primaryKey;

  CareNavigator({
    this.firstName,
    this.lastName,
    this.bio,
    this.role,
    this.image,
    this.primaryKey,
  });
}
