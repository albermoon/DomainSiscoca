import 'package:equatable/equatable.dart';

class Appointment extends Equatable {
  final int id;
  final String title;
  final DateTime dateTime;
  final String? doctor;
  final String? location;

  const Appointment({
    required this.id,
    required this.title,
    required this.dateTime,
    this.doctor,
    this.location,
  });

  String get dateFormatted {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year;
    return '$year-$month-$day';
  }

  String get timeFormatted {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] as int,
      title: map['title'] as String,
      dateTime: DateTime.parse(map['dateTime'] as String),
      doctor: map['doctor'] as String?,
      location: map['location'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateTime': dateTime.toIso8601String(),
      'doctor': doctor,
      'location': location,
    };
  }

  Appointment copyWith({
    int? id,
    String? title,
    DateTime? dateTime,
    String? doctor,
    String? location,
  }) {
    return Appointment(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      doctor: doctor ?? this.doctor,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [id, title, dateTime, doctor, location];
} 