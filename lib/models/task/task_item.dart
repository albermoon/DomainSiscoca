import '_task.dart';

class TaskItem {
  final String createdAt;
  final DateTime? dueDate;
  final int id;
  final bool isGlobalTask;
  final int isOneTime;
  final int? patientId;
  final int status;
  final Task task;
  final int taskId;

  TaskItem({
    required this.createdAt,
    this.dueDate,
    required this.id,
    required this.isGlobalTask,
    required this.isOneTime,
    this.patientId,
    required this.status,
    required this.task,
    required this.taskId,
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      createdAt: json['created_at'] as String,
      dueDate: json['due_date'] != null ? DateTime.parse(json['due_date'] as String) : null,
      id: json['id'] as int, 
      isGlobalTask: json['is_global_task'] as bool,
      isOneTime: json['is_one_time'] as int? ?? 0,
      patientId: json['patient_id'] as int?,
      status: json['status'] as int,
      taskId: json['task_id'] as int,
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'due_date': dueDate?.toIso8601String(),
      'id': id,
      'is_global_task': isGlobalTask,
      'is_one_time': isOneTime,
      'patient_id': patientId,
      'status': status,
      'task': task.toJson(),
      'task_id': taskId,
    };
  }
}