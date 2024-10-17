import 'package:domain/domain.dart';

abstract class MedicalPassportRepository {
  Future<(MedicalPassport?, String)> getMedicalPassport(String patientId);
  Future<void> createMedicalPassport(MedicalPassport passport);
  Future<void> updateMedicalPassport(MedicalPassport passport);
  Future<void> deleteMedicalPassport(String patientId);
}