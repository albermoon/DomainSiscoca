import 'package:equatable/equatable.dart';

enum MessageScope { all, hospital, study, patient }

class Message extends Equatable {
  final int? id;
  final String title;
  final String body;
  final MessageScope scope;
  final String? createdById;
  final DateTime createdAt;
  final List<String>? targetIds;

  const Message({
    this.id,
    required this.title,
    required this.body,
    required this.scope,
    this.createdById,
    required this.createdAt,
    this.targetIds,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    final scopeStr = (json['scope'] ?? 'all').toString();
    return Message(
      id: json['id'] as int?,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      scope: MessageScope.values.firstWhere(
        (e) => e.name == scopeStr,
        orElse: () => MessageScope.all,
      ),
      createdById: json['created_by_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      targetIds: (json['target_ids'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'title': title,
        'body': body,
        'scope': scope.name,
        'created_by_id': createdById,
        'created_at': createdAt.toIso8601String(),
        if (targetIds != null) 'target_ids': targetIds,
      };

  @override
  List<Object?> get props => [id, title, body, scope, createdById, createdAt, targetIds];
} 