class Alert {
  final String id;
  final int patientId;
  final int healthDataPointId;
  final String alertThresholdId;
  final DateTime createdAt;
  final bool isRead;
  final DateTime? readAt;
  final int? readByDoctorId;

  Alert({
    required this.id,
    required this.patientId,
    required this.healthDataPointId,
    required this.alertThresholdId,
    required this.createdAt,
    required this.isRead,
    this.readAt,
    this.readByDoctorId,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'] as String,
      patientId: json['patient_id'] as int,
      healthDataPointId: json['health_data_point_id'] as int,
      alertThresholdId: json['alert_threshold_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: (json['is_read'] as int) == 1,
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at'] as String) : null,
      readByDoctorId: json['read_by_doctor_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'health_data_point_id': healthDataPointId,
      'alert_threshold_id': alertThresholdId,
      'created_at': createdAt.toIso8601String(),
      'is_read': isRead ? 1 : 0,
      'read_at': readAt?.toIso8601String(),
      'read_by_doctor_id': readByDoctorId,
    };
  }
}