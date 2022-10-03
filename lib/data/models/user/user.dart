
import 'package:json_annotation/json_annotation.dart';

import '../enneagram_result/enneagram_result.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String userToken;
  DateTime createdAt;
  EnneagramResult? enneagramResult;
  List<EnneagramResult> enneagramResults;

  User({required this.userToken, required this.createdAt, this.enneagramResult, required this.enneagramResults});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{userToken: $userToken, createdAt: $createdAt, enneagramResult: $enneagramResult, enneagramResults: $enneagramResults}';
  }
}