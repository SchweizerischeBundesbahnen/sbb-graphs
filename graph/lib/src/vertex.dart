import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart';

@sealed
@immutable
class Vertex<T> {
  const Vertex.aabb({
    required this.id,
    this.data,
    required this.aabb,
  });

  factory Vertex({
    required String id,
    T? data,
    double left = 0,
    double top = 0,
    double width = 0,
    double height = 0,
  }) {
    return Vertex.aabb(
      id: id,
      data: data,
      aabb: Aabb2.minMax(
        Vector2(left, top),
        Vector2(left + width, top + height),
      ),
    );
  }

  /// The unique id of this vertex.
  final String id;

  /// The vertex data or null if this vertex has no data.
  final T? data;

  /// The 2-dimensional axis-aligned bounding box of this vertex.
  final Aabb2 aabb;

  /// The x coordinate of the left side of this vertex.
  double get left => aabb.min.x;

  /// The y coordinate of the top side of this vertex.
  double get top => aabb.min.y;

  /// The x coordinate of the right side of this vertex.
  double get right => aabb.max.x;

  /// The y coordinate of the bottom side of this vertex.
  double get bottom => aabb.max.y;

  /// The width of this vertex.
  double get width => right - left;

  /// The height of this vertex.
  double get height => bottom - top;

  /// Moves this vertex by [dx] and [dy].
  ///
  /// Returns a copy of this vertex where the bounds are updated.
  Vertex moveBy(double dx, double dy) {
    return Vertex(
      id: id,
      data: data,
      left: left + dx,
      top: top + dy,
      width: width,
      height: height,
    );
  }

  /// Moves this vertex to the given [left] and [top] coordinates.
  ///
  /// Returns a copy of this vertex where the bounds are updated.
  Vertex moveTo(double left, double top) {
    return Vertex(
      id: id,
      data: data,
      left: left,
      top: top,
      width: width,
      height: height,
    );
  }

  /// Resizes this vertex to the given [width] and [height].
  ///
  /// Returns a copy of this vertex where the bounds are updated.
  Vertex resize(double width, double height) {
    return Vertex(
      id: id,
      data: data,
      left: left,
      top: top,
      width: width,
      height: height,
    );
  }

  /// Returns whether [other] is equal to this vertex.
  ///
  /// Two vertices are equal if their ids are equal.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Vertex && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  String toString() {
    return 'Vertex($id)';
  }
}
