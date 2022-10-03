

import 'package:json_annotation/json_annotation.dart';

part 'score.g.dart';

@JsonSerializable()
class Score {
  int enneagramType;
  int score;

  Score({required this.enneagramType, required this.score});

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreToJson(this);
}