import 'package:equatable/equatable.dart';

class DocumentAttachment extends Equatable {
  final int id;
  final String userId;
  final String uploaderRole;
  final String kind;
  final String displayName;
  final String storedName;
  final String relativePath;
  final String mimeType;
  final int sizeInBytes;
  final DateTime uploadedAt;

  DocumentAttachment({
    required this.id,
    required this.userId,
    required this.uploaderRole,
    required this.kind,
    required this.displayName,
    required this.storedName,
    required this.relativePath,
    required this.mimeType,
    required this.sizeInBytes,
    required this.uploadedAt,
  });

  factory DocumentAttachment.fromJson(Map<String, dynamic> json) =>
      DocumentAttachment(
        id: json['id'],
        userId: json['user_id'],
        uploaderRole: json['uploader_role'],
        kind: json['kind'],
        displayName: json['display_name'],
        storedName: json['stored_name'],
        relativePath: json['relative_path'],
        mimeType: json['mime_type'],
        sizeInBytes: json['size_in_bytes'],
        uploadedAt: DateTime.parse(json['uploaded_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'uploader_role': uploaderRole,
        'kind': kind,
        'display_name': displayName,
        'stored_name': storedName,
        'relative_path': relativePath,
        'mime_type': mimeType,
        'size_in_bytes': sizeInBytes,
        'uploaded_at': uploadedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        uploaderRole,
        kind,
        displayName,
        storedName,
        relativePath,
        mimeType,
        sizeInBytes,
        uploadedAt,
      ];
} 