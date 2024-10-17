
class ClinicalInfo {
  final int uniqueId;
  final String allergies;
  final bool anticoagulation;
  final String anticoagulationMedication;
  final String deviceBrands;
  final String implantableDevices;
  final bool increaseEndocarditisRisk;
  final String pregnantRisk;

  ClinicalInfo({
    required this.allergies,
    required this.anticoagulation,
    required this.anticoagulationMedication,
    required this.deviceBrands,
    required this.implantableDevices,
    required this.increaseEndocarditisRisk,
    required this.pregnantRisk,
    required this.uniqueId,
  });

  factory ClinicalInfo.fromJson(Map<String, dynamic> json) {
    return ClinicalInfo(
      allergies: json['allergies'],
      anticoagulation: json['anticoagulation'],
      anticoagulationMedication: json['anticoagulationMedication'],
      deviceBrands: json['deviceBrands'],
      implantableDevices: json['implantableDevices'],
      increaseEndocarditisRisk: json['increaseEndocarditisRisk'],
      pregnantRisk: json['pregnantRisk'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'allergies': allergies,
    'anticoagulation': anticoagulation,
    'anticoagulationMedication': anticoagulationMedication,
    'deviceBrands': deviceBrands,
    'implantableDevices': implantableDevices,
    'increaseEndocarditisRisk': increaseEndocarditisRisk,
    'pregnantRisk': pregnantRisk,
    'uniqueId': uniqueId,
  };
}