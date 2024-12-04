class Score {
  // Static variable to hold the score
  static int _score = 0;

  // Static method to add 1 to the score
  static void addScore() {
    _score += 1;
  }

  // Static method to reset the score to 0
  static void resetScore() {
    _score = 0;
  }

  // Static getter to retrieve the current score
  static int get currentScore => _score;
}