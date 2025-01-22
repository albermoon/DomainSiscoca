import 'package:domain/models/models.dart';

abstract class IAlertRepository {
  /// Retrieves all alerts from the data source
  Future<List<Alert>> getAlerts();

  /// Creates a new alert record
  Future<Alert> createAlert(Alert alert);

  /// Updates an existing alert's information
  Future<Alert> updateAlert(String id, Alert alert);

  /// Deletes an alert record by ID
  Future<void> deleteAlert(String id);

  /// Retrieves all alerts for a specific patient
  Future<List<Alert>> getPatientAlerts(int patientId);

  /// Marks an alert as read by a specific doctor
  Future<Alert> markAsRead(String id, int doctorId);
}