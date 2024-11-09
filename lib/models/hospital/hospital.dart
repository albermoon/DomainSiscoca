class Hospital {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String address;
  final String city;
  final String email;
  final String name;
  final String phone;
  final String responsiblePerson;
  final String service;

  Hospital({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.address,
    required this.city,
    required this.email,
    required this.name,
    required this.phone,
    required this.responsiblePerson,
    required this.service,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      address: json['address'],
      city: json['city'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      responsiblePerson: json['responsible_person'],
      service: json['service'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'service': service,
      'responsible_person': responsiblePerson,
      'address': address,
      'city': city,
      'phone': phone,
      'email': email,
      if (id != null) 'id': id,
    };
  }

  Hospital copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? address,
    String? city,
    String? email,
    String? name,
    String? phone,
    String? responsiblePerson,
    String? service,
  }) {
    return Hospital(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      address: address ?? this.address,
      city: city ?? this.city,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
      service: service ?? this.service,
    );
  }
}