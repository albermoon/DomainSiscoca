import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ITask extends Equatable {
  final int idTask;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime deadline;
  final DateTime startDate;
  final String type;
  final List<ScheduledNotification> notifications;
  final bool isActive;

  ITask({
    required this.idTask,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.deadline,
    required this.startDate,
    required this.type,
    List<ScheduledNotification>? notifications,
    this.isActive = false,
  }) : notifications = notifications ?? [];

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  factory ITask.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props {
    return [
      idTask,
      title,
      description,
      isCompleted,
      deadline,
      startDate,
      type,
      notifications,
      isActive,
    ];
  }
}
