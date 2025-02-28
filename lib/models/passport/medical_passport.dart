import 'package:domain/models/models.dart';

class MedicalPassport {
  final int? id;
  final String? doctorId;
  final String patientId;
  final ClinicalInfo? clinicalInfo;
  final String documentsOthers;
  final List<Medication> medications;
  final Pathology pathology;
  final List<PatientConstant> patientConstants;
  final List<Procedure> procedures;
  final List<ResidualLesions> residualLesions;
  final List<Study> studies;
  final List<int>? studyIdList;
  final DateTime? createdAt;
  final DateTime?updatedAt;

  MedicalPassport({
    this.id,
    this.clinicalInfo,
    this.doctorId,
    required this.documentsOthers,
    required this.medications,
    required this.pathology,
    required this.patientConstants,
    required this.patientId,
    required this.procedures,
    required this.residualLesions,
    required this.studies,
    this.studyIdList,
    this.createdAt,
    this.updatedAt,
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
      patientId: json['patient_id'].toString(),
      procedures: List<Procedure>.from(json['procedures'].map((x) => Procedure.fromJson(x))),
      residualLesions: List<ResidualLesions>.from(json['residual_lesions'].map((x) => ResidualLesions.fromJson(x))),
      studies: List<Study>.from(json['studies'].map((x) => Study.fromJson(x))),
      updatedAt: DateTime.parse(json['updated_at']),
      studyIdList: List<int>.from(json['study_id_list']),
    );
  }

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    if (clinicalInfo != null)  'clinical_info': clinicalInfo!.toJson(),
    'doctor_id': doctorId,
    'documents_others': documentsOthers,
    'medications': medications.map((x) => x.toJson()).toList(),
    'pathology': pathology.toJson(),
    'patient_constants': patientConstants.map((x) => x.toJson()).toList(),
    'patient_id': patientId,
    'procedures': procedures.map((x) => x.toJson()).toList(),
    'residual_lesions': residualLesions.map((x) => x.toJson()).toList(),
    // 'studies': studies.map((x) => x.toJson()).toList(),
    'study_id_list': studyIdList,
  };

  MedicalPassport copyWith({
    int? id,
    String? doctorId,
    String? patientId,
    ClinicalInfo? clinicalInfo,
    String? documentsOthers,
    List<Medication>? medications,
    Pathology? pathology,
    List<PatientConstant>? patientConstants,
    List<Procedure>? procedures,
    List<ResidualLesions>? residualLesions,
    List<Study>? studies,
    List<int>? studyIdList,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MedicalPassport(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      patientId: patientId ?? this.patientId,
      clinicalInfo: clinicalInfo ?? this.clinicalInfo,
      documentsOthers: documentsOthers ?? this.documentsOthers,
      medications: medications ?? this.medications,
      pathology: pathology ?? this.pathology,
      patientConstants: patientConstants ?? this.patientConstants,
      procedures: procedures ?? this.procedures,
      residualLesions: residualLesions ?? this.residualLesions,
      studies: studies ?? this.studies,
      studyIdList: studyIdList ?? this.studyIdList,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
