import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/market/card/cardselected/cardselected_widget.dart';
import 'selected_widget.dart' show SelectedWidget;
import 'package:flutter/material.dart';

class SelectedModel extends FlutterFlowModel<SelectedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cardselected component.
  late CardselectedModel cardselectedModel1;
  // Model for cardselected component.
  late CardselectedModel cardselectedModel2;
  // Model for cardselected component.
  late CardselectedModel cardselectedModel3;
  // Models for cardmarket dynamic component.
  late FlutterFlowDynamicModels<CardmarketModel> cardmarketModels;

  @override
  void initState(BuildContext context) {
    cardselectedModel1 = createModel(context, () => CardselectedModel());
    cardselectedModel2 = createModel(context, () => CardselectedModel());
    cardselectedModel3 = createModel(context, () => CardselectedModel());
    cardmarketModels = FlutterFlowDynamicModels(() => CardmarketModel());
  }

  @override
  void dispose() {
    cardselectedModel1.dispose();
    cardselectedModel2.dispose();
    cardselectedModel3.dispose();
    cardmarketModels.dispose();
  }
}
