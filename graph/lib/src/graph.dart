import 'package:graph/graph.dart';
import 'package:vector_math/vector_math_64.dart';

/// An class for graph-structured data, whose vertices and edges are unique.
///
/// A graph is composed of a list of vertices and a list of edges connecting
/// pairs of vertices.
abstract class Graph {
  const Graph._();

  /// The unique id of this graph.
  String get id;

  /// The number of vertices in this graph.
  int get vertexCount;

  /// A fixed-length list that contains all vertices.
  List<Vertex> get vertices;

  /// A fixed-length list that contains all vertex ids.
  List<String> get vertexIds;

  /// The number of edges in this graph.
  int get edgeCount;

  /// A fixed-length list that contains all edges.
  List<Edge> get edges;

  /// A fixed-length list that contains all edge ids.
  List<String> get edgeIds;

  /// The 2D axis-aligned bounding box of this graph.
  Aabb2 get aabb;

  /// Whether the graph contains any vertices or edges.
  bool get isEmpty;

  /// Returns whether this graph contains a vertex with the given [id].
  bool containsVertex(String? id);

  /// Returns the vertex with the given [id].
  ///
  /// Throws [StateError] if no vertex with the given id exists.
  Vertex vertex(String id);

  /// Returns the vertex with the given [id] or `null` if no vertex with that
  /// id exists.
  Vertex? vertexOrNull(String? id);

  /// Adds the given [vertex] to this graph.
  ///
  /// Returns `true` if the vertex was added to the graph or `false` if the
  /// graph already contains a vertex that is equal to the given vertex.
  bool addVertex(Vertex vertex);

  /// Updates the given [vertex].
  ///
  /// Returns `true` if the vertex was updated or `false` if the graph does not
  /// contain a vertex that is equal to the given vertex.
  bool updateVertex(Vertex vertex);

  /// Removes the given [vertex] and all edges where the vertex is source or
  /// destination from this graph.
  ///
  /// Returns `true` if the vertex was removed or `false` if removing the
  /// vertex failed.
  bool removeVertex(Vertex vertex);

  /// Returns a fixed-length list that contains all predecessors of the vertex
  /// with the given [id].
  List<Vertex> predecessors(String? id);

  /// Returns a fixed-length list that contains all successors of the vertex
  /// with the given [id].
  List<Vertex> successors(String? id);

  /// Returns `true` if the given [vertex] is a root vertex or `false` if the
  /// vertex has predecessors.
  bool isRoot(Vertex vertex);

  /// Returns a fixed-length list that contains all root vertices.
  List<Vertex> roots();

  /// Returns `true` if the given [vertex] is a leaf vertex or `false` if the
  /// vertex has successors.
  bool isLeaf(Vertex vertex);

  /// Returns a fixed-length list that contains all leaf vertices.
  List<Vertex> leafs();

  /// Returns whether this graph contains an edge with the given [id].
  bool containsEdge(String? id);

  /// Returns the edge with the given [id].
  ///
  /// Throws [StateError] if no edge with the given id exists.
  Edge edge(String id);

  /// Returns the edge with the given [id] or `null` if no edge with that id
  /// exists.
  Edge? edgeOrNull(String? id);

  /// Adds the given [edge] to this graph.
  ///
  /// If the source or destination vertices are not in this graph they will
  /// also be added.
  ///
  /// Returns `true` if the edge was added to the graph or `false` if the graph
  /// already contains an edge that is equal to the given edge.
  bool addEdge(Edge edge);

  /// Updates the given [edge].
  ///
  /// Returns `true` if the edge was updated or `false` if the graph does not
  /// contain an edge that is equal to the given edge.
  bool updateEdge(Edge edge);

  /// Removes [edge] from this graph.
  ///
  /// Returns `true` if the edge was removed or `false` if removing the edge
  /// failed.
  bool removeEdge(Edge edge);

  /// Creates a copy of this graph.
  Graph copy();
}
