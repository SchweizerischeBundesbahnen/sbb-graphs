import 'dart:convert';

import 'package:antlr4/antlr4.dart';
import 'package:graph/graph.dart';
import 'package:graph/src/io/dot/antlr/DOTBaseListener.dart';
import 'package:graph/src/io/dot/antlr/DOTLexer.dart';
import 'package:graph/src/io/dot/antlr/DOTParser.dart';
import 'package:graph/src/io/dot/dot_types.dart';

class DOTDecoder extends Converter<String, Graph> {
  const DOTDecoder();

  @override
  Graph convert(String input) {
    final inputStream = InputStream.fromString(input);
    final lexer = DOTLexer(inputStream);
    final tokenStream = CommonTokenStream(lexer);
    final parser = DOTParser(tokenStream)..buildParseTree = true;
    final tree = parser.graph();

    final nodeListener = _NodeListener();
    final edgeListener = _EdgeListener();
    ParseTreeWalker.DEFAULT.walk(nodeListener, tree);
    ParseTreeWalker.DEFAULT.walk(edgeListener, tree);

    final vertices = nodeListener.nodes.values.map((e) => e.toVertex());
    final edges = edgeListener.edges.values.map((e) => e.toEdge());
    return DirectedGraph(
      id: nodeListener.graphId,
      vertices: vertices.toList(),
      edges: edges.toList(),
    );
  }
}

// Listeners.

class _NodeListener extends DOTBaseListener {
  _NodeListener();

  final nodes = <String, DOTNode>{};
  final nodeAttributes = <String, dynamic>{};

  late String graphId;

  @override
  void enterGraph(GraphContext ctx) {
    final id = ctx.id_();
    if (id != null) graphId = id.text;
  }

  @override
  // ignore: non_constant_identifier_names
  void enterNode_id(Node_idContext ctx) {
    final id = ctx.id_()?.text;
    if (id == null || id.isEmpty) return;
    final node = nodes[id] ?? DOTNode(id: id);
    nodes[id] = node.updateAttributes(nodeAttributes);
  }

  @override
  // ignore: non_constant_identifier_names
  void enterNode_stmt(Node_stmtContext ctx) {
    final attrCtx = ctx.attr_list();
    _populateAttrs(attrCtx, nodeAttributes);
  }

  @override
  // ignore: non_constant_identifier_names
  void exitNode_stmt(Node_stmtContext ctx) {
    nodeAttributes.clear();
  }
}

class _EdgeListener extends DOTBaseListener {
  _EdgeListener();

  final edges = <String, DOTEdge>{};

  _GraphCtx graphCtx = _GraphCtx(null);
  _EdgeCtx? edgeCtx;

  @override
  // ignore: non_constant_identifier_names
  void enterNode_id(Node_idContext ctx) {
    final nodeId = ctx.id_()!.text;
    graphCtx.addNode(nodeId);
  }

  @override
  void enterSubgraph(SubgraphContext ctx) {
    graphCtx = _GraphCtx(graphCtx);
  }

  @override
  void exitSubgraph(SubgraphContext ctx) {
    graphCtx = graphCtx.parent!;
  }

  @override
  // ignore: non_constant_identifier_names
  void enterEdge_stmt(Edge_stmtContext ctx) {
    edgeCtx = _EdgeCtx(
      edgeCtx,
      _GraphCtx(graphCtx),
      _GraphCtx(graphCtx),
      ctx.attr_list(),
    );
    graphCtx = edgeCtx!.src; // point to src, next node/subgraph populates it
  }

  @override
  // ignore: non_constant_identifier_names
  void exitEdge_stmt(Edge_stmtContext ctx) {
    _addEdges(
      edgeCtx!.src.graph,
      edgeCtx!.dest.graph,
      edgeCtx!.attrs,
    );
    // Leave nested ctx, Pop previous parent ctx.
    edgeCtx = edgeCtx!.parent;
    graphCtx = graphCtx.parent!;
  }

  @override
  void enterEdgeop(EdgeopContext ctx) {
    final edgeCtx = this.edgeCtx;
    if (edgeCtx == null) {
      throw StateError('Edge context is null.');
    }

    _addEdges(edgeCtx.src.graph, edgeCtx.dest.graph, edgeCtx.attrs);

    if (edgeCtx.srcFlag) {
      // pointing to src, shift to populate dest
      graphCtx = edgeCtx.dest;
      edgeCtx.srcFlag = false;
    } else {
      // pointing to dest already, shift src/dest for next edgeop
      edgeCtx.src = edgeCtx.dest;
      edgeCtx.dest = _GraphCtx(graphCtx.parent);
      graphCtx = edgeCtx.dest;
    }
  }

  void _addEdges(
    Set<String> srcSet,
    Set<String> destSet,
    Map<String, dynamic> attrs,
  ) {
    for (String src in srcSet) {
      for (String dest in destSet) {
        _addEdge(src, dest, attrs);
      }
    }
  }

  void _addEdge(String src, String dest, Map<String, dynamic> attrs) {
    final id = '$src-$dest';
    final edge = edges[id] ?? DOTEdge(id: id, node1: src, node2: dest);
    edges[id] = edge.updateAttributes(attrs);
  }
}

class _GraphCtx {
  _GraphCtx(this.parent);

  final _GraphCtx? parent;
  final graph = <String>{};

  void addNode(String nodeId) {
    graph.add(nodeId);
    parent?.addNode(nodeId);
  }

  @override
  String toString() {
    return graph.toString();
  }
}

class _EdgeCtx {
  _EdgeCtx(
    this.parent,
    this.src,
    this.dest,
    Attr_listContext? ctx,
  ) {
    _populateAttrs(ctx, attrs);
  }

  _EdgeCtx? parent;
  _GraphCtx src;
  _GraphCtx dest;
  bool srcFlag = true;
  Map<String, dynamic> attrs = <String, dynamic>{};

  @override
  String toString() {
    return '$src -> $dest';
  }
}

// Internal top level functions.

void _populateAttrs(Attr_listContext? ctx, Map<String, dynamic> attrs) {
  if (ctx == null) return;
  attrs.clear();
  for (var listCtx in ctx.a_lists()) {
    final kv = <dynamic>[null, null];
    var i = 0;
    for (var idCtx in listCtx.id_s()) {
      final idObj =
          idCtx.ID() ?? idCtx.NUMBER() ?? idCtx.STRING() ?? idCtx.HTML_STRING();

      final text = idObj!.text;
      kv[i++] = text;
      if (i > 1) {
        // The trimming should probably be implemented by changing the parser itself
        attrs[kv[0]] = _trimQuotes(kv[1]);
        i = 0;
      }
    }
  }
}

String? _trimQuotes(String value) {
  if (value.length >= 2 && value.startsWith('"') && value.endsWith('"')) {
    return value.substring(1, value.length - 1);
  }

  return value;
}
