import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/core/core_services/progress_presis.dart';
import 'package:stimassign/data/models/user_model.dart';
import 'package:stimassign/data/models/user_progress.dart';

import '../models/excercise_model.dart';
import '../repo/repo.dart';

class ExerciseViewModel extends StateNotifier<List<Exercise>?> {
  ExerciseViewModel(): super(null);

  void logout(){
    state = null;
  }

  void loadExercisesForDay(int day) async {




    UserProgress? userProgress = await UserProgressStorage().getUserProgress();



    List<Exercise> completedExercises = userProgress?.completedExercises
        ?.where((exercise) => exercise.day == day)
        .toList() ??
        [];


    List<Exercise> allExercises = Repository.exerciseData[day] ?? [];


    Exercise? firstNonCompletedExercise = allExercises.firstWhere(
          (exercise) => !completedExercises.any((completed) => completed.name == exercise.name),
      orElse: () => Exercise(),
    );


    if (firstNonCompletedExercise != null) {
      firstNonCompletedExercise.currentState = "selected"; // Example of an update
    }


    List<Exercise> combinedExercises = [
      ...completedExercises,
      ...allExercises.where((exercise) =>
      !completedExercises.any((completed) => completed.name == exercise.name))
    ];


    state = combinedExercises;

    for(var something in combinedExercises){

    }
  }

  void setState(int exerciseNo, String newState , ) {
    if (state != null && exerciseNo >= 0 && exerciseNo < state!.length) {

      state = [
        for (int i = 0; i < state!.length; i++)
          if (i == exerciseNo)
            state![i].copyWith(currentState: newState)
          else
            state![i],
      ];


    }

  }

  void resetScore(int exerciseNo){

  }

  void saveExerciseToUserProgress(Exercise exercise) async {

    UserProgress? userProgress = await UserProgressStorage().getUserProgress();



    userProgress ??= UserProgress(completedExercises: []);

    if (!userProgress.completedExercises.contains(exercise)) {
      userProgress.completedExercises.add(exercise);
    }

    await UserProgressStorage().saveUserProgress(userProgress);
  }

}


final exerciseProvider = StateNotifierProvider<ExerciseViewModel, List<Exercise>?>((ref) {
  return ExerciseViewModel();
});
