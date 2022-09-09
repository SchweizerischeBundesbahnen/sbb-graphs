import 'package:meta/meta.dart';
import 'package:vector_math/vector_math_64.dart';

@sealed
@immutable
class LineSegment {
  const LineSegment(this.start, this.end);

  final Vector2 start;
  final Vector2 end;

  /// The 2D axis-aligned bounding box of this line segment.
  Aabb2 get aabb {
    return Aabb2.minMax(start, end);
  }

  /// Returns the intersection point if this intersects with [other] or `null`
  /// if the line segments do not intersect.
  Vector2? intersectionPoint(LineSegment other) {
    // https://stackoverflow.com/a/1968345/1589889

    final p0 = start;
    final p1 = end;
    final p2 = other.start;
    final p3 = other.end;
    final s1 = p1 - p0;
    final s2 = p3 - p2;

    final d = -s2.x * s1.y + s1.x * s2.y;
    final s = (-s1.y * (p0.x - p2.x) + s1.x * (p0.y - p2.y)) / d;
    final t = (s2.x * (p0.y - p2.y) - s2.y * (p0.x - p2.x)) / d;

    if (s >= 0 && s <= 1 && t >= 0 && t <= 1) {
      // Intersection detected.
      final ix = p0.x + (t * s1.x);
      final iy = p0.y + (t * s1.y);
      return Vector2(ix, iy);
    }

    // No intersection.
    return null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LineSegment &&
        other.runtimeType == runtimeType &&
        other.start == start &&
        other.end == end;
  }

  @override
  int get hashCode {
    return Object.hash(start, end);
  }

  @override
  String toString() {
    return 'LineSegment(start: $start, end: $end)';
  }
}
