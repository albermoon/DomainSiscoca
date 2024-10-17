class Study {
  final String additionalData;
  final DateTime createdAt;
  final int createdBy;
  final String description;
  final String email;
  final String hospital;
  final int id;
  final String phone;
  final String responsiblePerson;
  final String studyName;
  final DateTime updatedAt;

  Study({
    required this.additionalData,
    required this.createdAt,
    required this.createdBy,
    required this.description,
    required this.email,
    required this.hospital,
    required this.id,
    required this.phone,
    required this.responsiblePerson,
    required this.studyName,
    required this.updatedAt,
  });

  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      additionalData: json['additional_data'],
      createdAt: DateTime.parse(json['created_at']),
      createdBy: json['created_by'],
      description: json['description'],
      email: json['email'],
      hospital: json['hospital'],
      id: json['id'],
      phone: json['phone'],
      responsiblePerson: json['responsible_person'],
      studyName: json['study_name'],
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'additional_data': additionalData,
    'created_at': createdAt.toIso8601String(),
    'created_by': createdBy,
    'description': description,
    'email': email,
    'hospital': hospital,
    'id': id,
    'phone': phone,
    'responsible_person': responsiblePerson,
    'study_name': studyName,
    'updated_at': updatedAt.toIso8601String(),
  };
}