
import 'package:domain/domain.dart';

class Routine extends IRoutine {
  
  Routine({
    required super.id,
    required super.imageUri,
    required super.name,
    super.reminders,
    required super.habits,
    required super.tasks,
    required super.description
  });

  Routine copyWith({
    int? id,
    String? imageUri,
    String? name,
    List<ScheduledNotification>? reminders,
    List<Habit>? habits,
    List<TaskRoutine>? tasks,
    String? description,
  }) {
    return Routine(
      id: id ?? super.id,
      imageUri: imageUri ?? super.imageUri,
      name: name ?? super.name,
      reminders: reminders ?? super.reminders,
      habits: habits ?? super.habits,
      tasks: tasks ?? super.tasks,
      description: description ?? super.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUri': imageUri,
      'name': name,
      'reminders': reminders?.map((e) => e.toMap()).toList(),
      'habits': habits.map((e) => e.toMap()).toList(),
      'tasks': tasks.map((e) => e.toMap()).toList(),
      'description': description,
    };
  }

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      id: map['id'],
      imageUri: map['imageUri'],
      name: map['name'],
      reminders: map['reminders'] != null ? List<ScheduledNotification>.from((map['reminders'])
        .map<ScheduledNotification>((x) => ScheduledNotification.fromMap(x as Map<String,dynamic>))) : null,
      habits: List<Habit>.from((map['habits']).map<Habit>((x) => Habit.fromMap(x))),
      tasks: List<TaskRoutine>.from((map['tasks']).map<TaskRoutine>((x) => TaskRoutine.fromMap(x))),
      description: map['description'],
    );
  }
  
}