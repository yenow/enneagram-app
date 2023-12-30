import 'package:enneagram/data/models/question/question.dart';
import 'package:enneagram/data/models/enneagram_result/score.dart';
import 'package:json_annotation/json_annotation.dart';

import '../question/question_type.dart';
import 'enneagram_result_function.dart';

part 'enneagram_result.g.dart';

@JsonSerializable(explicitToJson: true)
class EnneagramResult {
  int enneagramType;
  QuestionType questionType;
  List<Score> scores;
  DateTime createdAt;

  int findScoreByEnneagramType(int EnneagramType) {
    int score = 0;
    int index = scores.indexWhere((element) => element.enneagramType == enneagramType);
    score = scores.elementAt(index).score;
    return score;
  }

  /// 애니어그램 타입별 총점
  Map<int, double> findEnneagramScoreSumMap() {
    return getEnneagramScoreSumMap(scores);
  }

  /// 최대점수
  double returnMaxScore() {
    return (scores.length ~/ 9) * 5;
  }

  /// 가장 점수가 높은 유형
  int findHighestEnneagramType() {
    Map<int, double> map = findEnneagramScoreSumMap();
    return getHighestEnneagramType(map);
  }

  /// 가장 점수가 낮은 유형
  int findLowestEnneagramType() {
    Map<int, double> map = findEnneagramScoreSumMap();

    int enneagramType = 0;

    map.forEach((key, value) {
      if (enneagramType == 0) {
        enneagramType = key;
      } else {
        if (map[enneagramType]! > map[key]!) {
          enneagramType = key;
        } else if (map[enneagramType]! == map[key]!) {
          // 만약 최고점수가 2개일 경우
          enneagramType = key;
        }
      }
    });
    return enneagramType;
  }

  /// 날개유형
  int? findWingType() {
    if (scores.isEmpty) {
      return null;
    }

    Map<int, double> map = findEnneagramScoreSumMap();
    int enneagramType = findHighestEnneagramType();

    int prev = ((enneagramType - 1) % 10);
    int next = ((enneagramType + 1) % 10);

    int returnValue = map[prev]! > map[next]! ? prev : next;
    return returnValue;
  }

  EnneagramResult({
    required this.enneagramType,
    required this.questionType,
    required this.scores,
    required this.createdAt,
  });

  factory EnneagramResult.fromJson(Map<String, dynamic> json) => _$EnneagramResultFromJson(json);

  Map<String, dynamic> toJson() => _$EnneagramResultToJson(this);

  @override
  String toString() {
    return 'EnneagramResult{enneagramType: $enneagramType, questionType: $questionType, scores: $scores, createdAt: $createdAt}';
  }
}
