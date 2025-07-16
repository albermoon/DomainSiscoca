import 'package:domain/models/models.dart';

abstract class NotificationsRepository {

  Stream<Notification> get notificationStream;
  Future<void> init();
  Future<void> requestPermissions();
  Future<bool> isPermissionGranted();

  Future<void> saveNotification(Notification notification);
  Future<void> showImmediateNotification(Notification notification);
  List<Notification> getUnreadNotifications();
  Future<List<Notification>> getNotifications();
  List<Notification> getPendingNotifications();

  Future<bool> isNotificationTypeEnabled(NotificationType type);
  
  Future<void> activateLocalNotificacion(List<dynamic> noti);
  Future<void> desactivateLocalNotification(List<dynamic> noti);

  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
  Future<void> removeNotification(String id);
  Future<void> clearAllNotifications();
  
  Future<void> registerDeviceAfterLogin(String userId);
}