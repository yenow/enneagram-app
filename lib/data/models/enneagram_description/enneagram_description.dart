
import 'package:json_annotation/json_annotation.dart';

part 'enneagram_description.g.dart';

@JsonSerializable(explicitToJson: true)
class EnneagramDescription {
  String enneagramIntroduction;
  Map<int, String> enneagramTypeDescription;

  EnneagramDescription({required this.enneagramIntroduction, required this.enneagramTypeDescription});

  factory EnneagramDescription.fromJson(Map<String, dynamic> json) => _$EnneagramDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$EnneagramDescriptionToJson(this);

  @override
  String toString() {
    return 'EnneagramDescription{enneagramIntroduction: $enneagramIntroduction, enneagramTypeDescription: $enneagramTypeDescription}';
  }
}