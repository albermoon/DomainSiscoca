import 'task_details.dart';

class WalkTaskDetails implements TaskDetails {
  final double distance;
  final int duration;
  final int steps;

  WalkTaskDetails({required this.distance, required this.duration, required this.steps});

  factory WalkTaskDetails.fromJson(Map<String, dynamic> json) {
    return WalkTaskDetails(
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      duration: json['duration'] as int? ?? 0,
      steps: json['steps'] as int? ?? 0,
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