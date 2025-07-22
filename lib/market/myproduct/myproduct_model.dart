import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import 'myproduct_widget.dart' show MyproductWidget;
import 'package:flutter/material.dart';

class MyproductModel extends FlutterFlowModel<MyproductWidget> {
  ///  Local state fields for this page.

  int? llop = 0;

  ///  State fields for stateful widgets in this page.

  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels;

  @override
  void initState(BuildContext context) {
    cardmarketModels = FlutterFlowDynamicModels(() => CardmarketModel());
  }

  @override
  void dispose() {
    cardmarketModels.dispose();
  }
}
