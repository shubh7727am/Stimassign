import 'package:stimassign/data/models/excercise_model.dart';
import 'package:stimassign/data/models/question_model.dart';

class Repository {
  // static final Map<int, List> dayExercises = {
  //   1: ExerciseRepository.day1,
  //   2: ExerciseRepository.day2,
  //   3: ExerciseRepository.day3,
  //   4: ExerciseRepository.day4,
  //   5: ExerciseRepository.day5,
  //   6: ExerciseRepository.day6,
  // };
  static final Map<int, String> daysData = {
    1: "Adjectives",
    2: "Adverbs",
    3: "Conjunctions",
    4: "Prefix Suffix",
    5: "Sentence Structure",
    6: "Verbs",
  };
  static final Map<int, List<Exercise>> exerciseData = {
    1: [
      Exercise(
          imageAsset: "assets/images/adjectives.jpg",
          name: "Compound Adjectives",
          score: 0),
      Exercise(
          imageAsset: "assets/images/participles.jpg",
          name: "Participle Adjectives",
          score: 0),
      Exercise(
          imageAsset: "assets/images/order.jpg",
          name: "Order of Adjectives",
          score: 0),
    ],
    2: [
      Exercise(
          imageAsset: "assets/images/manner_adverbs.jpg",
          name: "Adverbs of Manner in Complex Sentences",
          score: 0),
      Exercise(
          imageAsset: "assets/images/comparative_adverbs.jpg",
          name: "Comparative and Superlative Adverbs",
          score: 0),
    ],
    3: [
      Exercise(
          imageAsset: "assets/images/correlative_conjunctions.jpg",
          name: "Correlative Conjunctions",
          score: 0),
      Exercise(
          imageAsset: "assets/images/subordinating_conjunctions.jpg",
          name: "Subordinating Conjunctions in Academic Context",
          score: 0),
    ],
    4: [
      Exercise(
          imageAsset: "assets/images/scientific_prefixes.jpg",
          name: "Scientific and Academic Prefixes",
          score: 0),
      Exercise(
          imageAsset: "assets/images/advanced_suffixes.jpg",
          name: "Advanced Suffixes in Technical Context",
          score: 0),
    ],
    5: [
      Exercise(
          imageAsset: "assets/images/inverted_sentence_structure.jpg",
          name: "Inverted Sentence Structures",
          score: 0),
      Exercise(
          imageAsset: "assets/images/parallel_structure.jpg",
          name: "Parallel Structure in Complex Sentences",
          score: 0),
    ],
    6: [
      Exercise(
          imageAsset: "assets/images/perfect_progressive_tenses.jpg",
          name: "Perfect Progressive Tenses",
          score: 0),
      Exercise(
          imageAsset: "assets/images/modal_perfect_verbs.jpg",
          name: "Modal Perfect Verbs",
          score: 0),
      Exercise(
          imageAsset: "assets/images/subjunctive_mood.jpg",
          name: "Subjunctive Mood",
          score: 0),
    ],
  };

  static final Map<int, Map<int, List<Question>>> questionData = {
    1: {
      1: [
        Question(
          day: 1,
          exercise: 1,
          question:
              "The company implemented a _ security protocol for their data centers.",
          options: [
            "cutting-edge",
            "cutting edge",
            "edge-cutting",
            "edge cutting"
          ],
          answer: "cutting-edge",
        ),
        Question(
          day: 1,
          exercise: 1,
          question:
              "The physicist presented a _ theory about quantum entanglement.",
          options: [
            "ground breaking",
            "ground-breaking",
            "breaking-ground",
            "break-grounding"
          ],
          answer: "ground-breaking",
        ),
        Question(
          day: 1,
          exercise: 1,
          question:
              "The expedition required _ equipment for the harsh Antarctic conditions.",
          options: [
            "military grade",
            "military-grade",
            "grade-military",
            "grade military"
          ],
          answer: "military-grade",
        ),
      ],
      2: [
        Question( day: 1,
          exercise: 2,
          question:
              "The _ evidence presented at the trial changed the jury's perspective.",
          options: ["overwhelming", "overwhelmed", "overwhelm", "overwhelms"],
          answer: "overwhelming",
        ),
        Question(
          day: 1,
          exercise: 2,
          question:
              "The archaeologists discovered a _ manuscript in the ancient temple.",
          options: ["fascinated", "fascinating", "fascinate", "fascinates"],
          answer: "fascinating",
        ),
      ],
      3: [
        Question(
          day: 1,
          exercise: 3,
          question: "She purchased a _ briefcase for her new job.",
          options: [
            "leather expensive Italian",
            "Italian expensive leather",
            "expensive Italian leather",
            "expensive leather Italian"
          ],
          answer: "expensive Italian leather",
        ),
        Question(
          day: 1,
          exercise: 3,
          question: "The museum displayed a _ artifact from the Ming Dynasty.",
          options: [
            "porcelain ancient valuable",
            "valuable ancient porcelain",
            "ancient valuable porcelain",
            "porcelain valuable ancient"
          ],
          answer: "valuable ancient porcelain",
        ),
      ]
    },
    2: {
      1: [
        Question(
          day: 2,
          exercise: 1,
          question:
              "The soprano _ executed the challenging aria, earning a standing ovation.",
          options: ["flawless", "flawlessly", "flawlessness", "flawlessing"],
          answer: "flawlessly",
        ),
        Question(
          day: 2,
          exercise: 1,
          question:
              "The quantum computer _ processed the complex algorithms, surpassing traditional computing methods.",
          options: ["efficient", "efficiency", "efficiently", "efficienting"],
          answer: "efficiently",
        ),
      ],
      2: [
        Question(
          day: 2,
          exercise: 2,
          question:
              "Among all the competitors, Sarah completed the triathlon _ than expected.",
          options: [
            "more impressively",
            "more impressive",
            "most impressively",
            "impressive"
          ],
          answer: "more impressively",
        ),
        Question(
          day: 2,
          exercise: 2,
          question:
              "The financial analysis was presented _ of all the quarterly reports.",
          options: [
            "more comprehensively",
            "most comprehensively",
            "more comprehensive",
            "comprehensive"
          ],
          answer: "most comprehensively",
        ),
        Question(
          day: 2,
          exercise: 2,
          question:
              "The AI system performed _ in the latest benchmarking tests.",
          options: [
            "more sophisticated",
            "sophisticatedly",
            "most sophisticatedly",
            "sophisticated"
          ],
          answer: "most sophisticatedly",
        ),
      ]
    },
    3: {
      1: [
        Question(
          day: 3,
          exercise: 1,
          question:
              "_ did the research paper receive acclaim for its methodology, _ it was praised for its innovative conclusions.",
          options: [
            "Not only / but also",
            "Either / or",
            "Neither / nor",
            "Both / and"
          ],
          answer: "Not only / but also",
        ),
        Question(
          day: 3,
          exercise: 1,
          question:
              "_ the quantum theory _ the string theory could fully explain the observed phenomena.",
          options: [
            "Both / and",
            "Either / or",
            "Neither / nor",
            "Not only / but also"
          ],
          answer: "Neither / nor",
        ),
      ],
      2: [
        Question(
          day: 3,
          exercise: 2,
          question:
              "The experiment yielded unexpected results _ the researchers followed the protocol precisely.",
          options: ["although", "because", "unless", "if"],
          answer: "although",
        ),
        Question(
          day: 3,
          exercise: 2,
          question:
              "The archaeological team will continue excavating _ they find evidence of the ancient civilization.",
          options: ["unless", "until", "while", "whereas"],
          answer: "until",
        ),
      ]
    },
    4: {
      1: [
        Question(
          day: 4,
          exercise: 1,
          question:
              "The researcher's _ analysis of the data revealed several anomalies.",
          options: ["meta", "pseudo", "anti", "poly"],
          answer: "meta",
        ),
        Question(
          day: 4,
          exercise: 1,
          question:
              "The team developed a _ solution that addressed multiple problems simultaneously.",
          options: ["mono", "uni", "multi", "bi"],
          answer: "multi",
        ),
      ],
      2: [
        Question(
          day: 4,
          exercise: 2,
          question:
              "The _ of quantum mechanics requires extensive mathematical knowledge.",
          options: [
            "complexity",
            "complexify",
            "complexification",
            "complexize"
          ],
          answer: "complexification",
        ),
        Question(
          day: 4,
          exercise: 2,
          question:
              "The artificial intelligence showed remarkable _ in problem-solving tasks.",
          options: ["adaptable", "adaptability", "adaptation", "adaptive"],
          answer: "adaptability",
        ),
      ]
    },
    5: {
      1: [
        Question(
          day: 5,
          exercise: 1,
          question:
              "_ the revolutionary technology that the potential for clean energy became apparent.",
          options: [
            "Not until the scientists developed",
            "Until the scientists developed",
            "The scientists developed until",
            "Developed the scientists until"
          ],
          answer: "Not until the scientists developed",
        ),
        Question(
          day: 5,
          exercise: 1,
          question:
              "_ the complex theories of quantum physics lies a simple mathematical principle.",
          options: ["Beneath", "Under", "Below", "Underneath of"],
          answer: "Beneath",
        ),
      ],
      2: [
        Question(
          day: 5,
          exercise: 2,
          question:
              "The research involved _ data, analyzing statistical patterns, and presenting conclusions.",
          options: ["to collect", "collecting", "collection of", "collected"],
          answer: "collecting",
        ),
        Question(
          day: 5,
          exercise: 2,
          question: "The CEO's strategy was _, innovative, and transformative.",
          options: ["being bold", "to be bold", "bold", "boldly"],
          answer: "bold",
        ),
      ]
    },
    6: {
      1: [
        Question(
          day: 6,
          exercise: 1,
          question:
              "By next year, the scientists _ on this project for a decade.",
          options: [
            "will have been working",
            "will be working",
            "would have been working",
            "would be working"
          ],
          answer: "will have been working",
        ),
        Question(
          day: 6,
          exercise: 1,
          question:
              "The AI system _ increasingly complex patterns before the anomaly was detected.",
          options: [
            "had been recognizing",
            "has been recognizing",
            "was recognizing",
            "is recognizing"
          ],
          answer: "had been recognizing",
        ),
      ],
      2: [
        Question(
          day: 6,
          exercise: 2,
          question:
              "The experiment _ different results if the temperature had been controlled more precisely.",
          options: [
            "might yield",
            "might have yielded",
            "must yield",
            "must have yielded"
          ],
          answer: "might have yielded",
        ),
        Question(
          day: 6,
          exercise: 2,
          question:
              "The research team _ the deadline, but the equipment malfunction caused delays.",
          options: [
            "could meet",
            "could have met",
            "should meet",
            "should have met"
          ],
          answer: "could have met",
        ),
      ],
      3: [
        Question(
          day: 6,
          exercise: 3,
          question:
              "The ethics committee recommended that the study _ immediately.",
          options: [
            "be terminated",
            "is terminated",
            "was terminated",
            "were terminated"
          ],
          answer: "be terminated",
        ),
        Question(
          day: 6,
          exercise: 3,
          question:
              "The professor suggested that each student _ their own research methodology.",
          options: ["develops", "developed", "develop", "has developed"],
          answer: "develop",
        ),
      ],
    },
  };

// static List getExercisesForDay(int day) {
  //   return dayExercises[day] ?? [];
  // }
}
