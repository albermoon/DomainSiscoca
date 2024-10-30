import 'package:domain/domain.dart';

class TaskRoutine extends ITask {
  TaskRoutine({
    required super.idTask,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.deadline,
    required super.startDate,
    required super.type,
    List<ScheduledNotification>? notifications,
  }) : super(notifications: notifications ?? []);

  TaskRoutine copyWith({
    int? idTask,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? deadline,
    DateTime? startDate,
    String? type,
    List<ScheduledNotification>? notifications,
    bool? isActive,
  }) {
    return TaskRoutine(
      idTask: idTask ?? this.idTask,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      deadline: deadline ?? this.deadline,
      startDate: startDate ?? this.startDate,
      type: type ?? this.type,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'idTask': idTask,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'deadline': deadline.toIso8601String(),
      'startDate': startDate.toIso8601String(),
      'type': type,
      'notifications': notifications.map((x) => x.toMap()).toList(),
      'isActive': isActive,
    };
    return map;
  }

  factory TaskRoutine.fromMap(Map<String, dynamic> map) {
    return TaskRoutine(
      idTask: map['idTask'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
      deadline: map['deadline'] is String
        ? DateTime.parse(map['deadline'])
        : map['deadline'] as DateTime,
      startDate: map['startDate'] is String
        ? DateTime.parse(map['startDate'])
        : map['startDate'] as DateTime,
      type: map['type'] as String,
      notifications: map['notifications'] != null
        ? List<ScheduledNotification>.from(
            (map['notifications'] as List).map((x) {
              if (x is ScheduledNotification) {
                return x;
              }
              return ScheduledNotification.fromMap(x as Map<String, dynamic>);
            }),
          )
        : [],
    );
  }
}
