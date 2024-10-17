class PatientConstant {
  final String bloodPressure;
  final double height;
  final double oxygenSaturation;
  final int pulseRate;
  final int uniqueId;
  final double weight;

  PatientConstant({
    required this.bloodPressure,
    required this.height,
    required this.oxygenSaturation,
    required this.pulseRate,
    required this.uniqueId,
    required this.weight,
  });

  factory PatientConstant.fromJson(Map<String, dynamic> json) {
    return PatientConstant(
      bloodPressure: json['bloodPressure'],
      height: json['height'],
      oxygenSaturation: json['oxygenSaturation'],
      pulseRate: json['pulseRate'],
      uniqueId: json['uniqueId'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() => {
    'bloodPressure': bloodPressure,
    'height': height,
    'oxygenSaturation': oxygenSaturation,
    'pulseRate': pulseRate,
    'uniqueId': uniqueId,
    'weight': weight,
  };
}