import '/event/cardevent/card2/card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lis_events_catigory_widget.dart' show LisEventsCatigoryWidget;
import 'package:flutter/material.dart';

class LisEventsCatigoryModel extends FlutterFlowModel<LisEventsCatigoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for card2 dynamic component.
  late FlutterFlowDynamicModels<Card2Model> card2Models;

  @override
  void initState(BuildContext context) {
    card2Models = FlutterFlowDynamicModels(() => Card2Model());
  }

  @override
  void dispose() {
    card2Models.dispose();
  }
}
