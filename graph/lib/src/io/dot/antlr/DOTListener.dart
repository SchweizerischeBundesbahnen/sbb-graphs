// Generated from DOT.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'DOTParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [DOTParser].
abstract class DOTListener extends ParseTreeListener {
  /// Enter a parse tree produced by [DOTParser.graph].
  /// [ctx] the parse tree
  void enterGraph(GraphContext ctx);
  /// Exit a parse tree produced by [DOTParser.graph].
  /// [ctx] the parse tree
  void exitGraph(GraphContext ctx);

  /// Enter a parse tree produced by [DOTParser.stmt_list].
  /// [ctx] the parse tree
  void enterStmt_list(Stmt_listContext ctx);
  /// Exit a parse tree produced by [DOTParser.stmt_list].
  /// [ctx] the parse tree
  void exitStmt_list(Stmt_listContext ctx);

  /// Enter a parse tree produced by [DOTParser.stmt].
  /// [ctx] the parse tree
  void enterStmt(StmtContext ctx);
  /// Exit a parse tree produced by [DOTParser.stmt].
  /// [ctx] the parse tree
  void exitStmt(StmtContext ctx);

  /// Enter a parse tree produced by [DOTParser.attr_stmt].
  /// [ctx] the parse tree
  void enterAttr_stmt(Attr_stmtContext ctx);
  /// Exit a parse tree produced by [DOTParser.attr_stmt].
  /// [ctx] the parse tree
  void exitAttr_stmt(Attr_stmtContext ctx);

  /// Enter a parse tree produced by [DOTParser.attr_list].
  /// [ctx] the parse tree
  void enterAttr_list(Attr_listContext ctx);
  /// Exit a parse tree produced by [DOTParser.attr_list].
  /// [ctx] the parse tree
  void exitAttr_list(Attr_listContext ctx);

  /// Enter a parse tree produced by [DOTParser.a_list].
  /// [ctx] the parse tree
  void enterA_list(A_listContext ctx);
  /// Exit a parse tree produced by [DOTParser.a_list].
  /// [ctx] the parse tree
  void exitA_list(A_listContext ctx);

  /// Enter a parse tree produced by [DOTParser.edge_stmt].
  /// [ctx] the parse tree
  void enterEdge_stmt(Edge_stmtContext ctx);
  /// Exit a parse tree produced by [DOTParser.edge_stmt].
  /// [ctx] the parse tree
  void exitEdge_stmt(Edge_stmtContext ctx);

  /// Enter a parse tree produced by [DOTParser.edgeRHS].
  /// [ctx] the parse tree
  void enterEdgeRHS(EdgeRHSContext ctx);
  /// Exit a parse tree produced by [DOTParser.edgeRHS].
  /// [ctx] the parse tree
  void exitEdgeRHS(EdgeRHSContext ctx);

  /// Enter a parse tree produced by [DOTParser.edgeop].
  /// [ctx] the parse tree
  void enterEdgeop(EdgeopContext ctx);
  /// Exit a parse tree produced by [DOTParser.edgeop].
  /// [ctx] the parse tree
  void exitEdgeop(EdgeopContext ctx);

  /// Enter a parse tree produced by [DOTParser.node_stmt].
  /// [ctx] the parse tree
  void enterNode_stmt(Node_stmtContext ctx);
  /// Exit a parse tree produced by [DOTParser.node_stmt].
  /// [ctx] the parse tree
  void exitNode_stmt(Node_stmtContext ctx);

  /// Enter a parse tree produced by [DOTParser.node_id].
  /// [ctx] the parse tree
  void enterNode_id(Node_idContext ctx);
  /// Exit a parse tree produced by [DOTParser.node_id].
  /// [ctx] the parse tree
  void exitNode_id(Node_idContext ctx);

  /// Enter a parse tree produced by [DOTParser.port].
  /// [ctx] the parse tree
  void enterPort(PortContext ctx);
  /// Exit a parse tree produced by [DOTParser.port].
  /// [ctx] the parse tree
  void exitPort(PortContext ctx);

  /// Enter a parse tree produced by [DOTParser.subgraph].
  /// [ctx] the parse tree
  void enterSubgraph(SubgraphContext ctx);
  /// Exit a parse tree produced by [DOTParser.subgraph].
  /// [ctx] the parse tree
  void exitSubgraph(SubgraphContext ctx);

  /// Enter a parse tree produced by [DOTParser.id_].
  /// [ctx] the parse tree
  void enterId_(Id_Context ctx);
  /// Exit a parse tree produced by [DOTParser.id_].
  /// [ctx] the parse tree
  void exitId_(Id_Context ctx);
}