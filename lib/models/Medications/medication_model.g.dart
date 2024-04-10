// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationModel _$MedicationModelFromJson(Map<String, dynamic> json) =>
    MedicationModel(
      name: json['name'] as String,
      description: json['description'] as String?,
      amount: json['amount'] as String,
      hour: DateTime.parse(json['hour'] as String),
      howLong: DateTime.parse(json['howLong'] as String),
      selectedDays:
          (json['selectedDays'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$MedicationModelToJson(MedicationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'amount': instance.amount,
      'hour': instance.hour.toIso8601String(),
      'howLong': instance.howLong.toIso8601String(),
      'selectedDays': instance.selectedDays,
    };
