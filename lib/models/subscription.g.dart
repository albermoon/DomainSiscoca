// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      id: json['id'] as String,
      name: $enumDecode(_$SubscriptionPlanEnumMap, json['name']),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': _$SubscriptionPlanEnumMap[instance.name]!,
      'features': instance.features,
    };

const _$SubscriptionPlanEnumMap = {
  SubscriptionPlan.none: 'none',
  SubscriptionPlan.patient: 'patient',
  SubscriptionPlan.doctor: 'doctor',
  SubscriptionPlan.admin: 'admin',
};
