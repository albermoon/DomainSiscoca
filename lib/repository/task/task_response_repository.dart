import 'package:domain/domain.dart';

abstract class TaskResponseRepository {
  Future<void> sendTaskResponse(TaskResponse response);
  Future<List<TaskResponse>> getTaskResponse(String patientId);
}