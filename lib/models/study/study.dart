class Study {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;
  final String additionalData;
  final int createdBy;
  final String description;
  final String email;
  final String hospital;
  final String phone;
  final String responsiblePerson;
  final String studyName;

  Study({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.status,
    required this.additionalData,
    required this.createdBy,
    required this.description,
    required this.email,
    required this.hospital,
    required this.phone,
    required this.responsiblePerson,
    required this.studyName,
  });

  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      // Nullable fields
      id: json['id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      status: json['status'],
      // Required fields
      additionalData: json['additional_data'],
      createdBy: json['created_by'],
      description: json['description'],
      email: json['email'],
      hospital: json['hospital'],
      phone: json['phone'],
      responsiblePerson: json['responsible_person'],
      studyName: json['study_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        // Nullable fields
         if (id != null) 'id': id,
        'status': status,
        // Required fields
        'additional_data': additionalData,
        'created_by': createdBy,
        'description': description,
        'email': email,
        'hospital': hospital,
        'phone': phone,
        'responsible_person': responsiblePerson,
        'study_name': studyName,
      };

  Study copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? status,
    String? additionalData,
    int? createdBy,
    String? description,
    String? email,
    String? hospital,
    String? phone,
    String? responsiblePerson,
    String? studyName,
  }) {
    return Study(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      additionalData: additionalData ?? this.additionalData,
      createdBy: createdBy ?? this.createdBy,
      description: description ?? this.description,
      email: email ?? this.email,
      hospital: hospital ?? this.hospital,
      phone: phone ?? this.phone,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      studyName: studyName ?? this.studyName,
    );
  }
}