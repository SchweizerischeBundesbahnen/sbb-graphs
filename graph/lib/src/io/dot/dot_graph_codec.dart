import 'dart:convert';

import 'package:graph/graph.dart';
import 'package:graph/src/io/dot/dot_decoder.dart';
import 'package:graph/src/io/dot/dot_encoder.dart';

class DOTGraphCodec extends GraphCodec<String> {
  const DOTGraphCodec();

  @override
  Converter<String, Graph> get decoder => const DOTDecoder();

  @override
  Converter<Graph, String> get encoder => const DOTEncoder();
}
