import 'package:equatable/equatable.dart';

enum NotificationType {
  push,
  local,
  taskAlert,
  appointment,
  news, 
  medication,
  taskRoutine,
}

class Notification extends Equatable {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final NotificationType type;
  final Map<String, dynamic>? additionalData;
  final String? imageUrl;
  final DateTime? scheduledFor;

  const Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.type,
    this.additionalData,
    this.imageUrl,
    this.scheduledFor,
  });

  @override
  List<Object?> get props => [id, title, body, timestamp, type, additionalData, imageUrl, scheduledFor];

  Notification copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? timestamp,
    NotificationType? type,
    Map<String, dynamic>? additionalData,
    DateTime? scheduledFor,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      additionalData: additionalData ?? this.additionalData,
      imageUrl:  imageUrl ?? this.imageUrl,
      scheduledFor: scheduledFor ?? this.scheduledFor
    );
  }

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      timestamp: DateTime.parse(json['timestamp']),
      type: NotificationType.values.firstWhere((e) => e.toString() == json['type']),
      additionalData: json['additionalData'],
      imageUrl: json['imageUrl'] ?? null,
      scheduledFor: json['scheduleFor'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
      'type': type.toString(),
      'additionalData': additionalData,
      'imageUrl': imageUrl ?? null,
      'scheduleFor': scheduledFor ?? null,
    };
  }
}