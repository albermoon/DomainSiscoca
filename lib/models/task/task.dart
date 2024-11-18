import 'package:domain/domain.dart';

class Task {
  final int? id;
  final String name;
  final String advertisement;
  final int assignedTasks;
  final int createdById;
  final String description;
  final TaskType taskType;
  final int taskTypeId;
  final String createdAt;
  final String updatedAt;
  final TaskDetails details;
  final int status;

  Task({
    required this.advertisement,
    required this.assignedTasks,
    required this.createdAt,
    required this.createdById,
    required this.description,
    this.id,
    required this.name,
    required this.status,
    required this.taskType,
    required this.taskTypeId,
    required this.updatedAt,
    required this.details,
  });

  Task copyWith({
    int? id,
    String? name,
    String? advertisement,
    int? assignedTasks,
    int? createdById,
    String? description,
    TaskType? taskType,
    int? taskTypeId,
    String? createdAt,
    String? updatedAt,
    TaskDetails? details,
    int? status,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      advertisement: advertisement ?? this.advertisement,
      assignedTasks: assignedTasks ?? this.assignedTasks,
      createdById: createdById ?? this.createdById,
      description: description ?? this.description,
      taskType: taskType ?? this.taskType,
      taskTypeId: taskTypeId ?? this.taskTypeId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      details: details ?? this.details,
      status: status ?? this.status,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    var taskType = TaskType.fromJson(json['task_type'] as Map<String, dynamic>);
    late TaskDetails details;

    switch (taskType.name) {
      case 'walk':
        details = WalkTaskDetails.fromJson(json);
        break;
      case 'survey':
        details = SurveyTaskDetails.fromJson(json);
        break;
      default:
        throw Exception('Unknown task type: ${taskType.name}');
    }

    return Task(
      advertisement: json['advertisement'] as String? ?? '',
      assignedTasks: json['assigned_tasks'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      createdById: json['created_by_id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      taskType: taskType,
      taskTypeId: json['task_type_id'] as int? ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      details: details,
    );
  }

  Map<String, Object> toJson() {
    return {
      'advertisement': advertisement,
      'assigned_tasks': assignedTasks,
      'created_at': createdAt,
      'created_by_id': createdById,
      'description': description,
      if (id != null) 'id': id!,
      'name': name,
      'status': status,
      'task_type': taskType.toJson(),
      'task_type_id': taskTypeId,
      'updated_at': updatedAt,
      ...details.toJson(),
    };
  }
}
