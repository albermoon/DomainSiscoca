import 'index.dart';

class TaskItem {
  final String createdAt;
  final DateTime? dueDate;
  final int id;
  final String? patientId;
  final int status;
  final Task task;

  TaskItem({
    required this.createdAt,
    this.dueDate,
    required this.id,
    this.patientId,
    required this.status,
    required this.task
  });

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      createdAt: json['created_at'] as String,
      dueDate: json['due_date'] != null ? DateTime.parse(json['due_date'] as String) : null,
      id: json['id'] as int, 
      patientId: json['patient_id'] as String?,
      status: json['status'] as int,
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'due_date': dueDate?.toIso8601String(),
      'id': id,
      'patient_id': patientId,
      'status': status,
      'task': task.toJson()
    };
  }
}