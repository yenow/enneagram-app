// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnneagramResult _$EnneagramResultFromJson(Map<String, dynamic> json) =>
    EnneagramResult(
      enneagramType: json['enneagramType'] as int,
      questionType: $enumDecode(_$QuestionTypeEnumMap, json['questionType']),
      scores: (json['scores'] as List<dynamic>)
          .map((e) => Score.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$EnneagramResultToJson(EnneagramResult instance) =>
    <String, dynamic>{
      'enneagramType': instance.enneagramType,
      'questionType': _$QuestionTypeEnumMap[instance.questionType]!,
      'scores': instance.scores.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$QuestionTypeEnumMap = {
  QuestionType.detail45: 'simple',
  QuestionType.detail81: 'detail81',
  QuestionType.detail135: 'detail135',
};
