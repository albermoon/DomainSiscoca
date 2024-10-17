class Pathology {
  final String generalPathology;
  final String specificPathology;
  final int uniqueId;

  Pathology({
    required this.generalPathology,
    required this.specificPathology,
    required this.uniqueId,
  });

  factory Pathology.fromJson(Map<String, dynamic> json) {
    return Pathology(
      generalPathology: json['generalPathology'],
      specificPathology: json['specificPathology'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'generalPathology': generalPathology,
    'specificPathology': specificPathology,
    'uniqueId': uniqueId,
  };
}