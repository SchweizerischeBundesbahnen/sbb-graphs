import 'package:graph/graph.dart';

abstract class DOTElement {
  const DOTElement({
    required this.id,
    this.atributes = const {},
  });

  final String id;
  final Map<String, dynamic> atributes;
}

class DOTNode extends DOTElement {
  DOTNode({
    required super.id,
    super.atributes,
  });

  DOTNode updateAttributes(Map<String, dynamic> values) {
    final update = Map.of(atributes);
    update.addAll(values);
    return DOTNode(id: id, atributes: update);
  }

  Vertex<Map<String, dynamic>> toVertex() {
    return Vertex(
      id: id,
      data: atributes,
      width: 100,
      height: 100,
    );
  }
}

class DOTEdge extends DOTElement {
  DOTEdge({
    required super.id,
    required this.node1,
    required this.node2,
    super.atributes,
  });

  final String node1;
  final String node2;

  DOTEdge updateAttributes(Map<String, dynamic> values) {
    final update = Map.of(atributes);
    update.addAll(values);
    return DOTEdge(
      id: id,
      node1: node1,
      node2: node2,
      atributes: update,
    );
  }

  Edge toEdge() {
    return Edge(id: id, source: node1, destination: node2);
  }
}
