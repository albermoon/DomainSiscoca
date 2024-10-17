import 'task_details.dart';

class SurveyTaskDetails implements TaskDetails {
  final Map<String, dynamic> questions;

  SurveyTaskDetails({required this.questions});

  factory SurveyTaskDetails.fromJson(Map<String, dynamic> json) {
    return SurveyTaskDetails(
      questions: json['questions'] as Map<String, dynamic>? ?? {},
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'questions': questions,
    };
  }
}