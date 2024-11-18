class Pathology {
  final String generalPathology;
  final String specificPathology;
  final int? uniqueId;

  Pathology({
    required this.generalPathology,
    required this.specificPathology,
    this.uniqueId,
  });

  factory Pathology.fromJson(Map<String, dynamic> json) {
    return Pathology(
      generalPathology: json['generalPathology'],
      specificPathology: json['specificPathology'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    if (uniqueId != null) 'uniqueId': uniqueId,
    'generalPathology': generalPathology,
    'specificPathology': specificPathology,
  };
}