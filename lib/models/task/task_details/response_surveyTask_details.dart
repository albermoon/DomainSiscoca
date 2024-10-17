import 'package:domain/models/task/task_response.dart';

class SurveyTaskResponseDetails implements TaskResponseDetails {
  final Map<String, dynamic> answers;

  SurveyTaskResponseDetails({required this.answers});

  factory SurveyTaskResponseDetails.fromJson(Map<String, dynamic> json) {
    return SurveyTaskResponseDetails(
      answers: json['answers'] as Map<String, dynamic>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'answers': answers,
    };
  }
}