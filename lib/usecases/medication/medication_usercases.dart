
import 'package:domain/domain.dart';

class GetMedications {
  final MedicationRepository repository;

  GetMedications(this.repository);

  Future<List<Medication>> call() async {
    return await repository.getMedications();
  }
}

class GetMedicationById {
  final MedicationRepository repository;

  GetMedicationById(this.repository);

  Future<Medication> call(String id) async {
    return await repository.getMedicationById(id);
  }
}

class AddMedication {
  final MedicationRepository repository;

  AddMedication(this.repository);

  Future<void> call(Medication medication) async {
    return await repository.addMedication(medication);
  }
}

class UpdateMedication {
  final MedicationRepository repository;

  UpdateMedication(this.repository);

  Future<void> call(Medication medication) async {
    return await repository.updateMedication(medication);
  }
}

class DeleteMedication {
  final MedicationRepository repository;

  DeleteMedication(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteMedication(id);
  }
}