import 'package:domain/models/models.dart';

abstract class IAlertThresholdRepository {
  /// Retrieves all alert thresholds from the data source
  Future<List<AlertThreshold>> getAlertThresholds();

  /// Creates a new alert threshold record
  Future<AlertThreshold> createAlertThreshold(AlertThreshold threshold);

  /// Updates an existing alert threshold's information
  Future<AlertThreshold> updateAlertThreshold(String id, AlertThreshold threshold);

  /// Deletes an alert threshold record by ID
  Future<void> deleteAlertThreshold(String id);

  /// Retrieves all thresholds for a specific patient
  Future<List<AlertThreshold>> getThresholdsByPatient(int patientId);
}