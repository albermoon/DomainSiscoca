import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../scheduled_notification/scheduled_notification.dart';

class MedicationModel extends Equatable {
  final String localId;
  final int? id;
  final String name;
  final String? description;
  final String? medication_form;
  final String? amount;
  final String? takenMeal;
  final DateTime? hour;
  final DateTime? howLong;
  final List<int>? selectedDays;
  final bool? chronic;
  final bool activated;
  final List<ScheduledNotification>? notifications;

  MedicationModel({
    String? localId,
    this.id,
    required this.name,
    this.description,
    this.medication_form,
    this.amount,
    this.takenMeal,
    this.hour,
    this.howLong,
    this.selectedDays,
    this.chronic,
    this.activated = true,
    this.notifications,
  }) : localId = localId ?? const Uuid().v4();

  @override
  List<Object?> get props => [
    localId, id, name, description, medication_form, amount, takenMeal,
    hour, howLong, selectedDays, chronic, activated, notifications
  ];

  MedicationModel copyWith({
    String? localId,
    int? id,
    String? name,
    String? description,
    String? medication_form,
    String? amount,
    String? takenMeal,
    DateTime? hour,
    DateTime? howLong,
    List<int>? selectedDays,
    bool? chronic,
    bool? activated,
    List<ScheduledNotification>? notifications,
  }) {
    return MedicationModel(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      medication_form: medication_form ?? this.medication_form,
      amount: amount ?? this.amount,
      takenMeal: takenMeal ?? this.takenMeal,
      hour: hour ?? this.hour,
      howLong: howLong ?? this.howLong,
      selectedDays: selectedDays ?? this.selectedDays,
      chronic: chronic ?? this.chronic,
      activated: activated ?? this.activated,
      notifications: notifications ?? this.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'localId': localId,
      'id': id,
      'name': name,
      'description': description,
      'medication_form': medication_form,
      'amount': amount,
      'takenMeal': takenMeal,
      'hour': hour?.millisecondsSinceEpoch,
      'howLong': howLong?.millisecondsSinceEpoch,
      'selectedDays': selectedDays,
      'chronic': chronic,
      'activated': activated,
      'notifications': notifications?.map((x) => x.toMap()).toList(),
    };
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      localId: map['localId'] as String? ?? const Uuid().v4(),
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String?,
      medication_form: map['medication_form'] as String?,
      amount: map['amount'] as String?,
      takenMeal: map['takenMeal'] as String?,
      hour: map['hour'] != null ? DateTime.fromMillisecondsSinceEpoch(map['hour'] as int) : null,
      howLong: map['howLong'] != null ? DateTime.fromMillisecondsSinceEpoch(map['howLong'] as int) : null,
      selectedDays: map['selectedDays'] != null ? List<int>.from(map['selectedDays'] as List) : null,
      chronic: map['chronic'] as bool?,
      activated: map['activated'] as bool? ?? true,
      notifications: map['notifications'] != null
          ? List<ScheduledNotification>.from(
              (map['notifications'] as List).map<ScheduledNotification>(
                (x) => ScheduledNotification.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) =>
      MedicationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}