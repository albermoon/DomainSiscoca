class Procedure {
  final String description;
  final int uniqueId;

  Procedure({
    required this.description,
    required this.uniqueId,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      description: json['description'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'uniqueId': uniqueId,
  };
}
