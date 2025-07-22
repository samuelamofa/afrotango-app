import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/index.dart';
import 'market_seach_widget.dart' show MarketSeachWidget;
import 'package:flutter/material.dart';

class MarketSeachModel extends FlutterFlowModel<MarketSeachWidget> {
  ///  Local state fields for this page.

  DocumentReference? catigoryRef;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductRecord> simpleSearchResults = [];
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels1;
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels2;

  @override
  void initState(BuildContext context) {
    cardmarketModels1 = FlutterFlowDynamicModels(() => CardmarketModel());
    cardmarketModels2 = FlutterFlowDynamicModels(() => CardmarketModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardmarketModels1.dispose();
    cardmarketModels2.dispose();
  }
}
