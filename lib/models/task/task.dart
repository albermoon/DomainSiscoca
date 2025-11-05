import 'package:domain/domain.dart';

class Task {
  final int? id;
  final String name;
  //show a alert message in the mobile
  final String? advertisement;
  final int? assignedTasks;
  final String? createdById;
  final String description;
  final TaskType? taskType;
  final int taskTypeId;
  final int? recurrence_interval;
  //json with the survey
  final TaskDetails details;
  final String? createdAt;
  final String? updatedAt;
  final int? status;

  Task({
    required this.name,
    required this.details,
    required this.description,
    this.advertisement,
    this.assignedTasks,
    this.createdById,
    this.id,
    this.status,
    this.taskType,
    this.recurrence_interval,
    required this.taskTypeId,
    this.createdAt,
    this.updatedAt,
  });

  Task copyWith({
    int? id,
    String? name,
    String? advertisement,
    int? assignedTasks,
    String? createdById,
    String? description,
    int? recurrence_interval,
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
      recurrence_interval: recurrence_interval ?? this.recurrence_interval,
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
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      advertisement: json['advertisement'] as String? ?? '',
      assignedTasks: json['assigned_tasks'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      createdById: json['created_by_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      recurrence_interval: json['recurrence_interval'] as int?,
      status: json['status'] as int? ?? 0,
      taskType: taskType,
      taskTypeId: json['task_type_id'] as int? ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      details: details,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id!,
      'name': name,
      if (advertisement != null) 'advertisement': advertisement!,
      if (assignedTasks != null) 'assigned_tasks': assignedTasks!,
      if (createdById != null) 'created_by_id': createdById!,
      'description': description,
      if (taskType != null) 'task_type': taskType!.toJson(),
      'task_type_id': taskTypeId,
      if (createdAt != null) 'created_at': createdAt!,
      if (updatedAt != null) 'updated_at': updatedAt!,
      if (status != null) 'status': status!,
      if (recurrence_interval != null) 'recurrence_interval': recurrence_interval!,
      ...details.toJson(),
    };
  }
}
