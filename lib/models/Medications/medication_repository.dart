
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

  Future<List<MedicationModel>> getMedication();

  addMedications(MedicationModel medication);

  deleteMedication(MedicationModel medication);

}

class MediciationRepositoryImplementation extends MedicationRepository{

  final List<MedicationModel> medications = [];

  @override
  addMedications(MedicationModel medication) {
    try{
      medications.add(medication);
      return medications;
    }catch(error, stackTrace){
      Error.throwWithStackTrace(AddMedicationsFailure(error), stackTrace);
    }
  }

  @override
  deleteMedication(MedicationModel medication) {
    medications.removeWhere((element) => element.id == medication.id);
    return medications;
  }
  
  @override
  Future<List<MedicationModel>> getMedication() {
    // TODO: implement getMedication
    throw UnimplementedError();
  }


}