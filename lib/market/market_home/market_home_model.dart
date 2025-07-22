import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/index.dart';
import 'market_home_widget.dart' show MarketHomeWidget;
import 'package:flutter/material.dart';

class MarketHomeModel extends FlutterFlowModel<MarketHomeWidget> {
  ///  Local state fields for this page.

  int? first = 1;

  ///  State fields for stateful widgets in this page.

  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels1;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels1;
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels2;
  // Models for emptylist dynamic component.
  late FlutterFlowDynamicModels<EmptylistModel> emptylistModels2;

  @override
  void initState(BuildContext context) {
    cardmarketModels1 = FlutterFlowDynamicModels(() => CardmarketModel());
    emptylistModels1 = FlutterFlowDynamicModels(() => EmptylistModel());
    cardmarketModels2 = FlutterFlowDynamicModels(() => CardmarketModel());
    emptylistModels2 = FlutterFlowDynamicModels(() => EmptylistModel());
  }

  @override
  void dispose() {
    cardmarketModels1.dispose();
    emptylistModels1.dispose();
    cardmarketModels2.dispose();
    emptylistModels2.dispose();
  }
}
