class UserDevice {
  final int? id;
  final String userId;
  final String fcm;
  final String? language;
  final DateTime? creationDate;
  final DateTime? lastConnection;
  final int? status;

  UserDevice({
    this.id,
    required this.userId,
    required this.fcm,
    this.language,
    this.creationDate,
    this.lastConnection,
    this.status,
  });

  UserDevice copyWith({
    int? id,
    String? userId,
    String? fcm,
    String? language,
    DateTime? creationDate,
    DateTime? lastConnection,
    int? status,
  }) {
    return UserDevice(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fcm: fcm ?? this.fcm,
      language: language ?? this.language,
      creationDate: creationDate ?? this.creationDate,
      lastConnection: lastConnection ?? this.lastConnection,
      status: status ?? this.status,
    );
  }

  factory UserDevice.fromJson(Map<String, dynamic> json) {
    return UserDevice(
      id: json['id'],
      userId: json['user_id'],
      fcm: json['fcm'],
      language: json['language'],
      creationDate: json['creation_date'] != null 
          ? DateTime.parse(json['creation_date'])
          : null,
      lastConnection: json['last_connection'] != null 
          ? DateTime.parse(json['last_connection'])
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'fcm': fcm,
      'language': language
    };
  }

  @override
  String toString() {
    return 'UserDevice(id: $id, userId: $userId, fcm: $fcm, language: $language, creationDate: $creationDate, lastConnection: $lastConnection, status: $status)';
  }

}