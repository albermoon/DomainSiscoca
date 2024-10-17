import 'package:domain/domain.dart';

abstract class MedicalPassportRepository {
  Future<MedicalPassport?> getMedicalPassport(int patientId);
  Future<void> createMedicalPassport(MedicalPassport passport);
  Future<void> updateMedicalPassport(MedicalPassport passport);
  Future<void> deleteMedicalPassport(int patientId);
}