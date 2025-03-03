import 'package:domain/models/models.dart';

abstract class MedicationRepository {
  Future<List<Medication>> getMedicationsByPatientId(String patientId);
  Future<Medication> getMedicationById(String id);
  Future<void> addMedication(Medication medication);
  Future<void> updateMedication(Medication medication);
  Future<void> deleteMedication(String id);
}