import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

/// {@template subscription}
/// A news subscription object which contains
/// metadata about a subscription tier.
/// {@endtemplate}
@JsonSerializable()
class Subscription extends Equatable {
  /// {@macro subscription}
  const Subscription({
    required this.id,
    required this.name,
    required this.features,
  });

  /// Converts a `Map<String, dynamic>` into a [Subscription] instance.
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);  

  /// The unique identifier of the subscription which corresponds to the
  /// in-app product id defined in the App Store and Google Play.
  final String id;

  final SubscriptionPlan name;

  final List<String> features;

  @override
  List<Object> get props => [id, name, features];
}

/// The available subscription plans.
enum SubscriptionPlan {
 
  none,

  patient,

  doctor,

  admin
}

