import 'package:enneagram/data/models/question/question.dart';
import 'package:enneagram/data/models/enneagram_result/score.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enneagram_result.g.dart';

@JsonSerializable(explicitToJson: true)
class EnneagramResult {
  int  enneagramType;
  QuestionType questionType;
  List<Score> scores;
  DateTime createdAt;

  Map<int,double> returnEnneagramTypeScoreSumMap() {
    Map<int,double> returnMap = {};

    for (var score in scores) {
      returnMap[score.enneagramType] = (returnMap[score.enneagramType] ?? 0) + score.score.toDouble();
    }
    return returnMap;
  }

  double returnMaxScore() {
    return (scores.length ~/ 9) * 5;
  }

  EnneagramResult(
      {required this.enneagramType, required this.questionType, required this.scores, required this.createdAt});

  factory EnneagramResult.fromJson(Map<String, dynamic> json) => _$EnneagramResultFromJson(json);

  Map<String, dynamic> toJson() => _$EnneagramResultToJson(this);
}
