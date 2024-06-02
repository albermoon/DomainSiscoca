import 'dart:convert';
import 'dart:math';

class ScheduledNotification {

  int? id;
  // Day of the week from 0 - 6 (Monday - Sunday)
  final int day;
  final DateTime date;
  bool enabled;
  ScheduledNotification({
    this.id,
    required this.day,
    required this.date,
    this.enabled = true,
  }) {
    id ??= Random().nextInt(999999);
  }


  ScheduledNotification copyWith({
    int? id,
    int? day,
    DateTime? date,
    bool? enabled,
  }) {
    return ScheduledNotification(
      id: id ?? this.id,
      day: day ?? this.day,
      date: date ?? this.date,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'date': date.millisecondsSinceEpoch,
      'enabled': enabled,
    };
  }

  factory ScheduledNotification.fromMap(Map<String, dynamic> map) {
    return ScheduledNotification(
      id: map['id'] != null ? map['id'] as int : null,
      day: map['day'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      enabled: map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduledNotification.fromJson(String source) => ScheduledNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScheduledNotification(id: $id, day: $day, date: $date, enabled: $enabled)';
  }

  @override
  bool operator ==(covariant ScheduledNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.day == day &&
      other.date == date &&
      other.enabled == enabled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      day.hashCode ^
      date.hashCode ^
      enabled.hashCode;
  }

}