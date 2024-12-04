// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stimassign/data/models/day_model.dart';
//
// import '../models/excercise_model.dart';
// import '../models/user_progress.dart';
//
// final userProgressProvider = StateNotifierProvider<UserProgressNotifier, UserProgress>((ref) {
//   return UserProgressNotifier();
// });
//
// class UserProgressNotifier extends StateNotifier<UserProgress> {
//   UserProgressNotifier()
//       : super(UserProgress(completedDays: [], completedExercises: []));
//
//
//   void addCompletedExercise(Exercise exercise) {
//     final updatedExercises = [...state.completedExercises, exercise];
//     state = state.copyWith(completedExercises: updatedExercises);
//   }
//
//
//   void addCompletedDay(Day day) {
//     final updatedDays = [...state.completedDays, day];
//     state = state.copyWith(completedDays: updatedDays);
//   }
// }
