import 'package:domain/models/task/index.dart';

abstract class TaskRepository {
  Future<TaskList> getTasks();
  Future<TaskList> getAssignedTasks(String patientId);
}