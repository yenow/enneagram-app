import 'package:enneagram/data/models/question.dart';
import 'package:enneagram/data/models/score.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enneagram_result.g.dart';

@JsonSerializable(explicitToJson: true)
class EnneagramResult {
  int  enneagramType;
  QuestionType questionType;
  List<Score> scores;
  DateTime createdAt;

  EnneagramResult(
      {required this.enneagramType, required this.questionType, required this.scores, required this.createdAt});


  factory EnneagramResult.fromJson(Map<String, dynamic> json) => _$EnneagramResultFromJson(json);

  Map<String, dynamic> toJson() => _$EnneagramResultToJson(this);
}
