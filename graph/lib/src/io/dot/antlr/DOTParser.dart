// Generated from DOT.g4 by ANTLR 4.10.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'DOTListener.dart';
import 'DOTBaseListener.dart';
const int RULE_graph = 0, RULE_stmt_list = 1, RULE_stmt = 2, RULE_attr_stmt = 3, 
          RULE_attr_list = 4, RULE_a_list = 5, RULE_edge_stmt = 6, RULE_edgeRHS = 7, 
          RULE_edgeop = 8, RULE_node_stmt = 9, RULE_node_id = 10, RULE_port = 11, 
          RULE_subgraph = 12, RULE_id_ = 13;
class DOTParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.10.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_T__6 = 7, TOKEN_T__7 = 8, 
                   TOKEN_T__8 = 9, TOKEN_T__9 = 10, TOKEN_STRICT = 11, TOKEN_GRAPH = 12, 
                   TOKEN_DIGRAPH = 13, TOKEN_NODE = 14, TOKEN_EDGE = 15, 
                   TOKEN_SUBGRAPH = 16, TOKEN_NUMBER = 17, TOKEN_STRING = 18, 
                   TOKEN_ID = 19, TOKEN_HTML_STRING = 20, TOKEN_COMMENT = 21, 
                   TOKEN_LINE_COMMENT = 22, TOKEN_PREPROC = 23, TOKEN_WS = 24;

  @override
  final List<String> ruleNames = [
    'graph', 'stmt_list', 'stmt', 'attr_stmt', 'attr_list', 'a_list', 'edge_stmt', 
    'edgeRHS', 'edgeop', 'node_stmt', 'node_id', 'port', 'subgraph', 'id_'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'{'", "'}'", "';'", "'='", "'['", "']'", "','", "'->'", "'--'", 
      "':'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, null, null, null, null, 
      "STRICT", "GRAPH", "DIGRAPH", "NODE", "EDGE", "SUBGRAPH", "NUMBER", 
      "STRING", "ID", "HTML_STRING", "COMMENT", "LINE_COMMENT", "PREPROC", 
      "WS"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'DOT.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  DOTParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  GraphContext graph() {
    dynamic _localctx = GraphContext(context, state);
    enterRule(_localctx, 0, RULE_graph);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 29;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_STRICT) {
        state = 28;
        match(TOKEN_STRICT);
      }

      state = 31;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_GRAPH || _la == TOKEN_DIGRAPH)) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
      state = 33;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero)) {
        state = 32;
        id_();
      }

      state = 35;
      match(TOKEN_T__0);
      state = 36;
      stmt_list();
      state = 37;
      match(TOKEN_T__1);
      state = 38;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Stmt_listContext stmt_list() {
    dynamic _localctx = Stmt_listContext(context, state);
    enterRule(_localctx, 2, RULE_stmt_list);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 46;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_T__0) | (BigInt.one << TOKEN_GRAPH) | (BigInt.one << TOKEN_NODE) | (BigInt.one << TOKEN_EDGE) | (BigInt.one << TOKEN_SUBGRAPH) | (BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero)) {
        state = 40;
        stmt();
        state = 42;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__2) {
          state = 41;
          match(TOKEN_T__2);
        }

        state = 48;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  StmtContext stmt() {
    dynamic _localctx = StmtContext(context, state);
    enterRule(_localctx, 4, RULE_stmt);
    try {
      state = 57;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 49;
        node_stmt();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 50;
        edge_stmt();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 51;
        attr_stmt();
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 52;
        id_();
        state = 53;
        match(TOKEN_T__3);
        state = 54;
        id_();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 56;
        subgraph();
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Attr_stmtContext attr_stmt() {
    dynamic _localctx = Attr_stmtContext(context, state);
    enterRule(_localctx, 6, RULE_attr_stmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 59;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_GRAPH) | (BigInt.one << TOKEN_NODE) | (BigInt.one << TOKEN_EDGE))) != BigInt.zero))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
      state = 60;
      attr_list();
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Attr_listContext attr_list() {
    dynamic _localctx = Attr_listContext(context, state);
    enterRule(_localctx, 8, RULE_attr_list);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 67; 
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      do {
        state = 62;
        match(TOKEN_T__4);
        state = 64;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero)) {
          state = 63;
          a_list();
        }

        state = 66;
        match(TOKEN_T__5);
        state = 69; 
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      } while (_la == TOKEN_T__4);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  A_listContext a_list() {
    dynamic _localctx = A_listContext(context, state);
    enterRule(_localctx, 10, RULE_a_list);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 79; 
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      do {
        state = 71;
        id_();
        state = 74;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__3) {
          state = 72;
          match(TOKEN_T__3);
          state = 73;
          id_();
        }

        state = 77;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__6) {
          state = 76;
          match(TOKEN_T__6);
        }

        state = 81; 
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      } while ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero));
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Edge_stmtContext edge_stmt() {
    dynamic _localctx = Edge_stmtContext(context, state);
    enterRule(_localctx, 12, RULE_edge_stmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 85;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_NUMBER:
      case TOKEN_STRING:
      case TOKEN_ID:
      case TOKEN_HTML_STRING:
        state = 83;
        node_id();
        break;
      case TOKEN_T__0:
      case TOKEN_SUBGRAPH:
        state = 84;
        subgraph();
        break;
      default:
        throw NoViableAltException(this);
      }
      state = 87;
      edgeRHS();
      state = 89;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__4) {
        state = 88;
        attr_list();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  EdgeRHSContext edgeRHS() {
    dynamic _localctx = EdgeRHSContext(context, state);
    enterRule(_localctx, 14, RULE_edgeRHS);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 96; 
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      do {
        state = 91;
        edgeop();
        state = 94;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_NUMBER:
        case TOKEN_STRING:
        case TOKEN_ID:
        case TOKEN_HTML_STRING:
          state = 92;
          node_id();
          break;
        case TOKEN_T__0:
        case TOKEN_SUBGRAPH:
          state = 93;
          subgraph();
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 98; 
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      } while (_la == TOKEN_T__7 || _la == TOKEN_T__8);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  EdgeopContext edgeop() {
    dynamic _localctx = EdgeopContext(context, state);
    enterRule(_localctx, 16, RULE_edgeop);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 100;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_T__7 || _la == TOKEN_T__8)) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Node_stmtContext node_stmt() {
    dynamic _localctx = Node_stmtContext(context, state);
    enterRule(_localctx, 18, RULE_node_stmt);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 102;
      node_id();
      state = 104;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__4) {
        state = 103;
        attr_list();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Node_idContext node_id() {
    dynamic _localctx = Node_idContext(context, state);
    enterRule(_localctx, 20, RULE_node_id);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 106;
      id_();
      state = 108;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__9) {
        state = 107;
        port();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PortContext port() {
    dynamic _localctx = PortContext(context, state);
    enterRule(_localctx, 22, RULE_port);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 110;
      match(TOKEN_T__9);
      state = 111;
      id_();
      state = 114;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_T__9) {
        state = 112;
        match(TOKEN_T__9);
        state = 113;
        id_();
      }

    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SubgraphContext subgraph() {
    dynamic _localctx = SubgraphContext(context, state);
    enterRule(_localctx, 24, RULE_subgraph);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 120;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SUBGRAPH) {
        state = 116;
        match(TOKEN_SUBGRAPH);
        state = 118;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if ((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero)) {
          state = 117;
          id_();
        }

      }

      state = 122;
      match(TOKEN_T__0);
      state = 123;
      stmt_list();
      state = 124;
      match(TOKEN_T__1);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  Id_Context id_() {
    dynamic _localctx = Id_Context(context, state);
    enterRule(_localctx, 26, RULE_id_);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 126;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((BigInt.one << _la) & ((BigInt.one << TOKEN_NUMBER) | (BigInt.one << TOKEN_STRING) | (BigInt.one << TOKEN_ID) | (BigInt.one << TOKEN_HTML_STRING))) != BigInt.zero))) {
      errorHandler.recoverInline(this);
      } else {
        if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,24,129,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,1,
      0,3,0,30,8,0,1,0,1,0,3,0,34,8,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1,3,1,43,
      8,1,5,1,45,8,1,10,1,12,1,48,9,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,
      2,58,8,2,1,3,1,3,1,3,1,4,1,4,3,4,65,8,4,1,4,4,4,68,8,4,11,4,12,4,69,
      1,5,1,5,1,5,3,5,75,8,5,1,5,3,5,78,8,5,4,5,80,8,5,11,5,12,5,81,1,6,
      1,6,3,6,86,8,6,1,6,1,6,3,6,90,8,6,1,7,1,7,1,7,3,7,95,8,7,4,7,97,8,
      7,11,7,12,7,98,1,8,1,8,1,9,1,9,3,9,105,8,9,1,10,1,10,3,10,109,8,10,
      1,11,1,11,1,11,1,11,3,11,115,8,11,1,12,1,12,3,12,119,8,12,3,12,121,
      8,12,1,12,1,12,1,12,1,12,1,13,1,13,1,13,0,0,14,0,2,4,6,8,10,12,14,
      16,18,20,22,24,26,0,4,1,0,12,13,2,0,12,12,14,15,1,0,8,9,1,0,17,20,
      136,0,29,1,0,0,0,2,46,1,0,0,0,4,57,1,0,0,0,6,59,1,0,0,0,8,67,1,0,0,
      0,10,79,1,0,0,0,12,85,1,0,0,0,14,96,1,0,0,0,16,100,1,0,0,0,18,102,
      1,0,0,0,20,106,1,0,0,0,22,110,1,0,0,0,24,120,1,0,0,0,26,126,1,0,0,
      0,28,30,5,11,0,0,29,28,1,0,0,0,29,30,1,0,0,0,30,31,1,0,0,0,31,33,7,
      0,0,0,32,34,3,26,13,0,33,32,1,0,0,0,33,34,1,0,0,0,34,35,1,0,0,0,35,
      36,5,1,0,0,36,37,3,2,1,0,37,38,5,2,0,0,38,39,5,0,0,1,39,1,1,0,0,0,
      40,42,3,4,2,0,41,43,5,3,0,0,42,41,1,0,0,0,42,43,1,0,0,0,43,45,1,0,
      0,0,44,40,1,0,0,0,45,48,1,0,0,0,46,44,1,0,0,0,46,47,1,0,0,0,47,3,1,
      0,0,0,48,46,1,0,0,0,49,58,3,18,9,0,50,58,3,12,6,0,51,58,3,6,3,0,52,
      53,3,26,13,0,53,54,5,4,0,0,54,55,3,26,13,0,55,58,1,0,0,0,56,58,3,24,
      12,0,57,49,1,0,0,0,57,50,1,0,0,0,57,51,1,0,0,0,57,52,1,0,0,0,57,56,
      1,0,0,0,58,5,1,0,0,0,59,60,7,1,0,0,60,61,3,8,4,0,61,7,1,0,0,0,62,64,
      5,5,0,0,63,65,3,10,5,0,64,63,1,0,0,0,64,65,1,0,0,0,65,66,1,0,0,0,66,
      68,5,6,0,0,67,62,1,0,0,0,68,69,1,0,0,0,69,67,1,0,0,0,69,70,1,0,0,0,
      70,9,1,0,0,0,71,74,3,26,13,0,72,73,5,4,0,0,73,75,3,26,13,0,74,72,1,
      0,0,0,74,75,1,0,0,0,75,77,1,0,0,0,76,78,5,7,0,0,77,76,1,0,0,0,77,78,
      1,0,0,0,78,80,1,0,0,0,79,71,1,0,0,0,80,81,1,0,0,0,81,79,1,0,0,0,81,
      82,1,0,0,0,82,11,1,0,0,0,83,86,3,20,10,0,84,86,3,24,12,0,85,83,1,0,
      0,0,85,84,1,0,0,0,86,87,1,0,0,0,87,89,3,14,7,0,88,90,3,8,4,0,89,88,
      1,0,0,0,89,90,1,0,0,0,90,13,1,0,0,0,91,94,3,16,8,0,92,95,3,20,10,0,
      93,95,3,24,12,0,94,92,1,0,0,0,94,93,1,0,0,0,95,97,1,0,0,0,96,91,1,
      0,0,0,97,98,1,0,0,0,98,96,1,0,0,0,98,99,1,0,0,0,99,15,1,0,0,0,100,
      101,7,2,0,0,101,17,1,0,0,0,102,104,3,20,10,0,103,105,3,8,4,0,104,103,
      1,0,0,0,104,105,1,0,0,0,105,19,1,0,0,0,106,108,3,26,13,0,107,109,3,
      22,11,0,108,107,1,0,0,0,108,109,1,0,0,0,109,21,1,0,0,0,110,111,5,10,
      0,0,111,114,3,26,13,0,112,113,5,10,0,0,113,115,3,26,13,0,114,112,1,
      0,0,0,114,115,1,0,0,0,115,23,1,0,0,0,116,118,5,16,0,0,117,119,3,26,
      13,0,118,117,1,0,0,0,118,119,1,0,0,0,119,121,1,0,0,0,120,116,1,0,0,
      0,120,121,1,0,0,0,121,122,1,0,0,0,122,123,5,1,0,0,123,124,3,2,1,0,
      124,125,5,2,0,0,125,25,1,0,0,0,126,127,7,3,0,0,127,27,1,0,0,0,19,29,
      33,42,46,57,64,69,74,77,81,85,89,94,98,104,108,114,118,120
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class GraphContext extends ParserRuleContext {
  Stmt_listContext? stmt_list() => getRuleContext<Stmt_listContext>(0);
  TerminalNode? EOF() => getToken(DOTParser.TOKEN_EOF, 0);
  TerminalNode? GRAPH() => getToken(DOTParser.TOKEN_GRAPH, 0);
  TerminalNode? DIGRAPH() => getToken(DOTParser.TOKEN_DIGRAPH, 0);
  TerminalNode? STRICT() => getToken(DOTParser.TOKEN_STRICT, 0);
  Id_Context? id_() => getRuleContext<Id_Context>(0);
  GraphContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_graph;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterGraph(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitGraph(this);
  }
}

class Stmt_listContext extends ParserRuleContext {
  List<StmtContext> stmts() => getRuleContexts<StmtContext>();
  StmtContext? stmt(int i) => getRuleContext<StmtContext>(i);
  Stmt_listContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_stmt_list;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterStmt_list(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitStmt_list(this);
  }
}

class StmtContext extends ParserRuleContext {
  Node_stmtContext? node_stmt() => getRuleContext<Node_stmtContext>(0);
  Edge_stmtContext? edge_stmt() => getRuleContext<Edge_stmtContext>(0);
  Attr_stmtContext? attr_stmt() => getRuleContext<Attr_stmtContext>(0);
  List<Id_Context> id_s() => getRuleContexts<Id_Context>();
  Id_Context? id_(int i) => getRuleContext<Id_Context>(i);
  SubgraphContext? subgraph() => getRuleContext<SubgraphContext>(0);
  StmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_stmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterStmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitStmt(this);
  }
}

class Attr_stmtContext extends ParserRuleContext {
  Attr_listContext? attr_list() => getRuleContext<Attr_listContext>(0);
  TerminalNode? GRAPH() => getToken(DOTParser.TOKEN_GRAPH, 0);
  TerminalNode? NODE() => getToken(DOTParser.TOKEN_NODE, 0);
  TerminalNode? EDGE() => getToken(DOTParser.TOKEN_EDGE, 0);
  Attr_stmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_attr_stmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterAttr_stmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitAttr_stmt(this);
  }
}

class Attr_listContext extends ParserRuleContext {
  List<A_listContext> a_lists() => getRuleContexts<A_listContext>();
  A_listContext? a_list(int i) => getRuleContext<A_listContext>(i);
  Attr_listContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_attr_list;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterAttr_list(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitAttr_list(this);
  }
}

class A_listContext extends ParserRuleContext {
  List<Id_Context> id_s() => getRuleContexts<Id_Context>();
  Id_Context? id_(int i) => getRuleContext<Id_Context>(i);
  A_listContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_a_list;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterA_list(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitA_list(this);
  }
}

class Edge_stmtContext extends ParserRuleContext {
  EdgeRHSContext? edgeRHS() => getRuleContext<EdgeRHSContext>(0);
  Node_idContext? node_id() => getRuleContext<Node_idContext>(0);
  SubgraphContext? subgraph() => getRuleContext<SubgraphContext>(0);
  Attr_listContext? attr_list() => getRuleContext<Attr_listContext>(0);
  Edge_stmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_edge_stmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterEdge_stmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitEdge_stmt(this);
  }
}

class EdgeRHSContext extends ParserRuleContext {
  List<EdgeopContext> edgeops() => getRuleContexts<EdgeopContext>();
  EdgeopContext? edgeop(int i) => getRuleContext<EdgeopContext>(i);
  List<Node_idContext> node_ids() => getRuleContexts<Node_idContext>();
  Node_idContext? node_id(int i) => getRuleContext<Node_idContext>(i);
  List<SubgraphContext> subgraphs() => getRuleContexts<SubgraphContext>();
  SubgraphContext? subgraph(int i) => getRuleContext<SubgraphContext>(i);
  EdgeRHSContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_edgeRHS;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterEdgeRHS(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitEdgeRHS(this);
  }
}

class EdgeopContext extends ParserRuleContext {
  EdgeopContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_edgeop;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterEdgeop(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitEdgeop(this);
  }
}

class Node_stmtContext extends ParserRuleContext {
  Node_idContext? node_id() => getRuleContext<Node_idContext>(0);
  Attr_listContext? attr_list() => getRuleContext<Attr_listContext>(0);
  Node_stmtContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_node_stmt;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterNode_stmt(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitNode_stmt(this);
  }
}

class Node_idContext extends ParserRuleContext {
  Id_Context? id_() => getRuleContext<Id_Context>(0);
  PortContext? port() => getRuleContext<PortContext>(0);
  Node_idContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_node_id;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterNode_id(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitNode_id(this);
  }
}

class PortContext extends ParserRuleContext {
  List<Id_Context> id_s() => getRuleContexts<Id_Context>();
  Id_Context? id_(int i) => getRuleContext<Id_Context>(i);
  PortContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_port;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterPort(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitPort(this);
  }
}

class SubgraphContext extends ParserRuleContext {
  Stmt_listContext? stmt_list() => getRuleContext<Stmt_listContext>(0);
  TerminalNode? SUBGRAPH() => getToken(DOTParser.TOKEN_SUBGRAPH, 0);
  Id_Context? id_() => getRuleContext<Id_Context>(0);
  SubgraphContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_subgraph;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterSubgraph(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitSubgraph(this);
  }
}

class Id_Context extends ParserRuleContext {
  TerminalNode? ID() => getToken(DOTParser.TOKEN_ID, 0);
  TerminalNode? STRING() => getToken(DOTParser.TOKEN_STRING, 0);
  TerminalNode? HTML_STRING() => getToken(DOTParser.TOKEN_HTML_STRING, 0);
  TerminalNode? NUMBER() => getToken(DOTParser.TOKEN_NUMBER, 0);
  Id_Context([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_id_;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.enterId_(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is DOTListener) listener.exitId_(this);
  }
}

