
import 'package:domain/models/Medications/medication_model.dart';
import 'package:equatable/equatable.dart';

abstract class MedicationFailure with EquatableMixin implements Exception {
  const MedicationFailure(this.error);

  final Object error;

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class FetchMedicationsFailure extends MedicationFailure {
  const FetchMedicationsFailure (super.error);
}

class AddMedicationsFailure extends MedicationFailure {
  const AddMedicationsFailure (super.error);
}

class DeleteMedicationsFailure extends MedicationFailure  {
  const DeleteMedicationsFailure (super.error);
}

abstract class  MedicationRepository {

  Future<MedicationModel> getMedication();

  Future<void> addMedications(MedicationModel medication);

  Future<void> deleteMedication(MedicationModel medication);

}