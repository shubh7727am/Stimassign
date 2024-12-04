import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/data/models/question/selected_option.dart';

class OptionButtonViewModel extends StateNotifier<SelectedOption?>{
 OptionButtonViewModel() : super(null);



  void optionSelected(String selectedOptionText,int index ){
    state = SelectedOption(state: "selected", selectedOption: selectedOptionText , index: index);
  }
  void optionCorrect(){
    state = state!.copyWith(state: "correct");
  }
 void optionInCorrect(){
   state = state!.copyWith(state: "incorrect");
 }
 void clearOption(){
    state = SelectedOption();
 }
 void logout(){
   state = null;
 }

}

final selectedOptionProvider = StateNotifierProvider<OptionButtonViewModel, SelectedOption?>((ref) {
  return OptionButtonViewModel();
});