// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userToken: json['userToken'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      enneagramResult: json['enneagramResult'] == null
          ? null
          : EnneagramResult.fromJson(
              json['enneagramResult'] as Map<String, dynamic>),
      enneagramResults: (json['enneagramResults'] as List<dynamic>)
          .map((e) => EnneagramResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userToken': instance.userToken,
      'createdAt': instance.createdAt.toIso8601String(),
      'enneagramResult': instance.enneagramResult?.toJson(),
      'enneagramResults':
          instance.enneagramResults.map((e) => e.toJson()).toList(),
    };
