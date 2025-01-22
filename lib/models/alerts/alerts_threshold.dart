class AlertThreshold {
  final String id;
  final int patientId;
  final String measureType;
  final String severity;
  final Map<String, dynamic> conditions;

  AlertThreshold({
    required this.id,
    required this.patientId,
    required this.measureType,
    required this.severity,
    required this.conditions,
  });

  factory AlertThreshold.fromJson(Map<String, dynamic> json) {
    return AlertThreshold(
      id: json['id'] as String,
      patientId: json['id'] as int,
      measureType: json['measure_type'] as String,
      severity: json['severity'] as String,
      conditions: json['conditions'] as Map<String, dynamic>,
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
