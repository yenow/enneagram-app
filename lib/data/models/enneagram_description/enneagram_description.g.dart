// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enneagram_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnneagramDescription _$EnneagramDescriptionFromJson(
        Map<String, dynamic> json) =>
    EnneagramDescription(
      enneagramIntroduction: json['enneagramIntroduction'] as String,
      enneagramTypeDescription:
          (json['enneagramTypeDescription'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$EnneagramDescriptionToJson(
        EnneagramDescription instance) =>
    <String, dynamic>{
      'enneagramIntroduction': instance.enneagramIntroduction,
      'enneagramTypeDescription': instance.enneagramTypeDescription
          .map((k, e) => MapEntry(k.toString(), e)),
    };
