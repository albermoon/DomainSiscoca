import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medication_model.g.dart';

@JsonSerializable()
class MedicationModel extends Equatable {

  const MedicationModel({
    required this.id,
    required this.name, 
    required this.description,
    required this.amount, 
    required this.hour, 
    required this.howLong, 
    required this.selectedDays, 
  });

  final String id;
  final String name;
  final String? description;
  final String amount;
  final DateTime hour;
  final DateTime howLong;
  final List<int> selectedDays;

  factory MedicationModel.fromJson(Map<String, dynamic> json) =>_$MedicationModelFromJson(json);
  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$MedicationModelToJson(this);
  
  @override
  @override
  List<Object?> get props => [
    id,
    name,
    description,
    amount,
    hour,
    howLong,
    selectedDays
  ];

}