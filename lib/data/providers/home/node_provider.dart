import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:stimassign/data/providers/home/path_provider.dart';
import 'package:stimassign/data/repo/repo.dart';
import '../../../core/core_services/progress_presis.dart';
import '../../models/home/node_model.dart';
import '../../models/user_progress.dart';

class NodeViewModel extends StateNotifier<List<NodeModel>> {

  final  Ref ref;
  NodeViewModel(this.ref) : super([]){
    generateInitialNodes();
  }

  // void addNode(NodeModel node) {
  //   state = [...state, node];
  // }



  // Function to get points with constant vertical spacing
  List<Offset> _getPointsWithConstantVerticalSpacing(
      Path path, int numberOfPoints) {
    List<Offset> points = [];
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric metric = pathMetrics.first;

    double length = metric.length;
    double stepSize = length / (numberOfPoints - 1); // Evenly space points

    // List to store points with constant vertical spacing
    for (int i = 0; i < numberOfPoints; i++) {
      double distance = i * stepSize;
      Tangent tangent = metric.getTangentForOffset(distance)!;
      points.add(tangent.position);
    }

    // Sort points by their vertical (y) position to maintain constant vertical spacing
    points.sort((a, b) => a.dy.compareTo(b.dy));

    return points;
  }

  void logout(){
    state = [];
  }

  void saveNodeToUserProgress(NodeModel node) async {


    UserProgress? userProgress = await UserProgressStorage().getUserProgress();

    userProgress ??= UserProgress(completedDays: []);

    if (!userProgress.completedDays.contains(node)) {
      userProgress.completedDays.add(node);
    }

    await UserProgressStorage().saveUserProgress(userProgress);
  }






  Future<void> generateInitialNodes() async {





    // List<NodeModel> allExercises = Repository.daysData;
    //
    //

    //
    //
    // if (firstNonCompletedExercise != null) {
    //   firstNonCompletedExercise.currentState = "selected"; // Example of an update
    // }
    //
    //
    // List<NodeModel> combinedNodes = [
    //   ...completedExercises,
    //   ...allExercises.where((exercise) =>
    //   !completedExercises.any((completed) => completed.day == exercise.name))
    // ];
    //
    //
    // state = combinedNodes;


    UserProgress? userProgress = await UserProgressStorage().getUserProgress();


    List<NodeModel> completedDays = userProgress?.completedDays.toList() ?? [];

    List<NodeModel> nodes = [];
    Map<int,String> days = Repository.daysData;
    await Future.delayed(const Duration(milliseconds: 1));
    Path genPath = ref.watch(pathProvider)!.generatedPath;
    List<Offset> nodeOffsetPoints = _getPointsWithConstantVerticalSpacing(genPath, days.length);


    for(int i=0 ; i < nodeOffsetPoints.length ; i++){
      nodes.add(i== 0 ? NodeModel(nodeOffsetPoints[i],"selected",days[i+1]!) : NodeModel(nodeOffsetPoints[i],"unselected",days[i+1]!));
    }

    NodeModel? firstNonCompletedNode = nodes.firstWhere(
          (exercise) => !completedDays.any((completed) => completed.day == exercise.day),
      orElse: () => NodeModel(const Offset(0,0), "nothing", "1000"),// garbage node
    );
    if (firstNonCompletedNode != NodeModel(const Offset(0,0), "nothing", "1000")) {
      firstNonCompletedNode.state = "selected"; // Example of an update
    }

    List<NodeModel> combinedNodes = [
      ...completedDays,
      ...nodes.where((node) =>
      !completedDays.any((completed) => completed.day == node.day))
    ];



    state = combinedNodes;
  }

  void completedNode(int index){
    // task to do when a node is completed
    // change the color
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(state: "completed") // Update the desired element
        else
          state[i], // Keep other elements unchanged
    ];



  }



  void unselectedNode(int index){
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(state: "unselected") // Update the desired element
        else
          state[i], // Keep other elements unchanged
    ];

    // task to do when node is incomplete and unselected

  }
  void selectedNode(int index) {
    // Create a new list with the updated element
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(state: "selected") // Update the desired element
        else
          state[i], // Keep other elements unchanged
    ];

    // Task to do when node is incomplete and selected
  }



// void removeNode(NodeModel node) {
  //   state = state.where((n) => n != node).toList();
  // }

}

final nodeProvider = StateNotifierProvider<NodeViewModel, List<NodeModel>>((ref) {
  return NodeViewModel(ref);
});

