class ResidualLesions {
  final String description;
  final int? uniqueId;

  ResidualLesions({
    required this.description,
    this.uniqueId,
  });

  factory ResidualLesions.fromJson(Map<String, dynamic> json) {
    return ResidualLesions(
      description: json['description'],
      uniqueId: json['uniqueId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    if (uniqueId != null) 'uniqueId': uniqueId,
  };

  ResidualLesions copyWith({
    String? description,
    int? uniqueId,
  }) {
    return ResidualLesions(
      description: description ?? this.description,
      uniqueId: uniqueId ?? this.uniqueId,
    );
  }
}
