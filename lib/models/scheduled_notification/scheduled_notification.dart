import 'dart:convert';

class ScheduledNotification {
  int? id;
  final int day;
  final DateTime hour;
  bool enabled;

  ScheduledNotification({
    this.id,
    required this.day,
    required this.hour,
    this.enabled = true,
  });

  ScheduledNotification copyWith({
    int? id,
    int? day,
    DateTime? hour,
    bool? enabled,
  }) {
    return ScheduledNotification(
      id: id ?? this.id,
      day: day ?? this.day,
      hour: hour ?? this.hour,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'hour': '${hour.hour.toString().padLeft(2, '0')}:${hour!.minute.toString().padLeft(2, '0')}' ,
      'enabled': enabled,
    };
  }
  factory ScheduledNotification.fromMap(Map<String, dynamic> map) {
    return ScheduledNotification(
      id: map['id'] as int,
      day: map['day'] as int,
      hour: _parseHour(map['hour']),
      enabled: map['enabled'] as bool,
    );
  }

  static DateTime _parseHour(dynamic hourString) {
    if (hourString == null) ;
    if (hourString is String) {
      final parts = hourString.split(':');
      if (parts.length == 2) {
        final now = DateTime.now();
        return DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
      }
    }
    return DateTime.parse(hourString.toString());
  }

  String toJson() => json.encode(toMap());

  factory ScheduledNotification.fromJson(String source) => 
      ScheduledNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScheduledNotification(id: $id, day: $day, hour: $hour, enabled: $enabled)';
  }

  @override
  bool operator ==(covariant ScheduledNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.day == day &&
      other.hour == hour &&
      other.enabled == enabled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      day.hashCode ^
      hour.hashCode ^
      enabled.hashCode;
  }
}