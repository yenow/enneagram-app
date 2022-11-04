

import 'package:enneagram/data/models/enneagram_result/score.dart';

import '../../../constants.dart';

Map<int,double> getEnneagramScoreSumMap(List<Score> scores) {
  Map<int,double> returnMap = {};

  for (Score score in scores) {
    returnMap[score.enneagramType] = (returnMap[score.enneagramType] ?? 0.0) + score.score.toDouble();
  }
  logger.d(returnMap);

  return returnMap;
}

/// 가장 점수가 높은 유형
int getHighestEnneagramType(Map<int,double> enneagramScoreMap) {
  int enneagramType = 0;

  enneagramScoreMap.forEach((key, value) {
    if (enneagramType == 0) {
      enneagramType = key;
    } else {

      if (enneagramScoreMap[enneagramType]! < enneagramScoreMap[key]!) {
        enneagramType = key;
      } else if (enneagramScoreMap[enneagramType]! == enneagramScoreMap[key]!) {  // 만약 최고점수가 2개일 경우
        enneagramType = key;
      }
    }
  });
  return enneagramType;
}