class Doctor {
  final int? id;
  final int? status;
  final String email;
  final int isAdmin;
  final String name;
  final String surname;

  Doctor({
    this.id,
    this.status,
    required this.email,
    required this.isAdmin,
    required this.name,
    required this.surname,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      // Nullable fields
      id: json['id'],
      status: json['status'] ?? 1,
      // Required fields
      email: json['email'] ?? '',
      isAdmin: json['is_admin'] ?? 0,
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    // Nullable fields
     if (id != null) 'id': id,
    
    // Required fields
    'email': email,
    'is_admin': isAdmin,
    'name': name,
    'surname': surname,
  };

  Doctor copyWith({
    int? id,
    int? status,
    String? email,
    int? isAdmin,
    String? name,
    String? surname,
  }) {
    return Doctor(
      id: id ?? this.id,
      status: status ?? this.status,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}