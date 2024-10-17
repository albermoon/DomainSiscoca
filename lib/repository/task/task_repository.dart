
import '../../models/task/_task.dart';

abstract class TaskRepository {
  Future<TaskList> getTasks();
  Future<TaskList> getAssignedTasks(int patientId);
}