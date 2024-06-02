// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:domain/domain.dart';

class Habit extends ITask {

  Habit({
    required super.idTask,
    required super.title,
    required super.description,
    required super.isCompleted,
    required super.deadline,
    required super.startDate,
    required super.type,
    required super.notifications,
  });

  ITask copyWith({
    int? idTask,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? deadline,
    DateTime? startDate,
    String? type,
    List<ScheduledNotification>? notifications,
  }) {
    return Habit(
      idTask: idTask ?? super.idTask,
      title: title ?? super.title,
      description: description ?? super.description,
      isCompleted: isCompleted ?? super.isCompleted,
      deadline: deadline ?? super.deadline,
      startDate: startDate ?? super.startDate,
      type: type ?? super.type,
      notifications: notifications ?? super.notifications,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTask': idTask,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'deadline': deadline.millisecondsSinceEpoch,
      'startDate': startDate.millisecondsSinceEpoch,
      'type': type,
      'notifications': notifications.map((x) => x.toMap()).toList(),
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      idTask: map['idTask'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
      deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline'] as int),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      type: map['type'] as String,
      notifications: List<ScheduledNotification>.from((map['notifications'])
        .map<ScheduledNotification>((x) => ScheduledNotification.fromMap(x as Map<String,dynamic>),),),
    );
  }

}
