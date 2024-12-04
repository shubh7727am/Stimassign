class SelectedOption {
  String? selectedOption;
  String? state;
  int? index;


  SelectedOption({this.selectedOption, this.state, this.index });


  SelectedOption copyWith({
    String? selectedOption,
    String? state,
    int? index,
  }) {
    return SelectedOption(
      selectedOption: selectedOption ?? this.selectedOption,
      state: state ?? this.state, index: index??  this.index
    );
  }
}
