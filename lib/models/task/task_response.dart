import 'package:domain/models/task/index.dart';

class TaskResponse {
  final int? id;
  final int taskId;
  final String patientId;
  final Task? task;
  final DateTime? completedAt;
  final TaskTypeResponse? taskType;
  final TaskResponseDetails? details;

  TaskResponse({
    this.id,
    required this.taskId,
    required this.patientId,
    this.task,
    this.completedAt,
    this.taskType,
    this.details,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) {
    TaskTypeResponse? taskType;
    if (json['task_type'] != null) {
      taskType = TaskTypeResponse.fromJson(json['task_type'] as Map<String, dynamic>);
    }

    TaskResponseDetails? details;
    
    // Determinar el tipo de details basándose en el taskType si está disponible
    if (taskType != null) {
      switch (taskType.name.toLowerCase()) {
        case 'survey':
          if (json.containsKey('answers')) {
            details = SurveyTaskResponseDetails.fromJson(json);
          }
          break;
        case 'walk':
          if (json.containsKey('distance')) {
            details = WalkTaskResponseDetails.fromJson(json);
          }
          break;
        default:
          // Si no conocemos el tipo, intentar detectar por las claves existentes
          if (json.containsKey('answers')) {
            details = SurveyTaskResponseDetails.fromJson(json);
          } else if (json.containsKey('distance')) {
            details = WalkTaskResponseDetails.fromJson(json);
          }
      }
    } else {
      // Fallback: intentar detectar por las claves existentes si no hay taskType
      if (json.containsKey('answers')) {
        details = SurveyTaskResponseDetails.fromJson(json);
      } else if (json.containsKey('distance')) {
        details = WalkTaskResponseDetails.fromJson(json);
      }
    }

    // Parse task from 'task_base'
    Task? task;
    if (json['task_base'] != null && taskType != null) {
      final taskBase = json['task_base'] as Map<String, dynamic>;
      task = Task(
        id: json['task_id'] as int,
        name: taskBase['name'] as String,
        description: taskBase['description'] as String,
        advertisement: taskBase['advertisement'] as String?,
        recurrence_interval: taskBase['recurrence_interval'] as int?,
        taskTypeId: taskBase['task_type_id'] as int,
        status: taskBase['status'] as int?,
        taskType: TaskType.fromJson(json['task_type'] as Map<String, dynamic>),
        // Details is null - will be loaded on demand if needed
        details: null,
      );
    }

    return TaskResponse(
      id: json['id'] as int?,
      taskId: json['task_id'] as int,
      patientId: json['patient_id'] as String,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
      taskType: taskType,
      details: details,
      task: task,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'task_id': taskId,
      'patient_id': patientId,
      if (taskType != null) 'task_type': taskType!.toJson(),
      if (details != null) ...details!.toJson(),
    };
  }
}

abstract class TaskResponseDetails {
  Map<String, dynamic> toJson();
}
