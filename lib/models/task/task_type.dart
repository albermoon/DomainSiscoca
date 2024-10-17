class TaskType {
  final int id;
  final String name;

  TaskType({required this.id, required this.name});

  factory TaskType.fromJson(Map<String, dynamic> json) {
    return TaskType(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}