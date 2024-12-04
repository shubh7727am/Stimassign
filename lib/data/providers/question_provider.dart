import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/data/models/question_model.dart';

import '../models/excercise_model.dart';
import '../repo/repo.dart';

class QuestionModel extends StateNotifier<Question?> {
  QuestionModel(): super(null);

  int totalQuestions(int day,int exercise){
    return Repository.questionData[day]![exercise]!.length ;
  }

  Question loadQuestion(int day , int exercise ,int questionNo) {
    state = Repository.questionData[day]![exercise]![questionNo] ;
  return  Repository.questionData[day]![exercise]![questionNo];
  }

  void logout(){
    state = null;
  }
}

final questionProvider = StateNotifierProvider<QuestionModel, Question?>((ref) {
  return QuestionModel();
});
