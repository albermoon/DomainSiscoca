import 'package:domain/models/task/index.dart';

class TaskResponse {
  final int? id;
  final int taskId;
  final String patientId;
  final Task? task;
  final DateTime? completedAt;
  final TaskResponseDetails details;

  TaskResponse({
    this.id,
    required this.taskId,
    required this.patientId,
    this.task,
    this.completedAt,
    required this.details,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    late TaskResponseDetails details;

    if (json.containsKey('answers')) {
      details = SurveyTaskResponseDetails.fromJson(json);
    } else if (json.containsKey('distance')) {
      details = WalkTaskResponseDetails.fromJson(json);
    } else {
      throw Exception('Unknown task response type');
    }

    return TaskResponse(
      id: json['id'] as int,
      taskId: json['task_id'] as int,
      patientId: json['patient_id'] as String,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
      details: details,
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'patient_id': patientId,
      ...details.toJson(),
    };
  }
}

abstract class TaskResponseDetails {
  Map<String, dynamic> toJson();
}

