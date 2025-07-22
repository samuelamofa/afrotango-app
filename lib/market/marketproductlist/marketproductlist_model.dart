import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import 'marketproductlist_widget.dart' show MarketproductlistWidget;
import 'package:flutter/material.dart';

class MarketproductlistModel extends FlutterFlowModel<MarketproductlistWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels1;
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels2;
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels3;

  @override
  void initState(BuildContext context) {
    cardmarketModels1 = FlutterFlowDynamicModels(() => CardmarketModel());
    cardmarketModels2 = FlutterFlowDynamicModels(() => CardmarketModel());
    cardmarketModels3 = FlutterFlowDynamicModels(() => CardmarketModel());
  }

  @override
  void dispose() {
    cardmarketModels1.dispose();
    cardmarketModels2.dispose();
    cardmarketModels3.dispose();
  }
}
