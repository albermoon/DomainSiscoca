import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../scheduled_notification/scheduled_notification.dart';

class MedicationModel extends Equatable {

  const MedicationModel({
    required this.id,
    required this.name, 
    required this.description,
    required this.amount, 
    required this.hour, 
    required this.howLong, 
    required this.selectedDays,
    this.activated = true, 
    this.notifications = const []
  });

  final String id;
  final String name;
  final String? description;
  final String amount;
  final DateTime hour;
  final DateTime howLong;
  final List<int> selectedDays;
  final bool activated;
  final List<ScheduledNotification> notifications;

  @override
  List<Object> get props => [id];

  MedicationModel copyWith({
    String? id,
    String? name,
    String? description,
    String? amount,
    DateTime? hour,
    DateTime? howLong,
    List<int>? selectedDays,
    bool? activated,
    List<ScheduledNotification>? notifications,
  }) {
    return MedicationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      hour: hour ?? this.hour,
      howLong: howLong ?? this.howLong,
      selectedDays: selectedDays ?? this.selectedDays,
      activated: activated ?? this.activated,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'amount': amount,
      'hour': hour.millisecondsSinceEpoch,
      'howLong': howLong.millisecondsSinceEpoch,
      'selectedDays': selectedDays,
      'activated': activated,
      'notifications': notifications.map((x) => x.toMap()).toList(),
    };
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      amount: map['amount'] as String,
      hour: DateTime.fromMillisecondsSinceEpoch(map['hour'] as int),
      howLong: DateTime.fromMillisecondsSinceEpoch(map['howLong'] as int),
      selectedDays: List<int>.from((map['selectedDays'] as List<int>)),
      activated: map['activated'] as bool,
      notifications: List<ScheduledNotification>.from((map['notifications'])
        .map<ScheduledNotification>((x) => ScheduledNotification.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) => MedicationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
