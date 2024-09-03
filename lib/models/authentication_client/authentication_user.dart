import 'package:equatable/equatable.dart';

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}
  const AuthenticationUser({
    required this.id,
    required this.dbId,
    this.email,
    this.name,
    this.photo,
    this.isNewUser = true,
    this.birthDate,
    this.device,
    this.patientNumber,
    this.sex,
    this.surname,
  });

  final String id;
  final String dbId;
  final String? email;
  final String? name;
  final String? photo;
  final bool isNewUser;
  final String? birthDate;
  final String? device;
  final String? patientNumber;
  final String? sex;
  final String? surname;

  /// Anonymous user which represents an unauthenticated user.
  bool get isAnonymous => this == anonymous;
  static const anonymous = AuthenticationUser(id: '', dbId: '');

  @override
  List<Object> get props => [id];

  AuthenticationUser copyWith({
    String? id,
    String? dbId,
    String? email,
    String? name,
    String? photo,
    bool? isNewUser,
    String? birthDate,
    String? device,
    String? patientNumber,
    String? sex,
    String? surname,
  }) {
    return AuthenticationUser(
      id: id ?? this.id,
      dbId: dbId ?? this.dbId,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      isNewUser: isNewUser ?? this.isNewUser,
      birthDate: birthDate ?? this.birthDate,
      device: device ?? this.device,
      patientNumber: patientNumber ?? this.patientNumber,
      sex: sex ?? this.sex,
      surname: surname ?? this.surname,
    );
  }
}
