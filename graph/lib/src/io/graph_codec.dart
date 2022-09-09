import 'dart:convert';

import 'package:graph/graph.dart';

class GraphCodecs {
  const GraphCodecs._();

  static const dot = DOTGraphCodec();
}

abstract class GraphCodec<T> extends Codec<Graph, T> {
  const GraphCodec();
}
