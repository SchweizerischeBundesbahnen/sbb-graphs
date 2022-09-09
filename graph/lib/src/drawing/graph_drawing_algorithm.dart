import 'package:graph/graph.dart';

/// Interface for all graph drawing algorithms.
abstract class GraphDrawingAlgorithm {
  const GraphDrawingAlgorithm._();

  Graph run(Graph graph);
}
