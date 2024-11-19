class Procedure {
  final String description;
  final int? uniqueId;

  Procedure({
    required this.description,
    this.uniqueId,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    return Procedure(
      description: json['description'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    if (uniqueId != null) 'uniqueId': uniqueId,
  };

  Procedure copyWith({
    String? description,
    int? uniqueId,
  }) {
    return Procedure(
      description: description ?? this.description,
      uniqueId: uniqueId ?? this.uniqueId,
    );
  }
}
