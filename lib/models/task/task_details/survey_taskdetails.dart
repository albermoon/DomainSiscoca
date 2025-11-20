import 'task_details.dart';

class SurveyTaskDetails implements TaskDetails {
  final int? surveyId;
  final Map<String, dynamic>? questions;

  SurveyTaskDetails({
    this.surveyId,
    this.questions,
  });

  factory SurveyTaskDetails.fromJson(Map<String, dynamic> json) {
    return SurveyTaskDetails(
      surveyId: json['survey_id'] as int?,
      questions: json['questions'] as Map<String, dynamic>? ?? {},
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      if (surveyId != null) 'survey_id': surveyId,
      if (questions != null) 'questions': questions,
    };
  }
}
