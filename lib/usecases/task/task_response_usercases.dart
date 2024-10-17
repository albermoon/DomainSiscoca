import 'package:domain/domain.dart';

class SendTaskResponseUseCase {
  final TaskResponseRepository repository;

  SendTaskResponseUseCase(this.repository);

  Future<void> call(TaskResponse params) async {
    return await repository.sendTaskResponse(params);
  }
}
