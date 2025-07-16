import 'package:equatable/equatable.dart';

enum MessageScope { all, hospital, study, patient }

class NotificationMessage extends Equatable {
  final int? id;
  final String title;
  final String body;
  final MessageScope scope;
  final String? createdById;
  final DateTime createdAt;
  final List<String>? targetIds;
  final bool isRead;

  const NotificationMessage({
    this.id,
    required this.title,
    required this.body,
    required this.scope,
    this.createdById,
    required this.createdAt,
    this.targetIds,
    this.isRead = false,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) {
    final scopeStr = (json['scope'] ?? 'all').toString();
    return NotificationMessage(
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

  NotificationMessage copyWith({
    int? id,
    String? title,
    String? body,
    MessageScope? scope,
    String? createdById,
    DateTime? createdAt,
    List<String>? targetIds,
    bool? isRead,
  }) {
    return NotificationMessage(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      scope: scope ?? this.scope,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      targetIds: targetIds ?? this.targetIds,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  List<Object?> get props => [id, title, body, scope, createdById, createdAt, targetIds, isRead];
} 