import 'package:domain/domain.dart';

abstract class StudyRepository {
  Future<Study?> getAllStudies();
  Future<List<Study>> getStudiesForPatient(int patientId);
  Future<Study?> getStudy(int studyId);
  Future<void> createStudy(Study study);
  Future<void> updateStudy(Study study);
  Future<void> deleteStudy(int studyId);
}