import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextSizeViewModel extends StateNotifier<double> {
  TextSizeViewModel() : super(18.0);

  void toggleSize() {
    state = state == 18.0 ? 22.0 : 18.0;
  }
}

final textSizeProvider = StateNotifierProvider<TextSizeViewModel, double>(
      (ref) => TextSizeViewModel(),
);
