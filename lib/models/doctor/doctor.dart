class Doctor {
  int id;
  String email;
  int isAdmin;
  String name;
  String surname;

  Doctor({
    required this.id,
    required this.email,
    required this.isAdmin,
    required this.name,
    required this.surname,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      isAdmin: json['is_admin'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'is_admin': isAdmin,
      'name': name,
      'surname': surname,
    };
  }

  Doctor copyWith({
    int? id,
    String? email,
    int? isAdmin,
    String? name,
    String? surname,
  }) {
    return Doctor(
      id: id ?? this.id,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }
}
