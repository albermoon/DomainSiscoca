import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class IRoutine extends Equatable {

  final int id;
  final String imageUri;
  final String name;
  final List<ScheduledNotification>? reminders;
  final List<ITask> habits;
  final List<ITask> tasks;
  final String description;
  IRoutine({
    required this.id,
    required this.imageUri,
    required this.name,
    this.reminders,
    required this.habits,
    required this.tasks,
    required this.description,
  });

  @override
  List<Object> get props {
    return [id];
  }

}
