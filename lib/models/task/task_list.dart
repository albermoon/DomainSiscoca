import 'task_item.dart';

class TaskList {
  final List<TaskItem> items;

  TaskList({required this.items});

  factory TaskList.fromJson(List<dynamic> json) {
    return TaskList(
      items: json.map((item) => TaskItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return items.map((item) => item.toJson()).toList();
  }
}