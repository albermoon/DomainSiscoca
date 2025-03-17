class AlertThreshold {
  final int id;
  final String? patientId;
  final String measureType;
  final String severity;
  final List<String> conditions;

  AlertThreshold({
    required this.id,
    required this.patientId,
    required this.measureType,
    required this.severity,
    required this.conditions,
  });

  factory AlertThreshold.fromJson(Map<String, dynamic> json) {
    return AlertThreshold(
      id: json['id'] as int,
      patientId: json['patient_id'] as String?,
      measureType: json['measure_type'] as String,
      severity: json['severity'] as String,
      conditions: (json['conditions'] as List).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'measure_type': measureType,
      'severity': severity,
      'conditions': conditions,
    };
  }
}
