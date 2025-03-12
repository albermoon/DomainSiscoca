import 'package:domain/models/models.dart';

class Alert {
  final int id;
  final User patientId;
  final dynamic healthDataPoint;
  final AlertThreshold alertThreshold;
  final DateTime createdAt;
  final bool isRead;
  final DateTime? readAt;
  final String? readByDoctorId;

  Alert({
    required this.id,
    required this.patientId,
    required this.healthDataPoint,
    required this.alertThreshold,
    required this.createdAt,
    required this.isRead,
    this.readAt,
    this.readByDoctorId,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'] as int,
      patientId: User.fromJson(json['patient']), 
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] == true || json['is_read'] == 1,
      alertThreshold: AlertThreshold.fromJson(json['alert_threshold']),
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at'] as String) : null,
      healthDataPoint: json['health_data_point'] as dynamic,
      readByDoctorId: json['read_by_doctor_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId.toJson(),
      'health_data_point_id': healthDataPoint,
      'alert_threshold_id': alertThreshold,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead ? 1 : 0,
      'read_at': readAt?.toIso8601String(),
      'read_by_doctor_id': readByDoctorId,
    };
  }
}