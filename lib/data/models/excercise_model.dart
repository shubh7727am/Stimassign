import 'dart:convert';

class Exercise {
  String? imageAsset;
  String? name;
  double? score;
  String? currentState;
  String? currentQuestion;
  int? day;

  Exercise({
    this.day,
     this.imageAsset,
     this.name,
    this.score,
    this.currentQuestion,
    this.currentState,
  });

  // Convert Exercise to Map for JSON encoding
  Map<String, dynamic> toMap() {
    return {
      'imageAsset': imageAsset,
      'name': name,
      'score': score,
      'currentState': currentState,
      'currentQuestion': currentQuestion,
      "day" : day,
    };
  }

  // Convert Map to Exercise
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      imageAsset: map['imageAsset'],
      name: map['name'],
      score: map['score'],
      day: map['day'],
      currentState: map['currentState'],
      currentQuestion: map['currentQuestion'],
    );
  }

  // Serialize to JSON
  String toJson() => json.encode(toMap());

  // Deserialize from JSON
  factory Exercise.fromJson(String jsonStr) =>
      Exercise.fromMap(json.decode(jsonStr));

  Exercise copyWith({
    String? imageAsset,
    String? name,
    double? score,
    int? day,
    String? currentState,
    String? currentQuestion,
  }) {
    return Exercise(
      imageAsset: imageAsset ?? this.imageAsset,
      name: name ?? this.name,
      score: score ?? this.score,
      day: day?? this.day,
      currentState: currentState ?? this.currentState,
      currentQuestion: currentQuestion ?? this.currentQuestion,
    );}
}
