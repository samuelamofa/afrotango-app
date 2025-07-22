import '/event/cardevent/card1/card1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lis_eventforyou_widget.dart' show LisEventforyouWidget;
import 'package:flutter/material.dart';

class LisEventforyouModel extends FlutterFlowModel<LisEventforyouWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card1 dynamic component.
  late FlutterFlowDynamicModels<Card1Model> card1Models;

  @override
  void initState(BuildContext context) {
    card1Models = FlutterFlowDynamicModels(() => Card1Model());
  }

  @override
  void dispose() {
    card1Models.dispose();
  }
}
