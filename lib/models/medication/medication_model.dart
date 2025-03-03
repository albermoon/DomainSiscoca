import 'dart:convert';
import 'package:domain/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Medication extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? medication_form;
  final String patient_id;
  final String? amount;
  final String? takenMeal;
  final DateTime? howLong;
  final List<int>? selectedDays;
  final bool? chronic;
  final bool activated;
  final List<ScheduledNotification> notifications;
  final String created_by_type;  //'patient' 'doctor' 'admin'

  Medication({
    String? id,
    required this.name,
    required this.patient_id,
    this.description,
    this.medication_form,
    this.amount,
    this.takenMeal,
    this.howLong,
    this.selectedDays,
    this.chronic,
    this.activated = true,
    List<ScheduledNotification>? notifications,
    required this.created_by_type,
  }) : 
    id = id ?? const Uuid().v4(),
    notifications = notifications ?? [];

  @override
  List<Object?> get props => [
    name, patient_id, description, medication_form, amount, takenMeal,
    howLong, selectedDays, chronic, activated, notifications,
    created_by_type,
  ];

  Medication copyWith({
    String? id,
    String? name,
    String? patient_id,
    String? description,
    String? medication_form,
    String? amount,
    String? takenMeal,
    DateTime? howLong,
    List<int>? selectedDays,
    bool? chronic,
    bool? activated,
    List<ScheduledNotification>? notifications,
    String? created_by_type,
  }) {
    return Medication(
      id: id ?? this.id,
      name: name ?? this.name,
      patient_id: patient_id ?? this.patient_id,
      description: description ?? this.description,
      medication_form: medication_form ?? this.medication_form,
      amount: amount ?? this.amount,
      takenMeal: takenMeal ?? this.takenMeal,
      howLong: howLong ?? this.howLong,
      selectedDays: selectedDays ?? this.selectedDays,
      chronic: chronic ?? this.chronic,
      activated: activated ?? this.activated,
      notifications: notifications ?? this.notifications,
      created_by_type: created_by_type ?? this.created_by_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'patient_id': patient_id,
      'description': description,
      'medication_form': medication_form,
      'amount': amount,
      'takenMeal': takenMeal,
      'how_long': howLong?.toIso8601String().split('T')[0],
      'chronic': chronic,
      'activated': activated,
      'notifications': notifications.map((x) => x.toMap()).toList(),
      'created_by_type': created_by_type,
    };
  }

  factory Medication.fromJson(Map<String, dynamic> map) {
    return Medication(
      id: map['id'] as String? ?? const Uuid().v4(),
      name: map['name'] as String,
      patient_id: (map['patient_id'] as String),
      description: map['description'] as String?,
      medication_form: map['medication_form'] as String?,
      amount: map['amount'] as String?,
      takenMeal: map['takenMeal'] as String?,
      howLong: map['how_long'] != null ? DateTime.parse(map['how_long'] as String) : null,
      selectedDays: map['selectedDays'] != null ? List<int>.from(map['selectedDays'] as List) : null,
      chronic: map['chronic'] as bool?,
      activated: map['activated'] as bool? ?? true,
      notifications: map['notifications'] != null
        ? List<ScheduledNotification>.from(
            (map['notifications'] as List).map<ScheduledNotification>(
              (x) => ScheduledNotification.fromMap(x as Map<String, dynamic>),
            ),
          )
        : [],
      created_by_type: map['created_by_type'] as String,  
    );
  }

  String toJson() => json.encode(toMap());

  static DateTime? parseHour(dynamic hourString) {
    if (hourString == null) return null;
    if (hourString is String) {
      final parts = hourString.split(':');
      if (parts.length == 2) {
        final now = DateTime.now();
        return DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
      }
    }
    // If it's not in the expected format, try parsing as a full date
    try {
      return DateTime.parse(hourString.toString());
    } catch (_) {
      return null;
    }
  }

  @override
  bool get stringify => true;
}