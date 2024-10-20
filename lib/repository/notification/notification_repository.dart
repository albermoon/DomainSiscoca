import 'package:domain/models/models.dart';

abstract class NotificationsRepository {

  Stream<Notification> get notificationStream;
  Future<List<Notification>> getNotifications();
  Future<void> addNotification(Notification notification);
  Future<void> removeNotification(String id);
  Future<void> markAsRead(String id);

}