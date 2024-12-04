import 'dart:convert'; // For encoding/decoding JSON
import 'package:stimassign/data/models/excercise_model.dart';
import 'package:stimassign/data/models/home/node_model.dart';

class UserProgress {
  List<NodeModel> completedDays;
  List<Exercise> completedExercises;
  int currentDay;
  int currentExercise;
  int currentQuestion;

  UserProgress({
    List<NodeModel>? completedDays,
    List<Exercise>? completedExercises,
    int? currentDay,
    int? currentExercise,
    int? currentQuestion,
  })  : completedDays = completedDays ?? [],
        completedExercises = completedExercises ?? [],
        currentDay = currentDay ?? 0,
        currentExercise = currentExercise ?? 0,
        currentQuestion = currentQuestion ?? 0;

  // Convert UserProgress to a map for JSON encoding
  Map<String, dynamic> toMap() {
    return {
      'completedDays': completedDays.map((e) => e.toMap()).toList(),
      'completedExercises': completedExercises.map((e) => e.toMap()).toList(),
      'currentDay': currentDay,
      'currentExercise': currentExercise,
      'currentQuestion': currentQuestion,
    };
  }

  // Convert Map to UserProgress
  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      completedDays: (map['completedDays'] as List?)
          ?.map((e) => NodeModel.fromMap(e))
          .toList() ??
          [],
      completedExercises: (map['completedExercises'] as List?)
          ?.map((e) => Exercise.fromMap(e))
          .toList() ??
          [],
      currentDay: map['currentDay'] ?? 0,
      currentExercise: map['currentExercise'] ?? 0,
      currentQuestion: map['currentQuestion'] ?? 0,
    );
  }

  // Serialize to JSON
  String toJson() => json.encode(toMap());

  // Deserialize from JSON
  factory UserProgress.fromJson(String jsonStr) {
    return UserProgress.fromMap(json.decode(jsonStr) ?? {});
  }
}
