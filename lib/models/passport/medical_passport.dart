import 'package:domain/models/models.dart';

class MedicalPassport {
  final ClinicalInfo clinicalInfo;
  final int doctorId;
  final String documentsOthers;
  final int id;
  final List<Medication> medications;
  final Pathology pathology;
  final List<PatientConstant> patientConstants;
  final int patientId;
  final List<Procedure> procedures;
  final ResidualLesions residualLesions;
  final List<Study> studies;
  final List<int> studyIdList;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalPassport({
    required this.clinicalInfo,
    required this.createdAt,
    required this.doctorId,
    required this.documentsOthers,
    required this.id,
    required this.medications,
    required this.pathology,
    required this.patientConstants,
    required this.patientId,
    required this.procedures,
    required this.residualLesions,
    required this.studies,
    required this.studyIdList,
    required this.updatedAt,
  });

  factory MedicalPassport.fromJson(Map<String, dynamic> json) {
    return MedicalPassport(
      clinicalInfo: ClinicalInfo.fromJson(json['clinical_info']),
      createdAt: DateTime.parse(json['created_at']),
      doctorId: json['doctor_id'],
      documentsOthers: json['documents_others'],
      id: json['id'],
      medications: List<Medication>.from(json['medications'].map((x) => Medication.fromJson(x))),
      pathology: Pathology.fromJson(json['pathology']),
      patientConstants: List<PatientConstant>.from(json['patient_constants'].map((x) => PatientConstant.fromJson(x))),
      patientId: json['patient_id'],
      procedures: List<Procedure>.from(json['procedures'].map((x) => Procedure.fromJson(x))),
      residualLesions: ResidualLesions.fromJson(json['residual_lesions']),
      studies: List<Study>.from(json['studies'].map((x) => Study.fromJson(x))),
      studyIdList: List<int>.from(json['study_id_list']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'clinical_info': clinicalInfo.toJson(),
    'created_at': createdAt.toIso8601String(),
    'doctor_id': doctorId,
    'documents_others': documentsOthers,
    'id': id,
    'medications': medications.map((x) => x.toJson()).toList(),
    'pathology': pathology.toJson(),
    'patient_constants': patientConstants.map((x) => x.toJson()).toList(),
    'patient_id': patientId,
    'procedures': procedures.map((x) => x.toJson()).toList(),
    'residual_lesions': residualLesions.toJson(),
    'studies': studies.map((x) => x.toJson()).toList(),
    'study_id_list': studyIdList,
    'updated_at': updatedAt.toIso8601String(),
  };
}
