import 'package:domain/models/authentication_client/authentication_user.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? surname;
  final bool isNewUser;
  final String? birthDate;
  final String? device;
  final String? patientNumber;
  final String? sex;

  const User({
    this.id,
    this.email,
    this.name,
    this.surname,
    this.isNewUser = true,
    this.birthDate,
    this.device,
    this.patientNumber,
    this.sex,
  });

  // Representa un usuario no autenticado
  static const anonymous = User(id: '');

  factory User.fromJson(Map<String, dynamic> json) {
    String? birthDateFormatted;
    if (json['birth_date'] != null) {
      final parts = json['birth_date'].toString().split('-');
      if (parts.length == 3) {
        birthDateFormatted = '${parts[2]}-${parts[1]}-${parts[0]}';
      }
    }

    return User(
      id: json['id'] != null ? json['id'].toString() : '',
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      isNewUser: json['isNewUser'] ?? true,
      birthDate: birthDateFormatted,
      device: json['device'],
      patientNumber: json['num_patient'],
      sex: json['sex'],
    );
  }

  Map<String, dynamic> toJson() {
    String? formattedDate;
    if (birthDate != null) {
      final parts = birthDate!.split('/');
      if (parts.length == 3) {
        formattedDate = '${parts[2]}-${parts[1]}-${parts[0]}';
      }
    }

    final json = {
      if (id != null) 'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'birth_date': formattedDate,
      'num_patient': patientNumber,
      'sex': sex,
    };
    print('Patient JSON: $json');
    return json;
  }

  factory User.fromAuthenticationUser({
    required AuthenticationUser authenticationUser,
    String? surname,
    String? birthDate,
    String? device,
    String? patientNumber,
    String? sex,
  }) {
    return User(
      id: authenticationUser.id,
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
  List<Object?> get props => [
        id,
        email,
        name,
        surname,
        isNewUser,
        birthDate,
        device,
        patientNumber,
        sex
      ];
}