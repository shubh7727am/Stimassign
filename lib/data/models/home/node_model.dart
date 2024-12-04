import 'dart:convert';
import 'dart:ui';

import 'dart:convert';
import 'package:flutter/material.dart';

class NodeModel {
  Offset position;
  String state;
  String day;

  NodeModel(this.position, this.state, this.day);

  Map<String, dynamic> toMap() {
    return {
      'position': {'dx': position.dx, 'dy': position.dy},
      'state': state,
      'day': day,
    };
  }

  factory NodeModel.fromMap(Map<String, dynamic> map) {
    return NodeModel(
      Offset(map['position']['dx'], map['position']['dy']),
      map['state'],
      map['day'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NodeModel.fromJson(String jsonStr) =>
      NodeModel.fromMap(json.decode(jsonStr));

  NodeModel copyWith({Offset? position, String? state, String? day}) {
    return NodeModel(
      position ?? this.position,
      state ?? this.state,
      day ?? this.day,
    );
  }
}
