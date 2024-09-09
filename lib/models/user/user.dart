import 'package:domain/models/models.dart';
import 'package:equatable/equatable.dart';

class User  extends Equatable{
  final String id;
  final int? patientId;
  final String? email;
  final String? name;
  final String? surname;
  final bool isNewUser;
  final DateTime? birthDate;
  final String? device;
  final String? patientNumber;
  final String? sex;

  const User({
    required this.id,
    this.patientId,
    this.email,
    this.name,
    this.surname,
    this.isNewUser = true,
    this.birthDate,
    this.device,
    this.patientNumber,
    this.sex,
  });
  

  bool get isAnonymous => this == User.anonymous;

  static const User anonymous = User(
    id: '',
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // id: json['id'],
      // patientId:json['id'],
      id: json['id'] != null ? json['id'].toString() : '',
      patientId: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      isNewUser: json['isNewUser'] ?? true,
      birthDate: json['birth_date'] != null ? DateTime.parse(json['birth_date']) : null,
      device: json['device'],
      patientNumber: json['patientNumber'],
      sex: json['sex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'id': patientId,
      'email': email,
      'name': name,
      'surname': surname,
      'isNewUser': isNewUser,
      'birthDate': birthDate?.toIso8601String(),
      'device': device,
      'patientNumber': patientNumber,
      'sex': sex,
    };
  }

  factory User.fromAuthenticationUser({
    required AuthenticationUser authenticationUser,
    int? patientId,
    String? surname,
    DateTime? birthDate,
    String? device,
    String? patientNumber,
    String? sex,
  }) {
    return User(
      id: authenticationUser.id,
      patientId: patientId,
      email: authenticationUser.email,
      name: authenticationUser.name,
      surname: surname,
      isNewUser: authenticationUser.isNewUser,
      birthDate: birthDate,
      device: device,
      patientNumber: patientNumber,
      sex: sex,
    );
  }
  
  @override
  List<Object?> get props => [ id, patientId, email, name, surname, isNewUser, birthDate, device, patientNumber, sex ];
}