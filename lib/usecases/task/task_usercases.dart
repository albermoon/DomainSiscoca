import 'package:domain/domain.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<TaskList> execute() {
    return repository.getTasks();
  }
}