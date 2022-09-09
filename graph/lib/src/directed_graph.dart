import 'package:collection/collection.dart';
import 'package:graph/graph.dart';
import 'package:vector_math/vector_math_64.dart';

class DirectedGraph implements Graph {
  const DirectedGraph._(
    this._id,
    this._vertices,
    this._edges,
    this._adjacencyList,
    this._reverseAdjacencyList,
  );

  factory DirectedGraph({
    required String id,
    required List<Vertex> vertices,
    required List<Edge> edges,
  }) {
    // Vertices
    final vertexById = <String, Vertex>{};
    for (var vertex in vertices) {
      vertexById[vertex.id] = vertex;
    }
    // Edges
    final edgesById = <String, Edge>{};
    final adjacencyList = <String, Set<String>>{};
    final reverseAdjacencyList = <String, Set<String>>{};
    for (var edge in edges) {
      edgesById[edge.id] = edge;
      final s = edge.source;
      final d = edge.destination;
      final sv = adjacencyList[s] ?? {};
      sv.add(d);
      adjacencyList[s] = sv;
      final dv = reverseAdjacencyList[d] ?? {};
      dv.add(s);
      reverseAdjacencyList[d] = dv;
    }
    // Graph.
    return DirectedGraph._(
      id,
      vertexById,
      edgesById,
      adjacencyList,
      reverseAdjacencyList,
    );
  }

  final String _id;
  final Map<String, Vertex> _vertices;
  final Map<String, Edge> _edges;
  final Map<String, Set<String>> _adjacencyList;
  final Map<String, Set<String>> _reverseAdjacencyList;

  @override
  String get id => _id;

  @override
  int get vertexCount {
    return _vertices.values.length;
  }

  @override
  List<Vertex> get vertices {
    return _vertices.values.toList(growable: false);
  }

  @override
  List<String> get vertexIds {
    return _vertices.keys.toList(growable: false);
  }

  @override
  int get edgeCount {
    return _edges.values.length;
  }

  @override
  List<Edge> get edges {
    return _edges.values.toList(growable: false);
  }

  @override
  List<String> get edgeIds {
    return _edges.keys.toList(growable: false);
  }

  @override
  Aabb2 get aabb {
    final vertices = this.vertices;
    final result = Aabb2.copy(vertices.first.aabb);
    for (var vertex in vertices) {
      result.hull(vertex.aabb);
    }
    for (var edge in edges) {
      if (edge.route.isNotEmpty) {
        result.hull(edge.aabb);
      }
    }
    return result;
  }

  @override
  bool get isEmpty {
    return vertexCount == 0 && edgeCount == 0;
  }

  @override
  bool containsVertex(String? id) {
    if (id == null || id.isEmpty) return false;
    return _vertices[id] != null;
  }

  @override
  Vertex vertex(String id) {
    return _vertices[id]!;
  }

  @override
  Vertex? vertexOrNull(String? id) {
    if (id == null || id.isEmpty) return null;
    return _vertices[id];
  }

  @override
  bool addVertex(Vertex vertex) {
    if (containsVertex(vertex.id)) return false;
    _vertices[vertex.id] = vertex;
    return true;
  }

  @override
  bool updateVertex(Vertex vertex) {
    if (!containsVertex(vertex.id)) return false;
    _vertices[vertex.id] = vertex;
    return true;
  }

  @override
  bool removeVertex(Vertex vertex) {
    if (!containsVertex(vertex.id)) return false;
    for (var edge in edges) {
      if (edge.isSource(vertex.id) || edge.isDestination(vertex.id)) {
        removeEdge(edge);
      }
    }
    return _vertices.remove(vertex.id) != null;
  }

  @override
  List<Vertex> predecessors(String? id) {
    if (id == null || id.isEmpty) return const [];
    final result = <Vertex>[];
    final predecessorIds = _reverseAdjacencyList[id] ?? {};
    for (var predecessorId in predecessorIds) {
      final predecessor = vertex(predecessorId);
      result.add(predecessor);
    }
    return result.toList(growable: false);
  }

  @override
  List<Vertex> successors(String? id) {
    if (id == null || id.isEmpty) return const [];
    final result = <Vertex>[];
    final successorIds = _adjacencyList[id] ?? {};
    for (var sid in successorIds) {
      final successor = vertex(sid);
      result.add(successor);
    }
    return result.toList(growable: false);
  }

  @override
  bool isRoot(Vertex vertex) {
    return predecessors(vertex.id).isEmpty;
  }

  @override
  List<Vertex> roots() {
    return _vertices.values.where(isRoot).toList(growable: false);
  }

  @override
  bool isLeaf(Vertex vertex) {
    return successors(vertex.id).isEmpty;
  }

  @override
  List<Vertex> leafs() {
    return _vertices.values.where(isLeaf).toList(growable: false);
  }

  @override
  bool containsEdge(String? id) {
    if (id == null || id.isEmpty) return false;
    return _edges[id] != null;
  }

  @override
  Edge edge(String id) {
    return _edges[id]!;
  }

  @override
  Edge? edgeOrNull(String? id) {
    if (id == null || id.isEmpty) return null;
    return _edges[id];
  }

  @override
  bool addEdge(Edge edge) {
    if (containsEdge(edge.id)) return false;
    for (String vertexId in edge.endpoints) {
      if (!containsVertex(vertexId)) {
        final vertex = Vertex(id: vertexId);
        addVertex(vertex);
      }
    }
    _edges[edge.id] = edge;
    final sv = _adjacencyList[edge.source] ?? {};
    sv.add(edge.destination);
    _adjacencyList[edge.source] = sv;
    final dv = _reverseAdjacencyList[edge.destination] ?? {};
    dv.add(edge.source);
    _reverseAdjacencyList[edge.destination] = dv;
    return true;
  }

  @override
  bool updateEdge(Edge edge) {
    if (!containsEdge(edge.id)) return false;
    _edges[edge.id] = edge;
    return true;
  }

  @override
  bool removeEdge(Edge edge) {
    if (!containsEdge(edge.id)) return false;
    _adjacencyList[edge.source]?.remove(edge.destination);
    _reverseAdjacencyList[edge.destination]?.remove(edge.source);
    return _edges.remove(edge.id) != null;
  }

  @override
  Graph copy() {
    final adjacencyList = _adjacencyList.map((key, value) {
      return MapEntry(key, Set.of(value));
    });

    final reverseAdjacencyList = _reverseAdjacencyList.map((key, value) {
      return MapEntry(key, Set.of(value));
    });

    return DirectedGraph._(
      id,
      Map.from(_vertices),
      Map.from(_edges),
      adjacencyList,
      reverseAdjacencyList,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectedGraph &&
        other.id == id &&
        MapEquality().equals(other._vertices, _vertices) &&
        MapEquality().equals(other._edges, _edges);
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      Object.hashAll(_vertices.values),
      Object.hashAll(_edges.values),
    );
  }

  @override
  String toString() {
    return 'DirectedGraph($id)';
  }
}
