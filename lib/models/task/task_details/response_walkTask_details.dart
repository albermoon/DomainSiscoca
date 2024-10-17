import 'package:domain/models/task/task_response.dart';

class WalkTaskResponseDetails implements TaskResponseDetails {
  final double distance;
  final int duration;
  final int steps;

  WalkTaskResponseDetails({
    required this.distance,
    required this.duration,
    required this.steps,
  });

  factory WalkTaskResponseDetails.fromJson(Map<String, dynamic> json) {
    return WalkTaskResponseDetails(
      distance: json['distance'] as double,
      duration: json['duration'] as int,
      steps: json['steps'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'distance': distance,
      'duration': duration,
      'steps': steps,
    };
  }
}