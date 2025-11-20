class TaskTypeResponse {
  final int id;
  final String name;

  TaskTypeResponse({required this.id, required this.name});

  factory TaskTypeResponse.fromJson(Map<String, dynamic> json) {
    return TaskTypeResponse(
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

