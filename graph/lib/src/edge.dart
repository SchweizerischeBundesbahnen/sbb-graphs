import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart';

/// An edge is (together with vertices) one of the two fundamental units out of
/// which graphs are constructed.
///
/// Each edge has two vertices to which it is attached, called its endpoints.
@sealed
@immutable
class Edge {
  const Edge({
    required this.id,
    required this.source,
    required this.destination,
    this.route = const [],
  });

  /// The unique id of this edge.
  final String id;

  /// The id of the source vertex of this edge.
  final String source;

  /// The id of the destination vertex of this edge.
  final String destination;

  /// The route of this edge.
  final List<Vector2> route;

  /// The endpoints of this edge.
  List<String> get endpoints {
    return [source, destination];
  }

  /// The axis-aligned bounding box of this edge.
  Aabb2 get aabb {
    if (route.isEmpty) {
      return Aabb2();
    }

    double left = double.maxFinite;
    double top = double.maxFinite;
    double right = 0.0;
    double bottom = 0.0;

    for (var point in route) {
      left = math.min(left, point.x);
      top = math.min(top, point.y);
      right = math.max(right, point.x);
      bottom = math.max(bottom, point.y);
    }

    final min = Vector2(left, top);
    final max = Vector2(right, bottom);
    return Aabb2.minMax(min, max);
  }

  /// The edge in reverse order.
  ///
  /// The reversed edge will have the same id as this edge.
  Edge get reversed {
    return Edge(
      id: id,
      source: destination,
      destination: source,
      route: route.reversed.toList(),
    );
  }

  /// Returns whether the given [vertexId] is equal to source.
  bool isSource(String? vertexId) {
    if (vertexId == null || vertexId.isEmpty) return false;
    return source == vertexId;
  }

  /// Returns whether the given [vertexId] is equal to destination.
  bool isDestination(String? vertexId) {
    if (vertexId == null || vertexId.isEmpty) return false;
    return destination == vertexId;
  }

  /// Returns whether the given [vertexId] is equal to either source or
  /// destination.
  bool isSourceOrDestination(String? vertexId) {
    if (vertexId == null || vertexId.isEmpty) return false;
    return source == vertexId || destination == vertexId;
  }

  /// Returns whether [other] is equal to this.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Edge &&
        other.id == id &&
        other.source == source &&
        other.destination == destination &&
        ListEquality().equals(other.route, route);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      source,
      destination,
      Object.hashAll(route),
    );
  }

  @override
  String toString() {
    return 'Edge($id)';
  }
}
